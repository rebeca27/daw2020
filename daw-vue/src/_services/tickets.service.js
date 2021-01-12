import config from 'config';
import axios from 'axios';
import {userService} from './user.service';

export const ticketsService = {
	currentEventId: null,
	getTicketsForEvent,
	getTicketTypes,
	buyTickets,
	getTicketsForUser,
	refundTickets,
	createTickets,
  tickets: {},
};

function getTicketsForEvent () {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };
  console.log()
  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/tickets/event/${ticketsService.currentEventId}`,
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

function getTicketsForUser () {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/personxtickets/currentperson`,
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

function getTicketTypes() {
  const requestOptions = {
      method: 'GET',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      }
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/tickettypes`,
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

function buyTickets(tickets, ticketTypes) {
	const userDetails = JSON.parse(localStorage.getItem('userDetails'));
  const requestOptions = {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      },
  };

  tickets.forEach((ticket) => {
  	if (ticket.nrOfBought === 0) {
  		return;
  	}
  	
  	let data = {
  		ticketId: ticket.id,
  		nrOfBought: ticket.nrOfBought
  	}

	  axios({
	    method: requestOptions.method,
	    url: `${config.apiUrl}/personxtickets`,
	    headers: requestOptions.headers,
	    data
	  }).then((response) => {
	    return response.data;
	  }).catch(function (error) {
	    // handle error
	    console.log(error);
	  })
	  .finally(function () {
	    // always executed
	  });
  })
}

function refundTickets(ticketId) {
	const userDetails = JSON.parse(localStorage.getItem('userDetails'));
  const requestOptions = {
      method: 'DELETE',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      },
  };

  return axios({
    method: requestOptions.method,
    url: `${config.apiUrl}/personxtickets/${ticketId}`,
    headers: requestOptions.headers,
  }).then((response) => {
    return true;
  }).catch(function (error) {
    // handle error
    console.log(error);
  })
  .finally(function () {
    // always executed
  });
}

function createTickets(tickets) {
  const requestOptions = {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json', 
        'authorization': JSON.parse(localStorage.getItem('user')).token
      },
  };

  tickets.forEach((ticket) => {
  	if (ticket.remaining === 0) {
  		return;
  	}
  	
	  axios({
	    method: requestOptions.method,
	    url: `${config.apiUrl}/tickets`,
	    headers: requestOptions.headers,
	    data: ticket
	  }).then((response) => {
	    return response.data;
	  }).catch(function (error) {
	    // handle error
	    console.log(error);
	  })
	  .finally(function () {
	    // always executed
	  });
  })
}