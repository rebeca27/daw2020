import Vue from 'vue';
import Router from 'vue-router';
// @ - de la folderul src in jos
import LoginPage from '../components/LoginPage';
import RegisterPage from '../components/RegisterPage';
import IndexPage from '../components/IndexPage';
import EventPage from '../components/EventPage';
import EventTypeTabs from '../components/EventTypeTabs';
import TicketsPage from '../components/TicketsPage';
import CreateEventPage from '../components/CreateEventPage';
import PersonsPage from '../components/PersonsPage';

Vue.use(Router);
export const router = new Router({
  // mode: 'history',
  routes: [
    {
      path: '/login',
      name: 'LoginPage',
      component: LoginPage,
    }, {
      path: '/register',
      name: 'RegisterPage',
      component: RegisterPage,
    }, {
      path: '/',
      name: 'IndexPage',
      component: IndexPage,
      children: [
      {
        name: 'Events',
        path: '',
        component: EventTypeTabs
      }, {
        name: 'EventPage',
        path: 'event/:id',
        component: EventPage
      }, {
      	name: 'TicketsPage',
      	path: '/tickets',
      	component: TicketsPage
      }, {
      	name: 'CreateEvent',
      	path: 'new-event',
      	component: CreateEventPage
      }, {
        name: 'Persons',
        path: '/persons',
        component: PersonsPage
      }
      ]
    }
    // , {
    //   path: '/event/:id',
    //   name: 'EventPage',
    //   component: EventTypePage,
    // }
  ],
});

// router.beforeEach((to, from, next) => {
//   // redirect to login page if not logged in and trying to access a restricted page
//   const publicPages = ['/login', '/register', '/chat'];
//   const authRequired = !publicPages.includes(to.path);
//   const loggedIn = localStorage.getItem('user');

//   if (authRequired && !loggedIn) {
//     return next('/login');
//   }

//   next();
// })
