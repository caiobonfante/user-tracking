function setUserId() {
  if (localStorage.getItem('userId') === null) {
      const userId = generateUID();
      localStorage.setItem('userId', userId)
  }
}

function getUserData() {
  const currentUrl = $(location).attr('href');
  const currentDate = new Date().toLocaleString();
  const userId = localStorage.getItem('userId');
  
  const userData = {
    id: userId,
    url: currentUrl,
    date: currentDate,
  };
  return userData;
}

function sendUserData(appUrl) {
  const userData = getUserData();
  sendPostRequest(appUrl, userData);
}

$(document).ready(function() {
  const appUrl = 'http://httpbin.org/post';
  setUserId();
  sendUserData(appUrl);
}); 
