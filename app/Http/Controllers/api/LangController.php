<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Lang;
use Illuminate\Http\Request;

class LangController extends Controller
{
    public function getI18n()
    {
        $langs = Lang::all();

        $messagesAr = $langs->where('lang', 'ar')->pluck('value', 'key');
        $messagesEn = $langs->where('lang', 'en')->pluck('value', 'key');
        $messagesFr = $langs->where('lang', 'fr')->pluck('value', 'key');
        $messagesTr = $langs->where('lang', 'tr')->pluck('value', 'key');

        return response()->json([
            'ar' => $messagesAr,
            'en' => $messagesEn,
            'fr' => $messagesFr,
            'tr' => $messagesTr,
        ]);

    }

    public function LangsKey($key)
    {
        $langs = Lang::where('key', $key)->orderBy('lang')->get();
        return response()->json([
            'langs' => $langs,
            'success' => true,
        ]);
    }
    public function addLangs(Request $request)
    {
        $langs = $request->refForm;
        if ($request->isEdit) {
            foreach ($langs as $lang) {
                $tanslate = Lang::find($lang['id']);
                $tanslate['key'] = $request['keyValue'];
                $tanslate['value'] = $lang['value'];
                $tanslate->save();
            }


            return response()->json([

                'message' => "تم تعديل الكلمة بنجاح"  ,
            ]);
        } else {
            foreach ($langs as $lang) {
                Lang::insert([
                    'key' => $request->keyValue,
                    'value' => $lang['value'],
                    'lang' => $lang['lang'],
                ]);
            }


            return response()->json([

                'message' => " تم اضافة الكلمة بنجاح",
            ]);
        }
    }
    public function Langs()
    {
        $langs = Lang::orderBy('key')->get();
        return response()->json([
            'langs' => $langs,
            'success' => true,
        ]);
    }
}
