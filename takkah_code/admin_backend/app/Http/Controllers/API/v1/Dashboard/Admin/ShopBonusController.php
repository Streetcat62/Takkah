<?php

namespace App\Http\Controllers\API\v1\Dashboard\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FilterParamsRequest;
use App\Http\Resources\BonusShopResource;
use App\Models\BonusShop;
use Illuminate\Http\Request;

class ShopBonusController extends Controller
{
    public function index(FilterParamsRequest $request)
    {
        $shopBonuses = BonusShop::with(['shopProduct.product.translation','shop.translation'])
            ->paginate($request->perPage ?? 10);

        return BonusShopResource::collection($shopBonuses);
    }
}
