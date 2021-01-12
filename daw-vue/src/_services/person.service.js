import config from 'config';
import axios from 'axios';
export const personService = {
  deletePerson,
  getPersons,
  getPersonByCurrentUserId
};

function deletePerson(personId) {
    const requestOptions = {
        method: 'DELETE',
        headers: { 
          'Content-Type': 'application/json', 
          'authorization': JSON.parse(localStorage.getItem('user')).token
        },
    };
  
    return axios({
      method: requestOptions.method,
      url: `${config.apiUrl}/persons/delete/${personId}`,
      headers: requestOptions.headers,
    }).then((response) => {
      return response.data;
    }).catch(function (error) {
      // handle error
      console.log(error);
    })
    .finally(function () {
      // always executed
    });
  }
  
  function getPersons () {
    const requestOptions = {
        method: 'GET',
        headers: { 
          'Content-Type': 'application/json', 
          'authorization': JSON.parse(localStorage.getItem('user')).token
        }
    };
  
    return axios({
      method: requestOptions.method,
      url: `${config.apiUrl}/persons`,
      headers: requestOptions.headers
    }).then((response) => {
      return response.data;
    }).catch(function (error) {
      // handle error
      console.log(error);
    })
    .finally(function () {
      // always executed
    });
  }
  function deletePerson(personId) {
    const requestOptions = {
        method: 'DELETE',
        headers: { 
          'Content-Type': 'application/json', 
          'authorization': JSON.parse(localStorage.getItem('user')).token
        },
    };
  
    return axios({
      method: requestOptions.method,
      url: `${config.apiUrl}/persons/delete/${personId}`,
      headers: requestOptions.headers,
    }).then((response) => {
      return response.data;
    }).catch(function (error) {
      // handle error
      console.log(error);
    })
    .finally(function () {
      // always executed
    });
  }
  
  function getPersonByCurrentUserId () {
    const requestOptions = {
        method: 'GET',
        headers: { 
          'Content-Type': 'application/json', 
          'authorization': JSON.parse(localStorage.getItem('user')).token
        }
    };
  
    return axios({
      method: requestOptions.method,
      url: `${config.apiUrl}/personbyuserid`,
      headers: requestOptions.headers
    }).then((response) => {
      return response.data;
    }).catch(function (error) {
      // handle error
      console.log(error);
    })
    .finally(function () {
      // always executed
    });
  }
  