function getUserID() {
  if (localStorage.getItem('userID') === null) {
      const userID = generateUID();
      localStorage.setItem('userID', userID)
  }

  return localStorage.getItem('userID');
}

function Data(user, url, date) {

  this.user = user;
  this.url = url;
  this.date = date;

  function sendToApp(appUrl) {
 
     data = {
        user: this.user,
        url: this.url,
        date: this.date,
      };

      sendPostRequest(appUrl, data)
   }
}

$(document).ready(function() {

  const appUrl = 'http://httpbin.org/post';
  const userID = getUserID();
  const currentUrl = $(location).attr('href');
  const currentDate = new Date().toLocaleString();

  data = new Data(userID, currentUrl, currentDate);
  data.sendToApp(appUrl);  
}); 
