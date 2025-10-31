<?php

namespace App\Controllers\Master\Company;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class CompanyCtrl extends BaseController
{
    // view
    protected $view = 'Master/Company/CompanyVw';

    // data
    protected $data = ['title' => 'Company'];

    public function index()
    {
        // return view
        return view($this->view, $this->data);
    }
}
