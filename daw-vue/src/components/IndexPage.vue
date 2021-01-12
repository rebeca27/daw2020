<template>
  <div class="index-page">
        <Modal v-if="showModal" @close="closeModal()">
      <h3> modal</h3>
    </Modal>
    <nav class="main-nav">
      <div class="main-nav__logo" @click="goToIndex()">eTicket</div>
      <div class="main-nav__greeting">Hello, <strong>{{user.firstName}} {{user.lastName}}</strong></div>
      <div class="main-nav__logout-span">
        <button v-if="user.role.indexOf('EventManager') != -1 || user.role.indexOf('Admin') != -1" type="button" class="main-nav__event" v-on:click="createNewEvent()">Add Event</button>
        <button v-if="user.role.indexOf('Admin') != -1" type="button" class="main-nav__event" v-on:click="goToPersons()">Persons</button>
        <button type="button" class="main-nav__tickets" v-on:click="goToTicketsPage()">My Tickets</button>
        <button type="button" class="main-nav__logout" v-on:click="logout()">Log out</button>
      </div>
    </nav>

    <router-view @open-modal="openModal()">
    </router-view>

  </div>
</template>

<script>
import { userService } from '../_services/user.service';
import { ticketsService } from '../_services/tickets.service';

export default {
  name: 'IndexPage',
  beforeMount() {
    if (!userService.user) {
      return this.$router.push({name: 'LoginPage'});
    }
  },
  computed: {
    user() {
      console.log(userService.user)
      return userService.user;
    },
    // showModal: this.ticketsService.showModal,
  },
  data() {
    return {
      showModal: false
    };
  },
  methods: {
    logout() {
      userService.logout(this);
      return this.$router.push({ name: 'LoginPage' });
    },
    closeModal() {
      this.showModal = false;
    },
    openModal(eventId) {
      this.showModal = true;
    },
    goToTicketsPage() {
      this.$router.push({name: 'TicketsPage'});
    },
    goToIndex() {
      this.$router.push({name: 'Events'});
    },
    createNewEvent() {
      this.$router.push({name: 'CreateEvent'});
    },
    goToPersons() {
      this.$router.push({name: 'Persons'});
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.index-page {
  background-color: #f0f0f3;
  min-height: 100vh;
}

.events {
  min-height: 800px;
  border: 2px #e0e0e0c7 solid;
  margin-top: 10px;
}

p {
  margin: 0;
}

.main-nav {
  width: 100%;
  height: 60px;
  background: #3b5998;

  display: flex;
  justify-content: center;
  align-items: center;
}

.main-nav__logo {
  cursor: pointer;
  padding: 5px 30px;
  text-transform: uppercase;
  letter-spacing: 4px;
  font-weight: 300;
  text-shadow: 0px 1px 0px #aaa;
  color: #eee;
  font-size: 25px;
  line-height: 1;
  width: 250px;
}

.main-nav__greeting {
  flex: 5 1 0;
  text-align: center;
  color: #fefefe;
}

.main-nav__logout-span {
  text-align: center;
  width: 400px;
}

.main-nav__logout {
  padding: 5px 15px;
  border-radius: 5px;
  font-size: 14px;
  font-weight: 700;
  color: #fff;
  background: #2E8B57;
  border-color: #333;
  max-width: 120px;
}

.main-nav__logout:hover {
  cursor: pointer;
  background: #777;
}

.main-nav__tickets {
  padding: 5px 15px;
  border-radius: 5px;
  font-size: 14px;
  font-weight: 700;
  color: #fff;
  background: #2E8B57;
  border-color: #333;
  max-width: 120px;
}

.main-nav__tickets:hover {
  cursor: pointer;
  background: #777;
}

.main-nav__event {
  padding: 5px 15px;
  border-radius: 5px;
  font-size: 14px;
  font-weight: 700;
  color: #fff;
  background: #2E8B57;
  border-color: #333;
  max-width: 120px;
}

.main-nav__event:hover {
  cursor: pointer;
  background: #777;
}

</style>
