<?php


namespace App\Repositories;

class UserRepository extends EloquentRepository
{
    public function model()
    {
        return \App\User::class;
    }

    public function __construct()
    {
    }
}