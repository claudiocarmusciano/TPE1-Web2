<?php

class ComentarioModel {

    private $db;

    /// Constructor
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_productos;charset=utf8', 'root', '');
        $this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    }

    /// Obtiene todos los comentarios
    function getAllComments($id_producto) {
        $query = $this->db->prepare ('SELECT * FROM comentarios WHERE id_producto=?');
        $query->execute([$id_producto]);
        $comentarios = $query->fetchAll(PDO::FETCH_OBJ);
        return $comentarios;
    }

    /// Obtiene un comentario
    function getOneComment($id) {
        $consulta = "SELECT * FROM comentarios WHERE id=?";
        $query = $this->db->prepare ($consulta);
        $query->execute([$id]);
        $comentario = $query->fetch(PDO::FETCH_OBJ);
        return $comentario;
    }

    /// Agrega un comentario
    function addComment($comentario, $puntuacion, $producto) {
        $query = $this->db->prepare('INSERT INTO comentarios(comentario, puntuacion, id_producto) VALUES (?, ?, ?)');
        $query->execute([$comentario, $puntuacion, $producto]);
        return $this->db->lastInsertId();
    }
    
    /// Elimina un comentario
    function deleteOneComment($id) {
        $query = $this->db->prepare('DELETE FROM comentarios WHERE id=?');
        $query->execute([$id]);
    }
     
}