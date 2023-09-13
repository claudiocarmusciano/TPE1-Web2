<?php

require_once('models/producto.model.php');
require_once('models/categoria.model.php');
require_once('views/producto.view.php');
require_once('helpers/auth.helper.php');

class ProductoController {

    private $productoModel;
    private $categoriaModel;
    private $view;
    private $authHelper;

    /// Constructor
    public function __construct() {
        $this->productoModel = new ProductoModel();
        $this->categoriaModel = new CategoriaModel();
        $this->view = new ProductoView();
        $this->authHelper = new AuthHelper();
    }

    /// Muestra la pantalla principal de Home Productos
    function showHome() {
        $this->view->getHome();
    }
   
    /// FUNCIONES DE PRODUCTOS
    
    /// Muestra el listado de productos con los botones
    function showProducts() {
        $productos = $this->productoModel->obtenerProductos();
        $this->view->showProducts($productos);
    }

    /// Muestra los productos por categoria
    function showProductsOfCategory($idCat) {
        $productos = $this->productoModel->obtenerProductosOfCategory($idCat); ////////
        $this->view->showProducts($productos);
    }

    /// Muestra el detalle del producto
    function viewDetailProduct($id) {
        $producto = $this->productoModel->obtenerProducto($id);
        $categoria = $this->categoriaModel->obtenerCategoria($producto->categoria);
        if (!empty($_SESSION['USER_ID'])) {
            $rol = $_SESSION['USER_ROL'];
        }
        else {
            $rol = "X";
        }
        $this->view->showDetailProduct($producto, $categoria, $rol);
    }

    /// Agrega un producto
    function addProduct() {
        $this->authHelper->checkLoggedIn();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {    
            $sku = $_REQUEST['sku'];
            $descripcion = $_REQUEST['descripcion'];
            $precio = $_REQUEST['precio'];
            $categoria = $_REQUEST['categoria'];
            $stock = $_REQUEST['stock'];
            if ($_FILES['input_name']['type'] == "image/jpg" || 
                $_FILES['input_name']['type'] == "image/jpeg" ||
                $_FILES['input_name']['type'] == "image/png" ) {
                    $this->productoModel->agregarProducto($sku, $descripcion, $precio, $categoria, $stock, $_FILES['input_name']['tmp_name']);
                }
            else {
                $this->productoModel->agregarProducto($sku, $descripcion, $precio, $categoria, $stock);
            }
            header("Location: " . BASE_URL); 
        }
        else {
            $categorias = $this->categoriaModel->obtenerCategorias();
            $this->view->formAltaProducto($categorias);            
        }
    }

     /// Mofifica el producto elegido
     function getModifyProduct($id){
        $this->authHelper->checkLoggedIn();
    
        if ((isset($_POST['sku']) || !empty($_POST['sku'])) && 
           (isset($_POST['descripcion']) || !empty($_POST['descripcion'])) &&
           (isset($_POST['precio']) || !empty($_POST['precio'])) &&
           (isset($_POST['categoria']) || !empty($_POST['categoria'])) &&
           (isset($_POST['stock']) || !empty($_POST['stock']))) {
           $newSku = $_POST['sku'];
           $newDescripcion = $_POST['descripcion'];
           $newPrecio = $_POST['precio'];
           $newCategoria = $_POST['categoria'];
           $newStock = $_POST['stock'];

           if ($_FILES['input_name']['type'] == "image/jpg" || 
                $_FILES['input_name']['type'] == "image/jpeg" ||
                $_FILES['input_name']['type'] == "image/png" ) { 
                    $this->productoModel->modificarProducto($id, $newSku, $newDescripcion, $newPrecio, $newCategoria, $newStock, $_FILES['input_name']['tmp_name']);
                }
            else {
                var_dump($_FILES['input_name']['tmp_name']);
                $this->productoModel->modificarProducto($id, $newSku, $newDescripcion, $newPrecio, $newCategoria, $newStock);
            }
           
            header("Location: " . BASE_URL. "listProducts"); 
        }
    }
    

    /// Elimina un producto
    function delProducto($id) {
        $this->authHelper->checkLoggedIn();
        $this->productoModel->borrarProducto($id);
        header("Location: " . BASE_URL. "listProducts");
    }

    /// Edita el formulario para modificar un producto
    function formEditProduct($id) {
        $this->authHelper->checkLoggedIn();
        $producto = $this->productoModel->obtenerProducto($id);
        $categorias = $this->categoriaModel->obtenerCategorias();
        $this->view->showModifyProduct($producto, $categorias);
    }

    // Borra la imágen de un producto
    function delImage($id) {
        $pathImage=null;
        $this->productoModel->borrarImagen($id, $pathImage);
        header("Location: " . BASE_URL. "listProducts");
    }


    
    /// FUNCIONES DE CATEGORIAS
    
    /// Muestra el listado de categorías con los botones
    public function showCategories() {
        $categorias = $this->categoriaModel->obtenerCategorias();
        $this->view->showCategories($categorias);
    }

    /// Muestra el detalle de la categoria
    function viewDetailCategory($id) {
        $categoria = $this->categoriaModel->obtenerCategoria($id);
        $this->view->showDetailCategory($categoria);
    }

    /// Agrega una categoria
    function addCategory() {
        $this->authHelper->checkLoggedIn();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
            $descripcion = $_REQUEST['descripcion'];
            $this->categoriaModel->agregarCategoria($descripcion);
            header("Location: " . BASE_URL); 
        } 
        else {
            $this->view->formAltaCategoria();
        }
    }
   
    /// Elimina una categoria
    function delCategoria($id) {
        $this->authHelper->checkLoggedIn();
        $productos = $this->productoModel->obtenerProductos();     
        $categoria = $this->categoriaModel->obtenerCategoria($id);  
        $existeCategoria = FALSE;
        $cantProductos = count($productos);
        $indice = 0;
        while (($existeCategoria == FALSE) && ($indice < $cantProductos)) {
                if ($categoria->descripcion == $productos[$indice]->categoria){
                    $existeCategoria = TRUE;
                }
                $indice++;
        }
        if ($existeCategoria == FALSE) {
            $this->categoriaModel->borrarCategoria($id);      
            header("Location: " . BASE_URL. "listCategories");
        }
        else {
            $this->view->showErrorCategory("No es posible eliminar la categoria porque tiene productos asociados.");
        } 
    }

    /// Edita el formulario para modificar una categoria
    function formEditCategory($id) {
        $this->authHelper->checkLoggedIn();
        $categoria = $this->categoriaModel->obtenerCategoria($id);
        $this->view->showModifyCategory($categoria);
    }

    /// Modifica la categoria elegida
    function getModifyCategory($id){
        $this->authHelper->checkLoggedIn();
        
        if ((isset($_GET['descripcion']) || !empty($_GET['descripcion']))) {
            $newDescripcion = $_GET['descripcion'];
            $this->categoriaModel->modificarCategoria($id, $newDescripcion);
            header("Location: " . BASE_URL. "listCategories"); 
        }
    }

}