<template> 
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              Ticket Types
            </slot>
          </div>

          <div class="modal-body">
            <slot name="body">
              <div class="counter" v-for="(ticket, key) in tickets" :key="ticket.id">
                <p>{{ticket.ticketTypeName}} - {{ticket.price}} RON</p>
                <span class="counter__span-group">
                  <button class="btn" @click="removeTicket(key)"> - </button>
                  <span>{{ticket.nrOfBought}}</span>
                  <button class="btn" @click="addTicket(key)"> + </button>
                </span>
              </div>
            </slot>
          </div>

          <div class="modal-footer">
            <slot name="footer">
              <button class ="btn btn-primary modal_buy" @click="buyTickets()">
                Buy tickets!
              </button>
              <button class="btn modal_cancel" @click="$emit('close')">
                Cancel
              </button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import {ticketsService} from '../_services/tickets.service.js';

  export default {
    name: 'Modal',
    data() {
      return {
        tickets: [],
        ticketTypes: []
      }
    },
    created() {
      this.loadTicketsForEvent();
    },
    methods: {
      async loadTicketsForEvent() {
        this.ticketTypes = await ticketsService.getTicketTypes();
        this.tickets = await ticketsService.getTicketsForEvent();
        this.tickets.map((ticket) => {
          ticket.nrOfBought = 0;
          ticket.ticketTypeName = _.find(this.ticketTypes, {"id": ticket.ticketTypeId}).name;
          return ticket;
        })
      },
      addTicket(key) {
        this.tickets[key].nrOfBought++;
        this.$forceUpdate();
      },
      removeTicket(key) {
        if (this.tickets[key].nrOfBought > 0) {
          this.tickets[key].nrOfBought--;
          this.$forceUpdate();
        }
      },
      buyTickets() {
        ticketsService.buyTickets(this.tickets, this.ticketTypes);
        this.$emit('close');
      }
    }
  }


</script>

<style>
.counter {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin: 10px 0px;
  width: 300px;
  display: inline-flex;
  position: relative;
}

.counter button {
  color: #FFF;
  background-color: #3b5998; 
  padding: 0 5px;
  margin: 0 10px;
}

.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  max-width: 600px;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  /*font-family: Helvetica, Arial, sans-serif;*/
}

.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}

.modal-body {
  min-height: 200px;
  margin: 20px 0;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.modal-footer { 
  display: flex;
  flex-direction: row;
  align-items: center;
}

.modal_buy {
  border: 1px solid black;
  background-color: #3b5998; 
}

.modal_cancel {
  border: 1px solid black;
}

.counter__span-group { 
  float: right;
  position: absolute;
  right: 0px;
}

</style>