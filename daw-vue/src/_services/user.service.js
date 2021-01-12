import config from 'config';
import axios from 'axios';
export const userService = {
  login,
  logout,
  register,
  user: JSON.parse(localStorage.getItem('userDetails'))
};

function parseJwt (token) {
  return new Promise((resolve, reject) => {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
      return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));

    resolve(JSON.parse(jsonPayload));
  })
};

function login(email, password) {
  const requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: {
    	email,
    	password
    }
  };

  return axios({
  	method: 'POST',
  	url: `${config.apiUrl}/identity/login`,
  	data: requestOptions.body,
  	headers: requestOptions.headers
  }).then((response) => {
  	// Login was succsefull if there's a JWT Token in the Response
  	if (response.data.token) {
  		response.data.token = `Bearer ${response.data.token}`;
  		localStorage.setItem('user', JSON.stringify(response.data));
  		const parsedToken = parseJwt(response.data.token).then((user) => {
  			console.log(user)
    		const userDetails = {
    			firstName: user["firstName"],
    			lastName: user["lastName"],
    			email: user["email"],
    			id: user["id"],
    			role: user["role"]
    		};

    		userService.user = userDetails;

    		localStorage.setItem('userDetails', JSON.stringify(userDetails));
      });
  	}

  	return response;
  });
};

function logout() {
  // remove user from local storage to log user out
  localStorage.removeItem('user');
  localStorage.removeItem('userDetails');
}

function register(user) {
  const requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(user)
  };

  return axios({
  	method: requestOptions.method,
    url: `${config.apiUrl}/identity/register`,
    data: requestOptions.body,
    headers: requestOptions.headers
  }).then((response) => {
  	console.log(response)
    return {
    	status: response.status,
    	data: response.data
    }
  }).catch((error) => {
    // handle error
    return {
    	status: error.response.status,
    	errors: error.response.request.response
    };
  });
}
