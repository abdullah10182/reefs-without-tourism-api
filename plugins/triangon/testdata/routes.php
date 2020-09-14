<?php

use Triangon\Testdata\Models\items;
use Illuminate\Http\Request;

Route::middleware(['api','jwt.auth'])->group(function () {
    Route::get('items', function() {
        $vehicles =  items::all();
        return $vehicles;
    });

    // Route::get('vehicles/filter/{id}', function($id) {
    //     $vehicles = Vehicle::wherehas('locations', function($query) use($id) {
    //         $query->where ('id', '=', $id);
    //     })->with(['image','locations'])->get();
    //     return $vehicles;
    // });

    // Route::get('locations', function() {
    //     $locations = Location::all();
    //     return $locations;
    // });

    // Route::get('locations/list', function() {
    //     $locations = Location::all();

    //     foreach ($locations as $key => $location) {
    //         $location['label'] = $location['title'];
    //         $location['value'] = $location['id'];
    //         unset($location['title']);
    //         unset($location['id']);
    //         unset($location['slug ']);
    //     }
    //     return $locations;
    // });
});