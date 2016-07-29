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

  this.postToApp = function (accessesUrl) {

     access = {
       user: this.user,
       url: this.url,
       date: this.date,
     };

     $.ajax({
       url: accessesUrl,
       type: 'POST',
       crossDomain: true,
       data: JSON.stringify(access),
       contentType: 'application/json',
       dataType: 'json'
     });
  }

}

$(document).ready(function() {

  const userID = getUserID();
  const currentUrl = $(location).attr('href');
  const currentDate = new Date().toLocaleString();

  const access = new Access(userID, currentUrl, currentDate);
  access.postToApp('https://damp-bayou-52784.herokuapp.com/accesses');  
}); 
