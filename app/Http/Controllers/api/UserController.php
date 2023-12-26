<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function indexUsers()
    {
        $users = User::with('role')->paginate(10);
        return response()->json([
            'message' => 'success get users',
            'users' => $users
        ]);
    }
    public function store(Request $request)
    {
       if($request->id){
        User::find($request->id)->update([
            'name' => $request->name,
            'father_name' => $request->father_name,
            'name' => $request->name,
            'gender' => $request->gender,
            'date_of_birth' => $request->date_of_birth,
            'mobile' => $request->mobile,
            'email' => $request->email,
            'role_id' => $request->role_id,
        ]);
        return response()->json([
            'message' => 'success update user',

        ]);
       }
        User::create([
         'name' => $request->name,
         'father_name' => $request->father_name,
         'name' => $request->name,
         'gender' => $request->gender,
         'date_of_birth' => $request->date_of_birth,
         'mobile' => $request->mobile,
         'email' => $request->email,
         'role_id' => $request->role_id,
          'password' => bcrypt($request->password),

        ]);

        return response()->json([
            'message' => 'success create user',

        ]);
    }
}
