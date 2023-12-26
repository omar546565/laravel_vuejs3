<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class PageController extends Controller
{
     public function getPages(){
        $pages = Page::with(['pages','page_name','permissions'])
        ->orderBy('order', 'asc')
        ->get();
        return response()->json([
            'pages' => $pages,
            'message' => 'Pages  get successfully'
        ]);
     }

     public function store(Request $request){
if($request->id){
    $request->validate([
        'page'=>['required',
        Rule::unique('pages')->ignore($request->id,'id'),
        ]
    ]);

    Page::find($request->id)->update([
        'page' => $request->page,
        'icon' => $request->icon,
        'path' => $request->path,
        'order' => $request->order,
        'page_id' => $request->page_id,
    ]);

    return response()->json([
        'message' => 'Page updated successfully'
    ]);
}

$request->validate([
    'page'=>['required',]
]);

        $page = Page::create([
            'page' => $request->page,
            'icon' => $request->icon,
            'path' => $request->path,
            'order' => $request->order,
            'page_id' => $request->page_id,
        ]);
        return response()->json([
            'page' => $page,
            'message' => 'Page created successfully'
        ]);
     }
}
