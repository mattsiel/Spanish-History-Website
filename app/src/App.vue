<script setup>
import { RouterView } from 'vue-router'
import TopBar from '@/components/TopBar.vue'
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
  position:sticky;
	height: 4em;
}
</style>
