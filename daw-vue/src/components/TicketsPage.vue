<template>
	<div class="container">
		
		<span><i class="material-icons ticket_page__close-button" @click="goToEvents()">keyboard_backspace</i>
		<div class="tickets_container">
			<div v-for="ticket in tickets" :id="ticket.id" class="ticket_item shadow-sm p-1 mb-5 bg-white-rounded">
				<span class="ticket_item-counter">{{ticket.nrOfBought}}</span>
				<span class="material-icons ticket_item-split">more_vert</span>
				<span>
					<div class="ticket_item-title">{{ticket.eventName}}</div>
					<div class="ticket_item-description">{{ticket.locationName}} - {{ticket.dateAndHour}}</div>
				</span>
				<span class="ticket_item-type">
					{{ticket.ticketTypeName}}
				</span>
				<div class="ticket_item-refund">
					<p @click="refundTicket(ticket.id)">Refund</p>
				</div>
			</div>

		</div>
		</span>
	</div>
</template>

<script>
import {ticketsService} from '../_services/tickets.service';

	export default {
		name: 'TicketsPage',
		data() {
			return {
				tickets: []
			}
		},
		created() {
			this.loadUserTickets();
		},
		methods: {
			async loadUserTickets() {
				this.tickets = await ticketsService.getTicketsForUser();
			},
			async refundTicket(ticketId) {
				ticketsService.refundTickets(ticketId).then((response) =>{
					if(response) {
						this.loadUserTickets();
					}
				});
			},
			goToEvents() {
				this.$router.push({
					name: 'Events'
				})
			}
		}
	}

</script>

<style>
 	p {
 		padding: 2px;
 	}

	.container {
		/*background-color: #FFF;*/
		min-height: 600px;
		margin-top: 30px;
	}

	.ticket_page {
		padding: 25px 5px;
		display: flex;
		flex-direction: row;
	}

 	.ticket_page__close-button {
 		font-size: xx-large;
 		position: relative;
 		top: 5px;
 		cursor: pointer;
 	}

 	.tickets_container {
 		margin-top: 30px;
 	}

 	.ticket_item {
 		position: relative;
 		height: 60px;
 		background-color: #FFF;
 		display: flex;
 		align-items: center;
 	}

 	.ticket_item-counter {
 		font-size: 20px;
 		font-weight: bold; 
 		padding: 5px;
 		margin: 0px 0px 0px 5px; 
 	}

 	.ticket_item-split {
 		font-size: 40px;
 	}

 	.ticket_item-title {
 		margin: 5px 0px;
 		padding: 0px 4px;
 		font-size: 25px;
 	}

 	.ticket_item-description {
 		padding: 0px 4px;
 	}

 	.ticket_item-type {
 		color: #a0a0a0;
 		position: absolute;
 		right: 100px;
 		font-size: 25px;
 	}

 	.ticket_item-refund {
 		display: flex;
 		justify-content: center;
 		height: 100%;
 		width: 80px;
 		background-color: #3b5998;
 		color: #FFF;
 		vertical-align: center;
 		align-items: center;
 		position: absolute;
 		cursor: pointer;
 		padding: 5px;
 		right: 0px;
 	}



</style>