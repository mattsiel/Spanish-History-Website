<script setup>
import { RouterView } from 'vue-router'
import Navigation from '@/components/Navigation.vue'
</script>


<template>
  <div>
    <header>
      <Navigation />
    </header>
    <main>
        <RouterView />
    </main>
  </div>
</template>

<style>
@import '@/assets/base.css';

header {
	height: 4em;
  width:100vw;
  position: fixed;
  z-index: 3;
}

main {
  padding-top: 4em;
}
</style>
