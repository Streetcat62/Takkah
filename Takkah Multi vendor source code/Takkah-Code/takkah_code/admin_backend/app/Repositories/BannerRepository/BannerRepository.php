<?php

namespace App\Repositories\BannerRepository;

use App\Models\Banner;
use App\Repositories\CoreRepository;

class BannerRepository extends CoreRepository
{
    private $lang;
    public function __construct()
    {
        parent::__construct();
        $this->lang = $this->setLanguage();
    }

    protected function getModelClass()
    {
        return Banner::class;
    }

    public function bannersPaginate($perPage)
    {
        return $this->model()->with('translation')
            ->where('shop_id', null)
            ->orderByDesc('id')
            ->paginate($perPage);
    }

    public function bannerDetails($id)
    {
        return $this->model()->with([
            'translation',
            'translations'
        ])->find($id);
    }

    public function bannerPaginateSeller($perPage,$shop_id)
    {
        return $this->model()->with('translation')
            ->when(isset($shop_id),function ($q) use ($shop_id){
                $q->where('shop_id', $shop_id);
            })
            ->orderByDesc('id')
            ->paginate($perPage);
    }

    public function bannersPaginateRest($perPage, $array)
    {
        return $this->model()->with('translation')
            ->when(isset($array['shop_id']),function ($q) use ($array){
                $q->where('shop_id', $array['shop_id']);
            })
            ->when(!isset($array['shop_id']),function ($q) use ($array){
                $q->where('shop_id', null);
            })
            ->where('active',true)
            ->orderByDesc('id')
            ->paginate($perPage);
    }

}
