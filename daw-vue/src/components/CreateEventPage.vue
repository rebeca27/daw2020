<template>
  <div class="container">
    <span>
      <i class="material-icons event-page__close-button" @click="goToEvents()">keyboard_backspace</i>
    </span>
    <div class="event-page">
      <div class="form-item">
        <md-field>
          <label for="name">Event Name</label>
          <md-input name="name" v-model="event.name" v-bind:value="event.name" />
        </md-field>
      </div>
	  <div class="form-item">
        <md-field>
          <label for="photoURL">Photo URL</label>
          <md-input name="photoURL" v-model="event.photoURL" v-bind:value="event.photoURL" />
        </md-field>
      </div>
      <div class="form-item">
        <md-field>
          <label for="description">Event Description</label>
          <md-textarea name="description" v-model="event.description" />
        </md-field>
      </div>
      <div class="form-item">
        <md-field>
          <label for="eventType">Event Type</label>
          <md-select
            name="Event Type"
            v-model="event.eventTypeId"
            md-dense
            @md-selected="getGenres($event)"
          >
            <md-option
              :key="eventType.id"
              v-for="eventType in eventTypes"
              v-bind:value="eventType.id"
            >{{eventType.name}}</md-option>
          </md-select>
        </md-field>
      </div>
      <div class="form-item">
        <md-field>
          <label for="eventGenre">Event Genre</label>
          <md-select name="Event Genre" v-model="event.eventGenreId" md-dense>
            <md-option
              :key="genre.value"
              v-for="genre in genres"
              v-bind:value="genre.value"
            >{{genre.label}}</md-option>
          </md-select>
        </md-field>
      </div>
      <div class="form-item">
        <md-field>
          <label for="eventLocation">Event Location</label>
          <md-select name="Event Location" v-model="event.locationId" md-dense>
            <md-option
              :key="location.id"
              v-for="location in locations"
              v-bind:value="location.id"
            >{{location.name}}</md-option>
          </md-select>
        </md-field>
      </div>
      <div class="form-item">
        <md-field>
          <label for="eventDate"></label>
          <datetime v-model="event.dateAndHour"></datetime>
        </md-field>
      </div>
      <div class="form-item">
        <div class="tickets" v-for="(ticket, key) in tickets">
          <md-field>
            <label for="ticketType">Ticket Type</label>
            <md-select name="Ticket Type" v-model="ticket.ticketTypeId" md-dense>
              <md-option
                :key="ticketType.id"
                v-for="ticketType in ticketTypes"
                v-bind:value="ticketType.id"
              >{{ticketType.name}}</md-option>
            </md-select>
          </md-field>
          <md-field>
            <label for="ticketPrice">Ticket Price</label>
            <md-input
              type="number"
              name="ticketPrice"
              v-model.number="ticket.price"
              v-bind:value="tickets[key].price"
            />
          </md-field>
          <md-field>
            <label for="noTickets">Number of tickets</label>
            <md-input
              type="number"
              name="noTickets"
              v-model.number="ticket.remaining"
              v-bind:value="tickets[key].remainig"
            />
          </md-field>
        </div>
      </div>
      <div class="form-item">
        <span class="material-icons" @click="addTicketType()">add</span>
        <span class="material-icons" @click="removeTicketType()">remove</span>
      </div>
      <div class="form-item">
        <button type="button" class="btn btn-primary save" @click="createNewEvent()">Save</button>
      </div>
    </div>
  </div>
</template>


<script>
import { eventTypeService } from "../_services/eventType.service.js";
import { eventsService } from "../_services/events.service.js";
import { ticketsService } from "../_services/tickets.service.js";

export default {
  name: "EventPage",
  data() {
    return {
      event: {
        name: null,
        eventTypeId: null,
        eventGenreId: null,
        locationId: null,
        dateAndHour: new Date().toISOString(),
        description: null
      },
      tickets: [
        {
          ticketTypeId: null,
          price: null,
          remaining: null
        }
      ],
      eventTypeId: null,
      genres: [],
      eventTypes: [],
      locations: [],
      ticketTypes: []
    };
  },
  created() {
    this.loadAll();
  },
  beforeMount() {},
  methods: {
    async loadAll() {
      this.locations = await eventsService.getAllLocations();
      this.eventTypes = await eventTypeService.getAll();
      this.ticketTypes = await ticketsService.getTicketTypes();
    },
    async getGenres(event) {
      this.genres = await eventsService.getGenresByType(event);
      console.log(this.genres);
    },
    goToEvents() {
      this.$router.push({
        name: "Events"
      });
    },
    createNewEvent() {
      console.log(this.tickets);
      console.log(this.event);
      eventsService.createEvent(this.event).then(async response => {
        console.log(response);
        if (this.event.name) {
          let eventsList = await eventsService.getAll();
          let event = _.find(eventsList, { name: this.event.name });

          this.tickets.map(ticket => {
            ticket.eventParentId = this.event.eventTypeId;
            return ticket;
          });

          ticketsService.createTickets(this.tickets);
          this.$router.push({
            name: "EventPage",
            params: {
              id: this.event.eventTypeId
            }
          });
        }
      });
    },
    addTicketType() {
      if (this.tickets.length < 3) {
        this.tickets.push({
          ticketTypeId: null,
          ticketTypeName: null,
          price: null,
          remaining: null
        });
      }
    },
    removeTicketType() {
      if (this.tickets.length > 1) {
        this.tickets.splice(-1);
      }
    }
  }
};
</script>

<style>
p {
  padding: 2px;
}

.container {
  background-color: #fff;
  min-height: 600px;
  margin-top: 30px;
}

.event-page {
  padding: 25px 5px;
  display: flex;
  align-items: center;
  flex-direction: column;
}

.form-item {
  text-align: center;
  margin: 5px;
  padding: 2px;
  display: flex;
  align-items: center;
}

.event-page__close-button {
  font-size: xx-large;
  position: relative;
  top: 5px;
  cursor: pointer;
}

.md-field {
  margin: 0px 0px;
}

.vdatetime input {
  width: 250px;
}

.save {
  margin-top: 10px;
  background-color: #3b5998;
}

.tickets {
  padding: inherit;
  flex-direction: row;
}
</style>
