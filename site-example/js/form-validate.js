$(document).ready(function() {
 
  $("#form").validate({

    rules: {
      email: {
        required: true,
        email: true,
      } 
    },
  
    submitHandler: function(form) {
      
      const userID = localStorage.getItem('userID');
      const email = $('#email').val();      

      contact = {
        user: userID,
        email: email,
      }

      $.post('http://localhost:3000/contacts', contact)
    }    
  }); 
});
