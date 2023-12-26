<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserPhoto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        validator($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => 200,
            'access_token' => $token,
            'token_type' => 'Bearer',
        ]);
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json([
                'status' => 401,
                'message' => 'Unauthorized'
            ]);
        }

        $user = auth()->user();

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => 200,
            'access_token' => $token,
            'token_type' => 'Bearer',
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Tokens Revoked'
        ]);
    }
    public function user(Request $request)
    {
        $id = $request->user()->id;
        $user = User::with(['photos',
        'role'=>function($q){
            $q->with(['permissions'=>function($q){
                $q->with('page');
            }]);
        }
        ])->find($id);
        return response()->json([
            'status' => 200,
            'user' => $user
        ]);
    }
    public function ResetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json([

                'message' => 'Invalid email format',
            ]);
        }
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json([
                'message' => 'We cant find a user with that e-mail address.',
            ]);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        $to_email = $request->email;
        $subject = 'Reset Password Notification';
        $from_email = 'app@gmail.com';
        $name = $user->name;

        $data = array('name' => $name, 'token' => $token);
        Mail::send('emails.mail', $data, function ($message) use ($to_email, $subject, $from_email) {
            $message->to($to_email)->subject($subject);
            $message->from($from_email);
        });

        return response()->json([
            'status' => 200,
            'message' => 'email sent'
        ]);
    }

    public function ResetPass(Request $request)
    {
        $id = $request->user()->id;

        $user = User::find($id)->update([
            'password' => bcrypt($request->password)
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'password change success'
        ]);
    }
    public function UserUpdate(Request $request)
    {
        $id = $request->user()->id;
        validator($request->all(), [
            'name' => 'required',
            'email' => ['required',
            Rule::unique('users')->ignore($id, 'id'),
        ],
        ]);


        $user = User::find($id)->update([
            'name' => $request->name,
            'father_name' => $request->father_name,
            'date_of_birth' => $request->date_of_birth,
            'mobile' => $request->mobile,
            'email' => $request->email,
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'user change success'
        ]);
    }

    public function profileUpload(Request $request){
        $user = User::find($request->id);
        $file = $request->file('file');
        $filename =  time() . '.' . $file->getClientOriginalExtension();
        $file->move('images/user/', $filename);

        $user->update([
            'photo' => $filename,
        ]);

        UserPhoto::create([
            'user_id' => $request->id,
            'name' => $filename,
        ]);

        return response()->json([
            'status' => 200,
            'message' => 'success image upload',
            'path' => $filename
        ]);
    }

    public function  DeletePhoto(Request $request){
        $photo = UserPhoto::find($request->id);
        $photo->delete();
        return response()->json([
            'status' => 200,
            'message' => 'success image delete',
        ]);
    }
    public function  SelectPhoto(Request $request){
        $photo = UserPhoto::find($request->id);

        $user = User::find($request->user()->id);
        $user->update([
            'photo' => $photo->name,
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'success image select',
        ]);
    }
}
