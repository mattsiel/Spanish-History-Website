<script setup>
import { RouterView } from 'vue-router'
import TopBar from '@/components/TopBar.vue'
import Navigation from '@/components/Navigation.vue'
</script>


<template>
  <header>
    <Navigation />
  </header>
  <main>
      <RouterView />
  </main>
</template>

<style>
@import '@/assets/base.css';

header {
  position:sticky;
	height: 4em;
}

main {
}
</style>
