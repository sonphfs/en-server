<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Role;
use App\RoleUser;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = User::all();
        if(!count($users)) {
            $this->_createDataSeed();
        }
    }

    private function _createDataSeed()
    {
        $jsonData = json_decode(Storage::get('data\users.json'));
        foreach ($jsonData as $item) {
            $user = new User();
            $user->username = $item->username;
            $user->email = $item->email;
            $user->password = bcrypt($item->password);
            $user->save();
            foreach ($item->roles as $role) {
                $hasRole = Role::where('name', $role->name)->first();
                if(!$hasRole) {
                    $newRole = new Role();
                    $newRole->name = $role->name;
                    $newRole->description = $role->description;
                    $newRole->save();
                    RoleUser::create(['user_id' => $user->id, 'role_id' => $newRole->id]);
                }else {
                    RoleUser::create(['user_id' => $user->id, 'role_id' => $hasRole->id]);
                }

            }
        }
    }
}
