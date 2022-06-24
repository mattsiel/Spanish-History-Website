<script setup>
import { RouterLink, RouterView } from 'vue-router'
import TopBar from '@/components/TopBar.vue'

/*
 <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />

    <div class="wrapper">
      <HelloWorld msg="You did it!" />

      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">About</RouterLink>
      </nav>
    </div>

    */
</script>

<template>
  <header>
    <TopBar />
  </header>

  <RouterView />
</template>

<style>
@import '@/assets/base.css';

</style>
