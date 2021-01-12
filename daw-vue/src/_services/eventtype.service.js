import config from 'config';
import axios from 'axios';
export const eventTypeService = {
    getAll,
    getById,
    createEventType,
    updateEventType,
    deleteEventType
};

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
    url: `${config.apiUrl}/types`,
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

function getById(id) {
    const requestOptions = {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    };

    return axios({method: requestOptions.method,
            url: `${config.apiUrl}/types/` + id,
            headers: requestOptions.headers}).then((response) => {
                return response.data;
            }).catch(function (error) {
                // handle error
                console.log(error);
            })
            .finally(function () {
                // always executed
            });;
}

function createEventType(eventType) {
    const requestOptions = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(eventType)
    }

    return axios({method: requestOptions.method,
                  url: `${config.apiUrl}/types`,
                  data: requestOptions.body,
                  headers: requestOptions.headers}).then((response) => {
                      return response.data;
                  }).catch(function (error) {
                      console.log(error);
                  }).finally(function () {
                      //always executed
                  });
    }

    function updateEventType(eventType) {
        const requestOptions = {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(eventType)
        }
    
        return axios({method: requestOptions.method,
                      url: `${config.apiUrl}/types`,
                      data: requestOptions.body,
                      headers: requestOptions.headers}).then((response) => {
                          return response.data;
                      }).catch(function (error) {
                          console.log(error);
                      }).finally(function () {
                          //always executed
                      });
        }

        function deleteEventType(id) {
            const requestOptions = {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' }
            }
        
            return axios({method: requestOptions.method,
                          url: `${config.apiUrl}/types`,
                          data: requestOptions.body,
                          headers: requestOptions.headers}).then((response) => {
                              return response.data;
                          }).catch(function (error) {
                              console.log(error);
                          }).finally(function () {
                              //always executed
                          });
            }

