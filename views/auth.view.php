<?php
require_once './libs/smarty-3.1.39/libs/Smarty.class.php';

class AuthView {
    private $smarty; 

    function __construct() {
        $this->smarty = new Smarty();
    }

    function showFormLogin($error = null) {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/formLogin.tpl');
    }

    function showFormRegister($error = null) {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/formRegister.tpl');
    }

    function showUsers($users) {
        $this->smarty->assign('titulo', 'Listado de usuarios');
        $this->smarty->assign('users', $users);
        $this->smarty->display('templates/showUsers.tpl');
    }

    function editUser($user) {
        $this->smarty->assign('titulo', 'Editar Usuarios');
        $this->smarty->assign('user', $user);
        $this->smarty->display('templates/editUser.tpl');
    }

    
}
