<?php

class CategoriaModel {

    private $db;

    /// Constructor
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_productos;charset=utf8', 'root', '');
        $this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    }

    /// Obtiene todas las categorias
    function obtenerCategorias() {
        $consulta = "SELECT * FROM categorias";
        $query = $this->db->prepare($consulta);
        $query->execute();
        $categorias = $query->fetchAll(PDO::FETCH_OBJ); 
        return $categorias;
    }
    
    /// Obtiene una categoria
    function obtenerCategoria($id) {
        $consulta = "SELECT * FROM categorias WHERE id=?";
        $query = $this->db->prepare($consulta);
        $query->execute([$id]);
        $categoria = $query->fetch(PDO::FETCH_OBJ);
        return $categoria;
    }
   
    /// Agrega una categoria
    function agregarCategoria($descripcion) {
        $query = $this->db->prepare('INSERT INTO categorias(descripcion) VALUES (?)');
        $query->execute([$descripcion]);
        return $this->db->lastInsertId();
    }

    /// Elimina una categoria
    function borrarCategoria($id) {    
        $query = $this->db->prepare('DELETE FROM categorias WHERE id=?');
        $query->execute([$id]);
    }

    /// Modifica una categoria
    function modificarCategoria($id, $descripcion) {
        try{
            $query = $this->db->prepare('UPDATE categorias SET descripcion=? WHERE id=?');
            $query->execute([$descripcion, $id]);
        }
        catch (PDOException $error) {
            $error->getMessage();
            echo $error;
        }
    } 

}