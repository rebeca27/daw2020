<template>
	<div class="container">
		

	<i class="material-icons event-page__close-button" @click="goToEvents()">keyboard_backspace</i>
	<i v-if="checkIfUserHasPermission()" class="material-icons event-page__delete-button" @click="deleteEvent()">delete</i>
		<div class="event-page">
			<div class="col-md-4 event-page__image">
    		<img :src="event.photoURL">
			</div>
			<div class="col-md-8 event-page__title">		
				<h3>{{event.name}}</h3>
				<span class="event-page__title-location">
    			<i class="material-icons">gamepad</i>
					<a v-bind:href="`https://www.google.com/maps/search/${location.address}`" target="_blank">{{location.name}}, {{location.address}}</a>
				</span>
				<span class="event-page__title-date">
					<i class="material-icons">access_time</i>
					<p>{{event.dateAndHour}}</p>
				</span>
				<span class="event-page__description">
					<p>{{event.description}}</p>
				</span>
	  		<button type="button" class="btn btn-primary event-page__buy-ticket" @click="openTicketsModal(event.id)">Buy Ticket</button>
			</div>
		</div>
	</div>
</template>

<script>
import { eventTypeService } from "../_services/eventType.service.js";
import {eventsService} from '../_services/events.service.js';
import {ticketsService} from '../_services/tickets.service.js';
import {userService} from '../_services/user.service.js';
import {personService} from '../_services/person.service';
	
	export default {
		name: 'EventPage',
		data() {
			return {
				event: {
        name: null,
        eventTypeId: null,
        eventGenreId: null,
        locationId: null,
        dateAndHour: new Date().toISOString(),
        description: null},
				genres: [],
				locations: [],
				location: {
					address: null,
					name: null
				},
				person: {}
			}
		},
		created() {
			let eventId = this.$router.history.current.params.id;
			this.loadEvent(eventId);
			this.loadPerson();
			if (!_.isNil(this.event)) {
				this.loadGenresAndLocations();
			}
		},
		beforeMount() {
		},
		methods: {
			async loadEvent(eventId) {
				this.event = await eventsService.getEventById(eventId);
			},
			async loadGenresAndLocations() {
				this.genres = await eventsService.getAllGenres();
				this.locations = await eventsService.getAllLocations();
				//this.location = await _.find(this.locations, {"id": this.event.locationId})
			},
			async loadPerson() {
				this.person = await personService.getPersonByCurrentUserId();
			},
			goToEvents() {
				this.$router.push({
					name: 'Events'
				})
			},
			openTicketsModal(eventId) {
				ticketsService.currentEventId = eventId;
				this.$emit('open-modal', event.id);
			},
			deleteEvent() {
				eventsService.deleteEvent(this.event.id);
				this.goToEvents();
			},
			checkIfUserHasPermission() {
				console.log(this.person.id)
				console.log(userService.user.role)
				console.log(this.event.personId)
				if (userService.user.role.indexOf('Admin') != -1) {
					return true;
				} else if (this.person.id !== undefined && this.person.id === this.event.personId) {
					return true;
				} else {
					return false;
				}
			}
		}
	}
</script>

<style>
 	p {
 		padding: 2px;
 	}

	.container {
		background-color: #FFF;
		min-height: 600px;
		margin-top: 30px;
	}

	.event-page {
		padding: 25px 5px;
		display: flex;
		flex-direction: row;
	}

 	.event-page__close-button {
 		font-size: xx-large;
 		position: relative;
 		top: 5px;
 		cursor: pointer;
 	}

	.event-page__delete-button {
		font-size: xx-large;
		top: 5px;
		cursor: pointer;
		float: right;
	}

	.event-page__image {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.event-page__title {
		padding: 10px 2px;
		display: flex;
		flex-direction: column;	
		overflow-y: hidden;
	}

	.event-page__title-location {
		display: inline-flex;
	}

	.event-page__title-location a{
		padding: 2px;
		font-size: 20px;
	}
	.event-page__title-date {
		display: inline-flex;
	}

	.event-page__description {
		padding: 5px;
		margin-top: 5px;
	}

	.event-page__buy-ticket {
		background-color: #3b5998;
    position: absolute;
    width: 200px;
    bottom: 0px;
    left: 50%;
	}


</style>
