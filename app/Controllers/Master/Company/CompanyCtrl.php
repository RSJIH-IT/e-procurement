<?php

namespace App\Controllers\Master\Company;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class CompanyCtrl extends BaseController
{
    // view
    protected $view = 'Master/Company/CompanyVw';

    // data
    protected $data = ['title' => 'Company', 'add_form_visible' => false];

    public function index()
    {
        // get all company
        $this->data['company'] = $this->getAllCompany();

        // return view
        return view($this->view, $this->data);
    }

    // get all company
    public function getAllCompany()
    {
        // get model
        $model = new \App\Models\Master\Company\CompanyMdl();

        // get data
        $data = $model->findAll();

        // return data
        return $data;
    }
    
    // insert company
    public function insertCompany()
    {
        // get model
        $model = new \App\Models\Master\Company\CompanyMdl();

        // get data
        $data = $this->request->getPost();


        // insert data
        $model->insert($data);

        // return response
        return redirect()->to(site_url('/company'))->with('success', 'Company added successfully');
    }
}
