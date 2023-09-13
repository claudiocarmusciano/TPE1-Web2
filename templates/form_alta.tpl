<!-- Agrego un producto -->
{include file = 'templates/header.tpl'}

{* Titulo modificación *}
<h1 class="title"> {$titulo} </h1>

<form action="addProduct" method="POST" class="my-3" enctype="multipart/form-data">
    <div class="row">
        <div class='col-2'>
            <div class='form-group'>
                <label>SKU</label>
                <input name='sku' class='form-control'>
            </div>
        </div>
        <div class='col-5'>
            <div class='form-group'>
                <label>Descripcion</label>
                <input name='descripcion' class='form-control'>
            </div>
        </div>
        <div class='col-2'>
            <div class='form-group'>
                <label>Precio</label>
                <input name='precio' class='form-control'>
            </div>
        </div>
        <div class='col-2'>
                <div class='form-group'>
                    <label>Categoria</label> 
                    <select class='form-control' name='categoria'>
                        {foreach from=$categorias item=$categoria}    
                            <option value="{$categoria->id}"> {$categoria->descripcion}</option>
                        {/foreach}
                    </select>   
                </div>
        </div>
        <div class='col-1'>
            <div class='form-group'>
                <label>Stock</label>
                <input name='stock' class='form-control'>
            </div>
        </div>
    </div>

    <div class="form-group">
        <input class="my-3" type="file" name="input_name" id="imageToUpload">
    </div>

    <div class='mt-2'>
        <button type="submit" class="btn btn-secondary btn-sm">Agregar</button>
    </div> 
    
</form>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}