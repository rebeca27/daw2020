<template>
	<div class="container">
    <template v-if="loading">
        <b-spinner label="Loading..."></b-spinner>
    </template>

    <template v-else>
	    <md-tabs md-sync-route md-alignment="centered">
	    	<md-tab class="tab" v-for="tab in tabs" :md-label="tab.name" v-bind:key="tab.name" :id="tab.name" @click="filterEventsByType(tab)"></md-tab>
	    </md-tabs>

    <div v-if="!this.isEventSelected" class="events-list">
    	<div v-if="!event.deleted" v-for="event in filteredEvents" :id="event.id" class="event-item shadow-sm p-1 mb-5 bg-white rounded">
	    	<div class="col-md-4 event-item__image"> 
	    		<img :src="event.photoURL">
	    	</div>
	    	<div class="col-md-6 event-item__title">
	    		<h3 @click="openEventTab(event)">{{event.name}}</h3>
	    		<span class="event-item__title-span">
	    			<i class="material-icons">gamepad</i>
	    			<p>{{event.location}}</p>
	    		</span>
	    		<p>{{event.description}}</p>
	    	</div>
	    	<div class="col-md-2 event-item__buy">
	    		<button type="button" class="btn btn-primary" @click="openTicketsModal(event.id)">Buy Ticket</button>
	    		<p>{{event.price}}</p>
	    	</div>
	    </div>
    </div>
    </template>

    <EventTab v-if="this.isEventSelected" :event="this.selectedEvent"/>
  </div>
</template>

<script>
import {eventTypeService} from '../_services/eventType.service.js';
import {eventsService} from '../_services/events.service.js';
import {ticketsService} from '../_services/tickets.service.js';
	export default {
		name: 'EventTypeTabs',
		data() {
			return {
				loading: true,
				tabs: [],
				events: [],
				isEventSelected: false,
				selectedEvent: null,
				events: [],
				filteredEvents: []
			}
		},
		created() {
			this.loadTabsAndEvents();
		},
		methods: {
			openEventTab(event) {
				this.$router.push({
					name: 'EventPage', 
					params: {
						id: event.id
					}
				});
			},
			async loadTabsAndEvents() {
				this.tabs = await eventTypeService.getAll();
				this.events = await eventsService.getAll();
				this.filteredEvents = this.events;
				this.loading = false;
			},
			filterEventsByType(type) {
				console.log(this.tabs, this.events)
				this.filteredEvents = _.filter(this.events, {'eventTypeId': type.id});
			},
			openTicketsModal(eventId) {
				ticketsService.currentEventId = eventId;
				this.$emit('open-modal', eventId);
			}
		}
	}
</script>
	
<style>
	.container {
		background-color: #FFF;
	}

	.md-tabs {
		margin: 10px 0px;
	}

	.md-button {
		font-size: 18px !important;
	}

	.events-list {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-top: 30px;
	}

	.event-item {
		width: 60%;
		padding: 5px;
		display: flex;
		flex-direction: row;
		border: 1px #f9f9f9 solid;
		border-radius: 5px;
		max-height: 200px;
	}

	.event-item__image {
		display: flex;
		flex-direction: column;	
		align-items: center;
		justify-content: 	center;
	}

	.event-item__title {
		padding: 10px 2px;
		display: flex;
		flex-direction: column;	
		overflow-y: hidden;
	}

	.event-item__title h3 {
		margin-bottom: 0px;
		cursor: pointer;
	}
	
	.event-item__title-span {
		display: inherit;
	}

	.event-item__title-span p{
		padding: 2px;
	}

	.event-item__buy {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding: 5px
	}

	.event-item__buy button {
		background-color: #3b5998;
	}


</style>
