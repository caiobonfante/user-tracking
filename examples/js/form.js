$(document).ready(function() {
 
  $("#form").validate({

    rules: {
      email: {
        email: true,
      } 
    },
  
    messages: {
      email: "Insira um endereço de email válido!",
    },
  
    submitHandler: function(form) {
      
      const userID = localStorage.getItem('userID');
      const email = $('#email').val();      

      contact = {
        user: userID,
        email: email,
      }

      $.post('http://localhost:3000/contacts/create', contact)
        .done(function() {
          alert( "Contato enviado!" );
        });
        .fail(function() {
          alert( "Contato NÃO enviado!" );
        });
    }    
  }); 
});
