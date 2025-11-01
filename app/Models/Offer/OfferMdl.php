<?php

namespace App\Models\Offer;

use CodeIgniter\Model;

class OfferMdl extends Model
{
    protected $table            = 'offer';
    protected $primaryKey       = 'id_offer';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['requester', 'vendor', 'name', 'detail', 'status'];

    protected bool $allowEmptyInserts = false;
    protected bool $updateOnlyChanged = true;

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    // protected $createdField  = 'created_at';
    // protected $updatedField  = 'updated_at';
    // protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [
        'requester' => 'required',
        'vendor' => 'required',
        'name' => 'required',
        'status' => 'required|in_list[1,2]',
    ];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    // get all offer with status 1 and all join table
    public function getAllOffer()
    {
        return $this->db->table($this->table)
            ->select('*', 'req_company.name as req_company_name')
            ->join('usr_occp as req_occp', 'req_occp.id_user = offer.requester')
            ->join('company as req_company', 'req_company.id_company = req_occp.work_in')
            ->join('user as req_user', 'req_user.id_usr = req_occp.usr_id')
            ->join('usr_occp as vendor_occp', 'vendor_occp.id_user = offer.vendor')
            ->join('user as vendor_user', 'vendor_user.id_usr = vendor_occp.usr_id')
            ->join('company as vendor_company', 'vendor_company.id_company = vendor_occp.work_in')
            ->where('offer.status', 1)
            ->get()
            ->getResultArray();
    }

    // get all offer detail
    public function getAllOfferDetail()
    {
        return $this->db->query("
                                    select 
                                        off.*,
                                        req_company.name as req_company_name,
                                        vendor_company.name as vendor_company_name,
                                        off_item.*,
                                        item_unit.unit as unit_name,
                                        type_offer.type as type_offer_name,
                                        cat_offr.name as cat_offr_name,
                                        typ_origin.type as type_origin_type,
                                        origin.origin as origin_name,
                                        color.name as color_name,
                                        warranty.lenght as warranty_length,
                                        warranty_unit.unit as warranty_unit,
                                        ppn_radio.type as is_ppn,
                                        pph_radio.type as is_pph,
                                        pd_radio.type as is_pd

                                    from offer as off
                                    left join usr_occp as req_occp on req_occp.id_user = off.requester
                                    left join company as req_company on req_company.id_company = req_occp.work_in
                                    left join usr_occp as vendor_occp on vendor_occp.id_user = off.vendor
                                    left join company as vendor_company on vendor_company.id_company = vendor_occp.work_in
                                    left join off_to_item on off_to_item.id_off_det = off.id_offer
                                    right join off_item on off_to_item.off_item = off_item.id_item
                                    left join unit as item_unit on off_item.unit = item_unit.id_unit
                                    left join type_offer on off_item.typ_offr = type_offer.id_typ_offr
                                    left join cat_offr on off_item.category = cat_offr.id_cat
                                    left join typ_origin on off_item.type_origin = typ_origin.id_tp_origin
                                    left join origin on off_item.origin = origin.id_origin
                                    left join color on off_item.color = color.id
                                    left join warranty on off_item.warranty = warranty.id
                                    left join unit as warranty_unit on warranty.unit = warranty_unit.unit
                                    left join radio as ppn_radio on off_item.ppn = ppn_radio.id
                                    left join radio as pph_radio on off_item.pph = pph_radio.id
                                    left join radio as pd_radio on off_item.pd = pd_radio.id

                                    where off.status = 1
                                    AND off.requester = 2
        ")->getResultArray();

}
}
