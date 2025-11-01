<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

// company routes
$routes->get('/company', 'Master\Company\CompanyCtrl::index');
$routes->get('/company/recycle-bin', 'Master\Company\CompanyCtrl::recycleBin');
$routes->post('/company/insert', 'Master\Company\CompanyCtrl::insertCompany');
$routes->post('/company/delete', 'Master\Company\CompanyCtrl::deleteCompany');
$routes->post('/company/update', 'Master\Company\CompanyCtrl::updateCompany');

// Offer
$routes->get('/offer', 'Offer\OfferCtrl::index');
$routes->get('/offer/recycle-bin', 'Offer\OfferCtrl::recycleBin');
$routes->post('/offer/insert', 'Offer\OfferCtrl::insertOffer');
$routes->post('/offer/delete', 'Offer\OfferCtrl::deleteOffer');
$routes->post('/offer/update', 'Offer\OfferCtrl::updateOffer');
