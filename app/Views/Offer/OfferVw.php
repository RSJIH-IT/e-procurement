<?php

use App\Controllers\Offer\OfferCtrl;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>E-Procurement</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <h1>
        <?= $title ?>
    </h1>

    <!-- add sidebar -->
    <?= $this->include('/object/sidebar/sidebar') ?>

    <!-- add content -->
    <div class="content">
        <h2>Offer</h2>
    </div>

    <!-- data offer -->
    <div class="data-offer">
        <h3>Active Offer</h3>
        <table border="1">
            <tr>
                <th>Name</th>
                <th>Vendor</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <?php foreach ($offer as $item): ?>
                <tr>
                    <td><?= $item['name'] ?></td>
                    <td><?= $item['vendor_company_name'] ?></td>
                    <td><?= $item['status'] ?></td>
                    <td>
                        <button onclick="showObject('detail-offer-<?= $item['id_offer'] ?>')">Detail</button>
                    </td>
                </tr>

                <?php echo var_dump($item) ?>
            <?php endforeach; ?>
        </table>
    </div>
</body>

<!-- detail offer -->
<?php foreach ($offer as $item): ?>
    <div class="detail-offer-item<?= esc($item['id_offer']) ?>">
        <div id="detail-offer-<?= $item['id_offer'] ?>" style="display: visible;">
            <!-- resume offer -->
            <h4>Detail Offer <?= $item['name'] ?></h4>
            <p>Vendor: <?= $item['vendor_company_name'] ?></p>
            <p>Detail: <?= $item['detail'] ?></p>

            <!-- item offer -->
            <h4>Item Offer</h4>
            <table border="1">
                <tr>
                    <th>Name</th>
                    <th>Detail</th>
                    <th>Quantity</th>
                    <th>Type Offer</th>
                    <th>Category</th>
                    <th>Merk</th>
                    <th>origin</th>
                    <th>Spec</th>
                    <th>Color</th>
                    <th>Warranty</th>
                    <th>Dimention</th>
                    <th>Weight</th>
                    <th>Price</th>
                    <th>Total Price</th>
                    <th>PPN</th>
                    <th>PPH</th>
                    <th>PD</th>
                    <th>Image</th>
                    <th>PCC</th>
                    <th>OCC</th>

                </tr>

                <tr>
                    <td><?= $item['name'] ?></td>
                    <td><?= $item['detail'] ?></td>
                    <td><?= $item['count'] . ' ' . $item['unit_name'] ?></td>
                    <td><?= $item['type_offer_name'] ?></td>
                    <td><?= $item['cat_offr_name'] ?></td>
                    <td><?= $item['merk'] ?></td>
                    <td><?= $item['type_origin_type'] . ' - ' . $item['origin_name'] ?></td>
                    <td><?= $item['spec'] ?></td>
                    <td><?= $item['color'] ?></td>
                    <td><?= $item['warranty'] ?></td>
                    <td><?= $item['dimention'] ?></td>
                    <td><?= $item['weight'] ?></td>
                    <td><?= $item['price'] ?></td>
                    <td><?= $item['price'] * $item['count'] ?></td>
                    <td><?= $item['ppn'] ?></td>
                    <td><?= $item['pph'] ?></td>
                    <td><?= $item['pd'] ?></td>
                    <td><?= $item['file'] ?></td>
                    <td><?= $item['pcc'] ?></td>
                    <td><?= $item['occ'] ?></td>
                </tr>

            </table>

            <!-- close detail offer item -->
            <button onclick="showObject('detail-offer-<?= $item['id_offer'] ?>')">Close</button>
        </div>
    </div>
<?php endforeach; ?>

<!-- javascript -->
<script src="<?= base_url('assets/js/script.js') ?>"></script>

</html>