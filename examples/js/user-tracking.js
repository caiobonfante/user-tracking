function generateUID() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

function getUserID() {

  if (localStorage.getItem('userID') === null) {
      const userID = generateUID();
      localStorage.setItem('userID', userID)
  }

  return localStorage.getItem('userID');
}

function Access(user, url, date) {

  this.user = user;
  this.url = url;
  this.date = date;

  this.create = function (createUrl) {

     access = {
         user: this.user,
         url: this.url,
         date: this.date,
     };

     $.ajax({
       url:createUrl,
       type:"POST",
       crossDomain: true,
       data:JSON.stringify(access),
       contentType:"application/json; charset=utf-8",
       dataType:"jsonp"
    });
  }

}

$(document).ready(function() {

  const userID = getUserID();
  const currentUrl = $(location).attr('href');
  const currentDate = new Date().toLocaleString();

  const access = new Access(userID, currentUrl, currentDate);
  access.create('https://peaceful-brushlands-35044.herokuapp.com/accesses');  
}); 
