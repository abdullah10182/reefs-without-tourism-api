<?php namespace Triangon\Profile;

use System\Classes\PluginBase;

use Rainlab\User\Controllers\Users as UsersController;
use Rainlab\User\Models\User as UserModel;
use Event;
use Rainlab\User\Models\UserGroup;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
    }

    public function registerSettings()
    {
    }

    public function boot(){
        
        //add user to group on activation
        Event::listen('rainlab.user.activate', function($user) {
            $group = \Rainlab\User\Models\UserGroup::where('code', 'front_end_user')->first();
            $user->groups()->add($group);
            $user->save(); 
        });

        //allows external sources to fill in values on registration
        $this->extendUserModel();
        $this->extendUserFormFields();
        

    }

    public function extendUserFormFields() {
        UsersController::extendFormFields(function($form, $model, $context){
            $form->addFields([
                'phone' => [
                    'label' => 'Phone Number',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'country_of_residence' => [
                    'label' => 'Country of Residence',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'occupation' => [
                    'label' => 'Occupation',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'organization_institution_name' => [
                    'label' => 'Organization or Institution_name',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'organization_type' => [
                    'label' => 'Organization Yype',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'reasons_for_accessing_form' => [
                    'label' => 'Reason(s) for Accessing Form',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'already_research_partner_or_stakeholder' => [
                    'label' => 'Already research a partner or stakeholder',
                    'type' => 'switch',
                    'span' => 'auto',
                    'on' => 'Yes',
                    'off' => 'No'
                ],
                'role_within_project' => [
                    'label' => 'Role within Project',
                    'type' => 'text',
                    'span' => 'auto'
                ],
                'agreed_to_terms' => [
                    'label' => 'Agreed to Terms of Use',
                    'type' => 'switch',
                    'span' => 'full',
                    'on' => 'Yes',
                    'off' => 'No'
                ],
            ]);
        });
    }

    public function extendUserModel() {
        UserModel::extend(function ($model){
            $model->addFillable([
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

            //add backend validation if needed
            // $model->bindEvent('model.beforeValidate', function() use ($model) {
            //     $model->rules['phone'] = 'required';
            // });
        });
    }

}
