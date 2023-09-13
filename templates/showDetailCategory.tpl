{include file = 'templates/header.tpl'}

{* Encabezado de la lista *}
<h1 class="title"> {$titulo} </h1>
<ul class="list-group list-unstyled mt-5">

<ul class="list-group list-unstyled mt-5">
<table class='table table-sm'>
    <tr>
        <th>ID</th> <th>DESCRIPCION</th> 
    </tr>

    <tr>
        <td>{$item->id}</td>
        <td>{$item->descripcion}</td> 
    </tr>    
</table>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}