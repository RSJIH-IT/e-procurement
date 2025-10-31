<?php

use App\Controllers\Master\Company\CompanyCtrl;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>E-Procurement</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <!-- add sidebar -->
    <?= $this->include('object/sidebar/sidebar') ?>

    <!-- title and button to add new company -->
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
        <h1><?= esc($title) ?></h1>

        <!-- button to add new company, recycle bin button -->
        <div style="display: flex; gap: 0.5rem;">
            <a href="javascript:void(0)" class="btn btn-primary" onclick="showObject('add-company-form')">+ Add Company</a>
            <!-- jika url ada recycle-bin, maka show recycle bin button -->
            <?php if (strpos(current_url(), 'recycle-bin') !== false): ?>
                <a href="<?= site_url('/company') ?>">Back</a>
            <?php else: ?>
                <a href="<?= site_url('/company/recycle-bin') ?>">Recycle Bin</a>
            <?php endif; ?>
        </div>
    </div>

    <!-- show all company as a list -->
    <div id="company">
        <table class="table table-striped" id="company-table" border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($company as $item): ?>
                    <tr>
                        <td><?= esc($item['name']) ?></td>
                        <td><?= esc($item['type']) ?></td>
                        <td><?= esc($item['email']) ?></td>
                        <td><?= esc($item['phone']) ?></td>
                        <td><?= esc($item['status']) ?></td>
                        <td>
                            <!-- delete button -->
                            <a href="javascript:void(0)" class="btn btn-primary" onclick="showObject('confirm-delete-<?= esc($item['id_company']) ?>')">Delete</a>

                            <!-- update button -->
                            <a href="javascript:void(0)" class="btn btn-primary" onclick="showObject('update-company-form-<?= esc($item['id_company']) ?>')">Update</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- table to insert company, visible when click add company -->
    <div id="add-company-form" style="display: none;">
        <br>
        <!-- 'name', 'type', 'email', 'phone', 'address', 'status' -->
        <form action="<?= site_url('/company/insert') ?>" method="post">
            <!-- name -->
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <!-- type -->
            <div class="form-group">
                <label for="type">Type</label>
                <select class="form-control" id="type" name="type" required>
                    <option value="1">RS JIH YK</option>
                    <option value="2" selected>Vendor</option>
                </select>
            </div>

            <!-- email -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <!-- phone -->
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>

            <!-- address -->
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>

            <!-- status -->
            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="1" selected>Active</option>
                    <option value="2">Non-Active</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Company</button>
        </form>
    </div>

    <!-- confirm delete company according to id -->
    <?php foreach ($company as $item): ?>
        <form action="<?= site_url('/company/delete') ?>" method="post">
            <!-- add hidden input to store company id -->
            <input type="hidden" id="company-id" name="company-id" value="<?= esc($item['id_company']) ?>">

            <!-- confirm delete button -->
            <div id="confirm-delete-<?= esc($item['id_company']) ?>" style="display: none;">
                <br>
                <p>Are you sure you want to delete <?= esc($item['name']) ?>?</p>
                <button type="submit" class="btn btn-primary" onclick="deleteCompany()">Delete</button>
                <button type="button" class="btn btn-secondary" onclick="showObject('confirm-delete-<?= esc($item['id_company']) ?>')">Cancel</button>
            </div>
        </form>
    <?php endforeach; ?>

    <!-- form to update company, visible when click update company -->
    <?php foreach ($company as $item): ?>
        <div id="update-company-form-<?= esc($item['id_company']) ?>" style="display: none;">
            <br>
            <!-- 'name', 'type', 'email', 'phone', 'address', 'status' -->
            <form action="<?= site_url('/company/update') ?>" method="post">
                <!-- add hidden input to store company id -->
                <input type="hidden" id="company-id" name="company-id" value="<?= esc($item['id_company']) ?>">

                <!-- name -->
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<?= esc($item['name']) ?>" required>
                </div>

                <!-- type -->
                <div class="form-group">
                    <label for="type">Type</label>
                    <select class="form-control" id="type" name="type" required>
                        <option value="1" <?= $item['type'] == 1 ? 'selected' : '' ?>>RS JIH YK</option>
                        <option value="2" <?= $item['type'] == 2 ? 'selected' : '' ?>>Vendor</option>
                    </select>
                </div>

                <!-- email -->
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<?= esc($item['email']) ?>" required>
                </div>

                <!-- phone -->
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="<?= esc($item['phone']) ?>" required>
                </div>

                <!-- address -->
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" value="<?= esc($item['address']) ?>" required>
                </div>

                <!-- btn submit -->
                <button type="submit" class="btn btn-primary">Update Company</button>

                <!-- btn cancel -->
                <button type="button" class="btn btn-secondary" onclick="showObject('update-company-form-<?= esc($item['id_company']) ?>')">Cancel</button>
            </form>
        </div>
    <?php endforeach; ?>

    <!-- javascript -->
    <script>
        function showObject(objects) {
            // jika object not visible, make it visible, and otherwise make it hidden
            if (document.getElementById(objects).style.display === 'none') {
                document.getElementById(objects).style.display = 'block';
            } else {
                document.getElementById(objects).style.display = 'none';
            }
        }
    </script>

</body>

</html>