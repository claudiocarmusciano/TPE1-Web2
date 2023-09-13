{* Incluímos el header *}
{include file = 'templates/header.tpl'}

{* Titulo modificación *}
<h1 class="title"> {$titulo} </h1>

{* Mostramos item a modificar *}

<form name='formulario' action='modificarUsuario/{$user->id}' method='GET' class='my-4'>
    <div class='row'>
       
        <div class='col-9'>
            <div class='form-group'>
                <label>Email</label>
                <p>{$user->email}</p>
                <label>Rol (A/N)</label>
                <input type="text" required class="form-control" id="rol" name="rol" value={$user->rol}>
            </div>
        </div>
    </div>
    <button type='submit' class='btn btn-primary mt-2'>Guardar Modificación</button>
</form>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}