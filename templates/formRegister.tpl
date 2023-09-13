{include file = 'header.tpl'}

<div class="mt-5 w-25 mx-auto">

    <form method="POST" action="verifyRegister"> 
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" required class="form-control" id="email" name="email" aria-describedby="emailHelp">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" required class="form-control" id="password1" name="password1">
        </div>
        <div class="form-group">
            <label>Reingrese Password</label>
            <input type="password" required class="form-control" id="password2" name="password2">
        </div>

        {if $error} 
        <div class="alert alert-danger mt-3">
            {$error}
        </div>
        {/if}
        
        <button type="submit" class="btn btn-success mt-3">Registrarse</button>
    </form>
</div>

{include file = 'footer.tpl'}