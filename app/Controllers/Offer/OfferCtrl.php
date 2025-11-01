<?php

namespace App\Controllers\Offer;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class OfferCtrl extends BaseController
{

    // data
    protected $data = ['title' => 'Offer'];

    // view
    protected $view = 'Offer/OfferVw';

    public function index()
    {
        // get all active offer
        $this->data['offer'] = $this->getAllActiveOffer();

        // return view
        return view('Offer/OfferVw', $this->data);
    }

    public function getAllActiveOffer()
    {
        //
        $model = new \App\Models\Offer\OfferMdl();
        // $data = $model->where('status', '1')->findAll();
        // $data = $model->getAllOffer();
        $data = $model->getAllOfferDetail();
        return $data;
    }
}
