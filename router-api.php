<?php
    require_once 'libs/Router.php';
    require_once 'api/api.controller.php';

    $router = new Router();

    // tabla de ruteo
    $router->addRoute('comentarios', 'POST', 'ApiController', 'addComment');
    $router->addRoute('comentarios/producto/:ID', 'GET', 'ApiController', 'getComments');
    $router->addRoute('comentarios/:ID', 'DELETE', 'ApiController', 'deleteComment');
    
    // rutea
    $resource = $_GET['resource'];
    $method = $_SERVER['REQUEST_METHOD'];
    $router->route($resource, $method);

?>