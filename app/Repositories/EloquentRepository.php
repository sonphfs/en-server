<?php

namespace App\Repositories;

use App\Repositories\Contracts\RespositoryInterface;

abstract class EloquentRepository implements RespositoryInterface
{
    protected $model;

    public function __construct()
    {
        $this->app = new App();
        $this->makeModel();
    }

    abstract public function model();

    public function makeModel()
    {
        $model = $this->app->make($this->model());
        if (!$model instanceof Model) {
            throw new Exception("Class {$this->model()} must be an instance of Illuminate\\Database\\Eloquent\\Model");
        }

        return $this->model = $model;
    }
}