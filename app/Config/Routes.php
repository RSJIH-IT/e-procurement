<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

// company routes
$routes->get('/company', 'Master\Company\CompanyCtrl::index');
$routes->post('/company/insert', 'Master\Company\CompanyCtrl::insertCompany');