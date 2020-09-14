<?php namespace Triangon\Testdata\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTriangonTestdataItem extends Migration
{
    public function up()
    {
        Schema::table('triangon_testdata_item', function($table)
        {
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('triangon_testdata_item', function($table)
        {
            $table->dropColumn('created_at');
            $table->dropColumn('updated_at');
        });
    }
}
