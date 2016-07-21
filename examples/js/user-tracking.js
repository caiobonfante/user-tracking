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

      $.post(createUrl, access)
   }
}

$(document).ready(function() {

  const userID = getUserID();
  const currentUrl = $(location).attr('href');
  const currentDate = new Date().toLocaleString();

  const access = new Access(userID, currentUrl, currentDate);
  access.create('http://httpbin.org/post');  
}); 
