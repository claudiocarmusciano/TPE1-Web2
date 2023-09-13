<?php

class UserModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_productos;charset=utf8', 'root', '');
        $this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    }

    function getUser($email) {
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE email = ?');
        $query->execute([$email]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }

    function addUser($email, $password, $rol) {
        $query = $this->db->prepare('INSERT INTO usuarios(email, password, rol) VALUES (?,?,?)');
        $newPassword = password_hash($password, PASSWORD_DEFAULT);
        $query->execute([$email, $newPassword, $rol]);
        return $this->db->lastInsertId();
    }

    function obtenerUsuarios() {
        $query = $this->db->prepare('SELECT * FROM usuarios');
        $query->execute();
        $users = $query->fetchAll(PDO::FETCH_OBJ);
        return $users;
    }

    function obtenerUsuario($id) {
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE id = ?');
        $query->execute([$id]);
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user;
    }

    function borrarUsuario($id) {
        $query = $this->db->prepare('DELETE FROM usuarios WHERE id=?');
        $query->execute([$id]);
    }

    function modificarRol($id, $rol) {
        try{        
            $query = $this->db->prepare('UPDATE usuarios SET rol=? WHERE id=?');
            $query->execute([$rol, $id]);
        }
        catch (PDOException $error) {
            $error->getMessage();
            echo $error;
        }
    }    
}

