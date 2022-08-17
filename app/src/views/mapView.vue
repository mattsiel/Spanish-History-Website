<script>
import Sidebar from "../components/Sidebar.vue";
import IbeMap from '../components/IbeMap.vue';
//   <Sidebar />

export default {
  name: "App",
  components: { Sidebar, IbeMap },
};
</script>

<template>
  <div id="app" class="flex min-h-screen antialiased">
    <IbeMap />
    <Sidebar />
  </div>
</template>

<style>
#app {
  width: 100%;
  height: 80%;
}
</style>