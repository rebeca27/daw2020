import Vue from 'vue';
import VeeValidate from 'vee-validate';
import BootstrapVue from 'bootstrap-vue';
import InputText from 'primevue/inputtext';
import Button from 'primevue/button';
import Toast from 'primevue/toast';
import ToastService from 'primevue/toastservice';
import VueMaterial from 'vue-material';
import 'vue-material/dist/vue-material.min.css'
import EventTypeTabs from './components/EventTypeTabs';
import EventPage from './components/EventPage';
import TicketsPage from './components/TicketsPage';
import Modal from './components/Modal';
import CreateEventPage from './components/CreateEventPage';
import babelPolyfill from 'babel-polyfill'
import _ from 'lodash';

// import { store } from './_store';
import { router } from './_helpers/router';
import App from './app/App';

Vue.use(VueMaterial)
Vue.use(BootstrapVue)
Vue.use(VeeValidate);
Vue.use(ToastService);

import { Datetime } from 'vue-datetime';

Vue.component('datetime', Datetime);


Vue.component('InputText', InputText);
Vue.component('Button', Button);
Vue.component('Toast', Toast);
Vue.component('EventTypeTabs', EventTypeTabs);
Vue.component('EventPage', EventPage);
Vue.component('Modal', Modal);
Vue.component('TicketsPage', TicketsPage);
Vue.component('CreateEventPage', CreateEventPage);

import 'primevue/resources/themes/nova-light/theme.css';
import 'primevue/resources/primevue.min.css';
import 'primeicons/primeicons.css';
import 'vue-material/dist/theme/default.css'
import 'vue-datetime/dist/vue-datetime.css'

// setup fake backend
// import { configureFakeBackend } from './_helpers';
// configureFakeBackend();

new Vue({
  el: '#app',
  router,
  render: h => h(App)
});
