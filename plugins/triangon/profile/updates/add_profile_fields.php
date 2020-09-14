<?php namespace Triangon\Profile\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class AddNewFields extends Migration
{

    public function up()
    {
        Schema::table('users', function($table)
        {
            $table->string('phone')->nullable();
            $table->string('country_of_residence')->nullable();
            $table->string('occupation')->nullable();
            $table->string('organization_institution_name')->nullable();
            $table->string('organization_type')->nullable();
            $table->string('reasons_for_accessing_form')->nullable();
            $table->boolean('already_research_partner_or_stakeholder')->nullable();
            $table->string('role_within_project')->nullable();
            $table->boolean('agreed_to_terms')->nullable();
        });
    }

    public function down()
    {
        $table->dropDown([
            'phone',
            'country_of_residence',
            'occupation',
            'organization_institution_name',
            'organization_type',
            'reasons_for_accessing_form',
            'already_research_partner_or_stakeholder',
            'role_within_project',
            'agreed_to_terms'
        ]);

    }

}