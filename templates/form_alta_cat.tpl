{* Incluímos el header *}
{include file = 'templates/header.tpl'}

{* Titulo modificación *}
<h1 class="title"> {$titulo} </h1>

<form action="addCategory" method="POST" class="my-3">
    <div class="row">
        <div class='col-2'>
            <div class='form-group'>
                <label>Categría: </label>
                <input name='descripcion' class='form-control'>
            </div>
        </div>
    </div>
<div class='mt-2'>
    <button type="submit" class="btn btn-secondary btn-sm">Agregar</button>
</div> 
</form>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}