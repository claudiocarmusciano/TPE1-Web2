{include file = 'header.tpl'}

<div class="mt-5 w-25 mx-auto ">
    {if $error} 
        <div class="alert alert-danger mt-3">
            {$error}
        </div>
    {/if}
</div> 

{include file = 'footer.tpl'}