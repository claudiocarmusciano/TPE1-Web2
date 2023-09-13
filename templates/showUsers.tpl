{include file = 'templates/header.tpl'}

{* Encabezado de la lista *}
<h1 class="title"> {$titulo} </h1>
<ul class="list-group list-unstyled mt-5">

<ul class="list-group list-unstyled mt-5">
<table class='table table-sm'>
    <tr>
        <th>ID</th> <th>EMAIL</th> <th>ROL (A=administrador - N=no administrador)</th>
    </tr>

    {foreach from=$users item=$user}
        <tr>
            <td>{$user->id}</td> 
            <td>{$user->email}</td> 
            <td>{$user->rol}</td> 
            <td class='d-inline p-2'><a class='btn btn-danger btn-sm' href='delUser/{$user->id}'>Borrar<a></td>
            <td class='d-inline p-2'><a class='btn btn-success btn-sm' href='editUser/{$user->id}'>Modificar rol<a></td>
        </tr>    
    {/foreach}
</table>

{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}