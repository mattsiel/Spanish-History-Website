<script setup>
import { RouterView } from 'vue-router'
import TopBar from '@/components/TopBar.vue'
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
