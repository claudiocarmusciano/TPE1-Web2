
{include file = 'templates/header.tpl'}

{* Encabezado de la lista *}
<h1 class="title"> {$titulo} </h1>
{* <ul class="list-group list-unstyled mt-5"> *}

<ul class="list-group list-unstyled mt-5">
<table class='table table-sm'>
    <tr>
        <th>ID</th> <th>SKU</th> <th>DESCRIPCION</th> <th>PRECIO</th> <th>STOCK</th> <th>CATEGORIA</th>
    </tr>

    <tr>
        <td>{$item->id}</td>
        <td>{$item->sku}</td> 
        <td>{$item->descripcion}</td> 
        <td>{$item->precio}</td> 
        <td>{$item->stock}</td> 
        <td>{$categoria->descripcion}</td>
    </tr>    

    <div>
        {if isset($item->imagen)}
            <img src="{$item->imagen}" height="100" width="100">
        {/if}
    </div>

</table>

<div class="col-md-8" id="listCommentsVue" data-idProducto="{$item->id}">
        <!-- hueco para CSR -->

        {* Se pasa parámetro rol al .tpl VUE *}
        {include file="vue/commentsListVue.tpl" logged={$rol}}  
        {*  *}
</div>

<script src = "js/app.js"> </script>
{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}