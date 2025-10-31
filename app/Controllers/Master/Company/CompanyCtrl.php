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

    // recycle bin
    public function recycleBin()
    {
        // get all company
        $this->data['company'] = $this->getAllCompany(false);

        // return view
        return view($this->view, $this->data);
    }

    // get all company
    public function getAllCompany($active = true)
    {
        // get model
        $model = new \App\Models\Master\Company\CompanyMdl();

        // get data where status is active
        $status = $active ? '1' : '2';
        $data = $model->where('status', $status)->findAll();

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

    // set company status to non active
    public function deleteCompany()
    {
        // get model
        $model = new \App\Models\Master\Company\CompanyMdl();

        // get id from post
        $id_company = $this->request->getPost('company-id');

        // set non active
        $model->setNonActive($id_company);

        // return response
        return redirect()->to(site_url('/company'))->with('success', 'Company status changed successfully');
    }

    // update company
    public function updateCompany()
    {
        // get model
        $model = new \App\Models\Master\Company\CompanyMdl();

        // get id from post
        $id_company = $this->request->getPost('company-id');

        // get data
        $data = $this->request->getPost();

        // update data
        $model->update($id_company, $data);

        // return response
        return redirect()->to(site_url('/company'))->with('success', 'Company updated successfully');
    }
}
