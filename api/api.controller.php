<?php
require_once 'models/comentario.model.php';
require_once 'api/api.view.php';

class ApiController {
    private $comentarioModel;
    private $view;
    private $data;

    /// Constructor
    function __construct() {
        $this->comentarioModel = new ComentarioModel();
        $this->view = new ApiView();
    }

    /// Se lee el body del request
    private function getBody() {
        $data = file_get_contents("php://input");
        return json_decode($data);
    }

    /// Obtiene todos los comentarios
    public function getComments($params = null) {  
        $id_producto = $params[':ID'];
        $comentarios = $this->comentarioModel->getAllComments($id_producto);
        $this->view->response($comentarios, 200);
    }

    /// Obtiene un comentario
    public function getOneComment($params = null) {
        $id = $params[':ID'];
        $comment = $this->comentarioModel->getOneComment($id);
        if ($comment)
            $this->view->response($comment);
        else
        $this->view->response("Comment id=$id not found", 404);
    }

    /// Agrega un comentario
    public function addComment($params = null) {
        $data = $this->getBody();

        $comentario = $data->comentario;
        $puntuacion = $data->puntuacion;
        $producto = $data->id_producto;
        $id = $this->comentarioModel->addComment($comentario, $puntuacion, $producto);
        
        $comentario = $this->comentarioModel->getOneComment($id);
        if ($comentario)
            $this->view->response($comentario, 200);
        else
            $this->view->response("La tarea no fue creada", 500);
    }

    /// Elimina un comentario
    public function deleteComment($params = null) {
        $id = $params[':ID'];
        $comment = $this->comentarioModel->getOneComment($id);
        
        if ($comment) {
            $this->comentarioModel->deleteOneComment($id);
            $this->view->response("Comment id=$id remove successfuly");
        } else {
            $this->view->response("Comment id=$id not found", 404);
        }
    }

}
