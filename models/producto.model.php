<?php

class ProductoModel {

    private $db;

    /// Constructor
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_productos;charset=utf8', 'root', '');
        $this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    }

    /// Obtiene todos los productos
    function obtenerProductos() {
        $consulta = "SELECT productos.*, categorias.descripcion as categoria FROM productos JOIN categorias ON productos.categoria = categorias.id";
        $query = $this->db->prepare($consulta);
        $query->execute();
        $productos = $query->fetchAll(PDO::FETCH_OBJ); 
        return $productos;
    }

    /// Obtiene los productos por categoria
    function obtenerProductosOfCategory($idCat) {
        $consulta = "SELECT productos.*, categorias.descripcion as categoria FROM productos JOIN categorias ON productos.categoria = categorias.id WHERE categoria=?";
        $query = $this->db->prepare($consulta);
        $query->execute([$idCat]);
        $productos = $query->fetchAll(PDO::FETCH_OBJ); 
        return $productos;
    }
    
    /// Obtiene un producto
    function obtenerProducto($id) {
        $consulta = "SELECT * FROM productos WHERE id=?";
        $query = $this->db->prepare($consulta);
        $query->execute([$id]);
        $producto = $query->fetch(PDO::FETCH_OBJ);
        return $producto;
    }

    /// Agrega un producto
    function agregarProducto($sku, $descripcion, $precio, $categoria, $stock, $imagen = null) {
        $pathImg = null;
        if ($imagen) {
            $pathImg = $this->uploadImage($imagen);
        }
        $query = $this->db->prepare('INSERT INTO productos(sku, descripcion, precio, categoria, stock, imagen) VALUES (?, ?, ?, ?, ?, ?)');
        $query->execute([$sku, $descripcion, $precio, $categoria, $stock, $pathImg]);
        return $this->db->lastInsertId();
    }

    /// Modifica un producto
    function modificarProducto($id, $sku, $descripcion, $precio, $categoria, $stock, $imagen = null) {
        try{
            if ($imagen) {
                $pathImg = $this->uploadImage($imagen);
                $query = $this->db->prepare('UPDATE productos SET sku=?, descripcion=?, precio=?, 
                                                    categoria=?, stock=?, imagen=? WHERE id=?');
                $query->execute([$sku, $descripcion, $precio, $categoria, $stock, $pathImg, $id]);
            }
            else {
                $query = $this->db->prepare('UPDATE productos SET sku=?, descripcion=?, precio=?, 
                                                    categoria=?, stock=? WHERE id=?');
                $query->execute([$sku, $descripcion, $precio, $categoria, $stock, $id]);
            }
            
        }
        catch (PDOException $error) {
            $error->getMessage();
            echo $error;
        }
    }    

    private function uploadImage($image){
        
        $extension = pathinfo($image, PATHINFO_EXTENSION);

        if ($extension == 'jpg') {
            $target = 'imgs/articles/' . uniqid() . '.jpg';
        }
        elseif ($extension == 'jpeg') { 
            $target = 'imgs/articles/' . uniqid() . '.jpeg';
        }
        else {
            $target = 'imgs/articles/' . uniqid() . '.png';
        }
        move_uploaded_file($image, $target);
        return $target;
    }

    
    /// Elimina un producto
    function borrarProducto($id) {    
        $query = $this->db->prepare('DELETE FROM productos WHERE id=?');
        $query->execute([$id]);
    }

    function borrarImagen($id, $pathImg) {
        $query = $this->db->prepare('UPDATE productos SET imagen=? WHERE id=?');
        $query->execute([$pathImg, $id]);
    }
     
}