{include file = 'templates/header.tpl'}

{* Encabezado de la lista *}
<h3 {$titulo} </h3>
{* <h3> {$producto} </h3> *}

<ul class="list-group list-unstyled mt-5">

<table class='table table-sm' id="listaComentarios">
     {* Acá va hueco para mostrar comentarios CSR *}
</table>

<script src = "js/app.js"> </script>


{* Incluímos el footer *}
{include file = 'templates/footer.tpl'}