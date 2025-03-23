<?php

namespace App\Http\Controllers\API\v1\Dashboard\Admin;

use App\Http\Controllers\Controller;
use App\Traits\ApiResponse;
use App\Traits\Loggable;

abstract class AdminBaseController extends Controller
{
    use ApiResponse, Loggable;

    public function __construct()
    {
        $this->middleware(['sanctum.check', 'role:admin|manager']);
    }
}
