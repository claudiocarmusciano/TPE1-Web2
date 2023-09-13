<!DOCTYPE html>
<html lang="en">

<head>
    <base href="{BASE_URL}">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PRODUCTOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>

<body>
    <header>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">PRODUCTOS</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" 
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home">Home</a>
                    </li>
    
                   <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle navbar-dark" href="#" id="navbarDropdownMenuLink" 
                            role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Altas
                        </a>
                        <ul class="dropdown-menu navbar-dark bg-light" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="addCategory">Alta Categorías</a></li>
                            <li><a class="dropdown-item" href="addProduct">Alta Productos</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" 
                            data-bs-toggle="dropdown" aria-expanded="false">Listados</a>
                        <ul class="dropdown-menu navbar-dark bg-light" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item navbar-dark" href="listCategories">Listado Categorías</a></li>
                            <li><a class="dropdown-item navbar-dark" href="listProducts">Listado Productos</a></li>
                        </ul>
                    </li>
                    <li class="nav-item ms-auto">
                            {if isset($smarty.session.USER_ID)} 
                                <a class="nav-link" href="logout">{$smarty.session.USER_EMAIL} - Logout</a>
                                {if ($smarty.session.USER_ROL == 'A')}
                                    <li>
                                        <a class="nav-link" href="usuarios">Usuarios</a>
                                    </li>
                                {/if}
                            {else}
                                <li>
                                    <a class="nav-link" href="login">Ingresar</a>
                                </li>
                                <li>
                                    <a class="nav-link" href="register">Registrarse</a>
                                </li>
                            {/if}
                    </li>

                </ul>
                </div>
            </div> 
        </nav>

    </header>
    
    <!-- inicia el contenido principal -->
    <div class="container">