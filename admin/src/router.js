import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login'
import Admin from './views/Admin'
import Welcome from './views/admin/Welcome'
import Course from './views/admin/Course'
import Chapter from './views/admin/Chapter'
import Section from './views/admin/Section'

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [{
    path: '*',
    redirect: "/login",
  }, {
    path: '/login',
    component: Login
  }, {
    path: '/',
    name: 'admin',
    component: Admin,
    children: [{
      path: 'welcome',
      name: 'Welcome',
      component: Welcome,
    }, {
      path: 'business/course',
      name: 'business/course',
      component: Course,
    }, {
      path: 'business/chapter',
      name: 'business/chapter',
      component: Chapter,
    }, {
      path: 'business/section',
      name: 'business/section',
      component: Section
    }]
  }]
})