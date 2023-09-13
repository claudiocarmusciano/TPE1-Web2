"use strict"

const API_URL = "api/comentarios/"; 
const logged = "A";

let app = new Vue({
    el: "#app",
    data: {
        titulo: "Comentarios",
        comments: [],
    },

    methods: {
        /// Agrega un comentario
        addComment: function (e) {
            e.preventDefault();
            postComment();
        },
        /// Elimina un comentario
        delComment: function (id) {
            deleteComment(id);
        }
    }
});

/// Obtiene el ID del producto
function getProductID() {
    let id_producto = document.getElementById('listCommentsVue').getAttribute('data-idProducto');
    return id_producto;
}

/// Obtiene todos los comentarios
async function getComments() {
    let id_producto = getProductID();
    try {
        let response = await fetch(API_URL + 'producto/' + id_producto);
        let nComments = await response.json();
        app.comments = nComments;
        console.log (nComments);
    } catch(e) {
        console.log(e);
    }
    
}

/// Agrega un comentario
async function postComment() {
    var data = new FormData(formAddComment);
    let comment = {
        comentario: data.get('comentario'),
        puntuacion: data.get('puntuacion'),
        id_producto: getProductID(),
    }
    try {
        let response = await fetch(API_URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(comment),
        });

        if (response.ok) {
            let comment = await response.json();
            app.comments.push(comment);
        }
    } catch(e) {
        console.log(e)
    }
}

/// Elimina un comentario
async function deleteComment(id) {
    try {
        let response = await fetch(API_URL + id , {
            "method": "DELETE"
        });
        if (response.ok) {
            console.log("Comentario eliminado con exito");
        }
    } catch (e) {
        console.log(e);
    }
}

getComments();