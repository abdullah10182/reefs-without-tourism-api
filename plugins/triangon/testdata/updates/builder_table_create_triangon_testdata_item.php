<?php namespace Triangon\Testdata\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTriangonTestdataItem extends Migration
{
    public function up()
    {
        Schema::create('triangon_testdata_item', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('triangon_testdata_item');
    }
}
