import config from 'config';
import axios from 'axios';
export const eventsService = {
  getAll,
  getEventById,
  EventGenres,
  getAllGenres,
  getAllLocations,
  createEvent,
  deleteEvent,
  getGenresByType
};

let EventGenres;

function getAllGenres () {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/genres`,
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

function getGenresByType (typeId) {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/typexgenreselect/${typeId}`,
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

function getAllLocations () {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/locations`,
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


function getAll() {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/events`,
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

function getEventById(id) {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/events/${id}?eventParentId=${id}`,
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

function createEvent(event) {
  const requestOptions = {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      },
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/events`,
    headers: requestOptions.headers,
    data: event
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

function deleteEvent(eventId) {
  const requestOptions = {
      method: 'DELETE',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      },
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/events/${eventId}`,
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

