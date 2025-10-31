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
        <a href="javascript:void(0)" class="btn btn-primary" onclick="showObject('add-company-form')">+ Add Company</a>
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
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <!-- table to insert company, visible when click add company -->
    <div id="add-company-form" style="display: none;">
        <br>
        <!-- 'name', 'type', 'email', 'phone', 'address', 'status' -->
        <form action="<?= site_url('master/company/insert') ?>" method="post">
            <!-- name -->
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <!-- type -->
            <div class="form-group">
                <label for="type">Type</label>
                <input type="text" class="form-control" id="type" name="type" required>
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
                    <option value="0">Active</option>
                    <option value="1">Non-Active</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Add Company</button>
        </form>
    </div>

    <!-- javascript to close add company form -->
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