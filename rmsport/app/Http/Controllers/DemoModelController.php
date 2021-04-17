<?php

namespace App\Http\Controllers;

use App\Models\demoModel;
use Illuminate\Http\Request;

class DemoModelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $a = new demoModel();

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\demoModel  $demoModel
     * @return \Illuminate\Http\Response
     */
    public function show(demoModel $demoModel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\demoModel  $demoModel
     * @return \Illuminate\Http\Response
     */
    public function edit(demoModel $demoModel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\demoModel  $demoModel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, demoModel $demoModel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\demoModel  $demoModel
     * @return \Illuminate\Http\Response
     */
    public function destroy(demoModel $demoModel)
    {
        //
    }
}
