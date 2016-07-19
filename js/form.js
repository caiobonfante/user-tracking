$(document).ready(function() {
 
  $("#form").validate({

    rules: {
      email: {
        required:true,
        email: true,
      } 
    },
  
    messages: {
      email: "Insira um email válido!",
    },
  
    submitHandler: function(form) {

      const id = localStorage.getItem('userId');
      const email = $('#email').val();      

      formData = {
        id: id,
        email: email,
      }

      sendPostRequest('http://httpbin.org/post', formData);
    }    

  }); 
});
