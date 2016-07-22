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
      const contactsUrl = 'https://damp-bayou-52784.herokuapp.com/contacts'

      contact = {
        user: userID,
        email: email
      };

      $.ajax({
        url: contactsUrl,
        type: 'POST',
        crossDomain: true,
        data: JSON.stringify(contact),
        contentType: 'application/json; charset=UTF-8',
        dataType: 'json'
      });

    }    
  }); 
});
