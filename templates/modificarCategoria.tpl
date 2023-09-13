{* Incluímos el header *}
{include file = 'templates/header.tpl'}

{* Titulo modificación *}
<h1 class="title"> {$titulo} </h1>

{* Mostramos item a modificar *}


<form name='formulario' action='modificarCategoria/{$categoria->id}' method='GET' class='my-4'>
    <div class='row'>
       
        <div class='col-9'>
            <div class='form-group'>
                <label>Categoria</label>
                <input name='descripcion' class='form-control' value="{$categoria->descripcion}">
            </div>
        </div>
    </div>
    <button type='submit' class='btn btn-primary mt-2'>Guardar Modificación</button>
</form>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}