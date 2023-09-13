

{if ($logged == "A") || ($logged == "N")} 

    {literal}
    <div id="app">
    
        <form id='formAddComment' @submit='addComment' method='POST' >
            <h2>{{ titulo }} </h2>
            <div class="col-9">
                <div class="form-group">
                    <label>Comentario</label>
                    <input name="comentario" type="text" class="form-control">
                </div>
            </div>

            <div class="col-3">
                <div class="form-group">
                    <label>Puntuación</label>
                    <select name="puntuacion" class="form-control">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>
            <br>
            <input type="submit" class="btn btn-success btn-sm" value="Agregar comentario">
            <br>
            <br>
        </form>
    {/literal}

{/if}

    

    {literal}
    <div id="app">
        <form @submit='delComment' method='POST'>
    
            <ul id="comment-list" class="list-group">
                <h5>Comentario | Puntuacion</h5>  
                  
                <li v-for="comentario in comments" class="list-group-item d-flex">
                    {{comentario.comentario}} | {{comentario.puntuacion}}
    {/literal}
    {if ($logged == "A")} 
        {literal}
     
                <div class="acciones ms-auto" >
                    <button class="btn btn-sm btn-danger" v-on:click="delComment(comentario.id)">Borrar</button>
                </div>
          
        {/literal}
    {/if}

    {literal}
    
        <div id="app">

                    </li>             
                </ul>
            </form>
    {/literal}
