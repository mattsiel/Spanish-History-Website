<template>
  <div id="mapContainer"></div>
</template>

<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import axios from "axios";



export default {
  data() {
    return {
      map: null,
    };
  },
  async mounted() {

    const locations = (await axios.get('http://localhost:3100/location'));

    this.map = L.map("mapContainer").setView([46.05, 11.05], 5);
    L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(this.map);
    //use a mix of renderers
    
    // Markers (N,E)
    (locations.data).map((location) => L.marker([location.location_north, location.location_east])
    .bindPopup(`this is ${location.location_name}`).openPopup().addTo(this.map));

    function onMapClick(e) {
      console.log(e.latlng);
        L.marker([e.latlng.lat,e.latlng.lng])
            .bindPopup("You clicked the map at " + e.latlng.toString())
            .openPopup().addTo(this.map);
    }

    this.map.on('click', onMapClick);
  },
  onBeforeUnmount() {
    if (this.map) {
      this.map.remove();
    }
  },
};
</script>

<style scoped>
#mapContainer {
  width: 100vw;
  height: 100vh;
}
</style>
