<template>
  <div class="container">
      <h1>Persons</h1>
    <b-table striped hover :items="persons" :fields="fields" responsive="sm">
        <template slot="delete" slot-scope="row">
            <b-button variant="danger" v-on:click="deletePerson(row.item.id)">Delete</b-button>
        </template>
    </b-table>
  </div>
</template>

<script>
import {personService} from '../_services/person.service';

export default {
    name: 'PersonsPage',
    data() {
      return {
        fields: ['id', 'firstName', 'lastName', 'email', 'delete'],
        persons: []
      }
    },
	created() {
		this.loadPersons();
	},
	methods: {
		async loadPersons() {
			this.persons = await personService.getPersons();
		},
		async deletePerson(personId) {
			personService.deletePerson(personId).then((response) =>{
				this.loadPersons();
			});
		}
	}
  }
</script>

<style>
	.container {
		background-color: #FFF;
	}
</style>
