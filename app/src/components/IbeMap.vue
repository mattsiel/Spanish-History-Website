<template>
  <div id="mapContainer"></div>
</template>

<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import axios from "axios";
import { useLocationStore } from '../stores/location.js'
import geoJSON from "../assets/geoJson/spanishCommunities.json";
//https://codesandbox.io/s/leaflet-canvas-geojson-click-forked-ksres?file=/index.js
//https://onthegrid.city/


export default {
  name: "IbeMap",
  data() {
    return {
      map: null,
    };
  },
  async mounted() {

    const locations = (await axios.get('http://localhost:3100/location'));
    const local = useLocationStore();

    const map = L.map("mapContainer").setView([40, -5], 6);
    L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(map);
    //use a mix of renderers


    L.geoJSON(geoJSON, {
      onEachFeature: function (feature, layer) {
        let name = feature.properties.name;
        layer.on("click", function (e) {
           let popup = new L.Popup().setContent("You clicked the map at " + name)
          popup.setLatLng(e.latlng);
          return popup.addTo(map);
        });
      }
    }).addTo(map);

    
    // Markers (N,E)
    console.log(map);
    (locations.data).map((location) => L.marker([location.location_north, location.location_east])
    .bindPopup(`this is ${location.location_name}`).openPopup().on('click', function(e) {
      local.locate(location)
    })
    .addTo(map));

/*
    function onMapClick(e) {
      let popup = new L.Popup().setContent("You clicked the map at " + e.latlng.toString())
      popup.setLatLng(e.latlng);
      return popup.addTo(map);
    }
    */

    map.on('click', onMapClick);
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
  width: 80vw;
  height: 100vh;
  position: absolute;
}
</style>
