<script setup>
import { RouterView } from 'vue-router'
import TopBar from '@/components/TopBar.vue'
</script>


<template>
  <header>
    <TopBar />
  </header>
  <main>
      <RouterView />
  </main>
</template>

<style>
@import '@/assets/base.css';

header {
}
</style>
