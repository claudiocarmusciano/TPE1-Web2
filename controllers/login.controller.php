<?php
require_once 'models/user.model.php';
require_once 'views/auth.view.php';
require_once 'helpers/auth.helper.php';

class AuthController {
    private $model;
    private $view;
    private $authHelper;

    /// Constructor
    public function __construct() {
        $this->model = new UserModel();
        $this->view = new AuthView();
        $this->authHelper = new AuthHelper();
    }

    /// Muestra el formulario para loguearse
    public function showLogin() {
        $this->view->showFormLogin();
    }

    /// Muestra el formulario de registro
    public function showRegister() {
        $this->view->showFormRegister();
    }

    /// Obtiene los datos del login y los valida
    public function login() {
        if (!empty($_POST['email']) && !empty($_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];
            $user = $this->model->getUser($email);

            if ($user && password_verify($password, $user->password)) {
                session_start();
                $_SESSION['USER_ID'] = $user->id;
                $_SESSION['USER_EMAIL'] = $user->email;
                $_SESSION['USER_ROL'] = $user->rol;
                header("Location: " . BASE_URL);
            } else {
                $this->view->showFormLogin("Usuario o contraseña inválida");
            }
        }
    }

    /// Registro nuevo Usuario (No administrador)
    public function register() {
        if (!empty($_POST['email']) && !empty($_POST['password1']) && !empty($_POST['password2'])) {
            
            $email = $_POST['email'];
            $password1 = $_POST['password1'];
            $password2 = $_POST['password2'];
            if ($password1 == $password2) {
                $rol = 'N';
                $user = $this->model->addUser($email, $password1, $rol);
                session_start();
                $_SESSION['USER_ID'] = $user;
                $_SESSION['USER_EMAIL'] = $email;
                $_SESSION['USER_ROL'] = $rol;
                header("Location: " . BASE_URL);
            } else {
                $this->view->showFormRegister("No coinciden los password");             
            }
        } else {
            $this->view->showFormRegister("Faltan ingresar datos");
        }     
    }

    /// Muestra todos los usuarios
    public function showUsers() {
        $users = $this->model->obtenerUsuarios();
        $this->view->showUsers($users);
    }

    /// Elimina un usuario
    public function delUser($id) {
        $this->model->borrarUsuario($id);
        header("Location: " . BASE_URL);
    }

    /// Muestra el usuario editado
    public function editUser($id) {
        $user = $this->model->obtenerUsuario($id);
        $this->view->editUser($user);
    }

    /// Modifica el usuario
    public function modifyUser($id) {     
        if (!empty($_GET['rol']) && (($_GET['rol']=='A') || ($_GET['rol']=='N'))) {
            $newRol = $_GET['rol'];
            $this->model->modificarRol($id, $newRol); 
        }
        header("Location: " . BASE_URL. "usuarios");
    }

    /// Cierra la sesion
    public function logout() {
        $this->authHelper->logout();
    }
}
