{* Incluímos el header *}
{include file = 'templates/header.tpl'}

{* Encabezado de la lista *}
<h1 class="title"> {$titulo} </h1>
<ul class="list-group list-unstyled mt-5">
<table class='table table-sm'>
    <tr>
        <th>DESCRIPCION</th>
    </tr>
{* listado *}
    {foreach from=$items item=$item} 
        <tr>
            <td>{$item->descripcion}</td>
            <td class='d-inline p-2'><a class='btn btn-danger btn-sm' href='delCategory/{$item->id}'>Borrar<a></td>
            <td class='d-inline p-2'><a class='btn btn-success btn-sm' href='EditCategory/{$item->id}'>Modificar<a></td>
            <td class='d-inline p-2'><a class='btn btn-primary btn-sm' href='VerDetalleCategoria/{$item->id}'>Ver detalle<a></td>
            <td class='d-inline p-2'><a class='btn btn-secondary btn-sm' href='verProductosAsociados/{$item->id}'>Ver productos asociados<a></td>

        </tr>
    {/foreach}
</table>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}