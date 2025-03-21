<?php

namespace App\Repositories\CouponRepository;

use App\Models\Coupon;
use App\Repositories\CoreRepository;

class CouponRepository extends CoreRepository
{
    private $lang;

    public function __construct()
    {
        parent::__construct();
        $this->lang = $this->setLanguage();
    }

    protected function getModelClass()
    {
        return Coupon::class;
    }

    public function couponsList($array)
    {
        return $this->model()->filter($array)->orderByDesc('id')->get();
    }

    public function couponsPaginate($perPage, $shop = null)
    {
        return $this->model()->whereHas('translation')
            ->with([
                'translation'
            ])
            ->when(isset($shop), function ($q) use ($shop) {
                $q->where('shop_id', $shop);
            })
            ->orderByDesc('id')
            ->paginate($perPage);
    }

    public function couponByName(string $name)
    {
        return $this->model()
            ->with([
                'galleries',
                'translation'
            ])->firstWhere('name', $name);
    }

    public function couponById(int $id, $shop = null)
    {
        return $this->model()->with([
            'shop',
            'galleries',
            'translation'
        ])
            ->when(isset($shop), function ($q) use ($shop) {
                $q->where('shop_id', $shop);
            })->find($id);
    }
}
