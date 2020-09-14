<?php namespace Triangon\Testdata\Models;

use Model;

/**
 * Model
 */
class Items extends Model
{
    use \October\Rain\Database\Traits\Validation;
    

    /**
     * @var string The database table used by the model.
     */
    public $table = 'triangon_testdata_item';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
