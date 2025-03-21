<?php

namespace App\Http\Resources;

use App\Models\ShopClosedDate;
use Illuminate\Http\Resources\Json\JsonResource;

class ShopClosedDateResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        /** @var ShopClosedDate|JsonResource $this */
        return [
            'id'            => $this->id,
            'day'           => $this->date,
            'created_at'    => $this->when($this->created_at, optional($this->created_at)->format('Y-m-d H:i:s')),
            'updated_at'    => $this->when($this->updated_at, optional($this->updated_at)->format('Y-m-d H:i:s')),

            'shop'          => ShopResource::make($this->whenLoaded('shop')),
        ];
    }
}
