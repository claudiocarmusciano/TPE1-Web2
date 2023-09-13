
{* Incluímos el header *}
{include file = 'templates/header.tpl'}

{* Encabezado de la lista *}
<h1 class="title"> {$titulo} </h1>
<ul class="list-group list-unstyled mt-5">
<div>
    <table class='table' >
        <tr>
            <th>SKU</th> <th>DESCRIPCION</th> <th>PRECIO</th> <th>STOCK</th> <th>CATEGORIA</th><th>IMAGEN</th>
        </tr>
    {* listado *}
        {foreach from=$items item=item}
            
            <tr>  
                <td>{$item->sku}</td> 
                <td>{$item->descripcion}</td> 
                <td>{$item->precio}</td> 
                <td>{$item->stock}</td> 
                <td>{$item->categoria}</td>
                <td>
                    {if isset({$item->imagen})}
                        {if {$item->imagen} != null}
                            <img src="{$item->imagen}" height="40" width="40">
                        {/if}
                    {/if}
                </td>
                <td class='d-inline p-1'><a class='btn btn-danger btn-sm' href='delProduct/{$item->id}'>Borrar<a></td>
                <td class='d-inline p-1'><a class='btn btn-success btn-sm' href='EditProduct/{$item->id}'>Modificar<a></td>
                <td class='d-inline p-1'><a class='btn btn-primary btn-sm' href='VerDetalleProducto/{$item->id}'>Ver detalle<a></td>
            </tr>    
        {/foreach}

    </table>
</div>
{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}