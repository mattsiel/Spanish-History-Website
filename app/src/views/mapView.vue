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
  <div id="map-view" >
    <IbeMap />
    <Sidebar />
  </div>
</template>

<style>
#map-view {
  top: 20%;
  width: 100%;
  height: 80%;
}
</style>