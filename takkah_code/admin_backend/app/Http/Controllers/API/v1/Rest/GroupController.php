<?php

namespace App\Http\Controllers\API\v1\Rest;

use App\Http\Controllers\Controller;
use App\Http\Resources\GroupResource;
use App\Repositories\GroupRepository\GroupRepository;
use Illuminate\Http\Request;

class GroupController extends RestBaseController
{
    public function __construct(protected GroupRepository $groupRepository)
    {
    }

    public function paginate(Request $request)
    {
        $groups = $this->groupRepository->paginate($request->perPage ?? 15, true);
        return GroupResource::collection($groups);
    }

}
