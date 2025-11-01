<!-- sidebar -->
<div id="sidebar" class="w-50 h-screen top-0 left-0 z-20 shadow-lg overflow-y-auto p-1">
    <div class="p-2 bg-gray-600 rounded-xl h-full space-y-4 ">
        <!-- logo -->
        <h2 class="text-lg font-medium leading-6 text-white flex gap-2 items-center">
            <div class="flex items-center bg-white px-2 py-2 rounded-md w-fit">
                <img src="<?= base_url() ?>/assets/img/svg/favicon.svg" alt="logo"
                    class="w-10 h-10 ">
            </div>
            <span class="text-white ">E-Procurement</span>
        </h2>

        <!-- line -->
        <div class="w-full h-0.5 bg-gray-500 rounded-sm"></div>

        <!-- menu -->
        <ul class="text-white space-y-2">
            <!-- dashboard -->
            <li class="bg-gray-500 hover:bg-white hover:text-blue-600 rounded-xl">
                <a href="<?= base_url('/') ?>" class="  block px-4 py-2  text-xl">
                    <i class="bi bi-house-door-fill"></i> Dashboard
                </a>
            </li>
        </ul>

        <!-- master company -->
        <li class="bg-gray-500 hover:bg-white hover:text-blue-600 rounded-xl">
            <a href="<?= base_url('/company') ?>" class=" block px-4 py-2  text-xl">
                <i class="bi bi-building-fill"></i> Master Company
            </a>
        </li>

        <!-- offer -->
        <li class="bg-gray-500 hover:bg-white hover:text-blue-600 rounded-xl">
            <a href="<?= base_url('/offer') ?>" class=" block px-4 py-2  text-xl">
                <i class="bi bi-bag-fill"></i> Offer
            </a>
        </li>
    </div>
</div>