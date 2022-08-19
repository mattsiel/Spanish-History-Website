<template>
  <div id="mapContainer"></div>
</template>

<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import axios from "axios";
import { useLocationStore } from '../stores/location.js'
import { useDateStore } from '../stores/date.js'
import geoJSON from "../assets/geoJson/spanishCommunities.json";
import Portugal_1154 from "../assets/geoJson/Portugal_1154.json";
// https://codesandbox.io/s/webdesign-dev-test-7cpom

// https://codesandbox.io/s/leaflet-canvas-geojson-click-forked-ksres?file=/index.js
// https://onthegrid.city/
// https://geojson.io/#map=8/40.462/-9.635

// For header
// https://codesandbox.io/s/vw2mko1y7

// card carousel
// https://codesandbox.io/s/pyqjv5pzzx?file=/src/App.vue

// Other vue stuff to know
// https://vuejs.org/guide/essentials/lifecycle.html#lifecycle-diagram
// https://vuejs.org/guide/components/props.html#prop-passing-details
// https://vuejs.org/guide/essentials/computed.html#basic-example

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
    const date = useDateStore();

    date.define(1);
    const map = L.map("mapContainer").setView([40, -5], 6);
    L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
      attribution:
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(map);
    //use a mix of renderers


    // Assign Geojson
    if(date === 1){
      L.geoJSON(geoJSON, {
      style: { // Define your style object
        "color": "#110111"
      },
      onEachFeature: function (feature, layer) {
        let name = feature.properties.name;
        layer.on("click", function (e) {
          let popup = new L.Popup().setContent(name)
          popup.setLatLng(e.latlng);
          date.define(2);
          return popup.addTo(map);
        });
      }
      }).addTo(map);
    } else {

    L.geoJSON(geoJSON, {
      style: { // Define your style object
        "color": "#000000"
      },
      onEachFeature: function (feature, layer) {
        let name = feature.properties.name;
        layer.on("click", function (e) {
          let popup = new L.Popup().setContent(name)
          popup.setLatLng(e.latlng);
          date.define(1);
          console.log(date.print());
          return popup.addTo(map);
        });
      }
    }).addTo(map);

     L.geoJSON(Portugal_1154, {
      style: { // Define your style object
        "color": "#F78DA7"
      },
      onEachFeature: function (feature, layer) {
        let name = feature.properties.name;
        layer.on("click", function (e) {
          let popup = new L.Popup().setContent(name)
          popup.setLatLng(e.latlng);
          date.define(1);
          console.log(date.print());
          return popup.addTo(map);
        });
      }
    }).addTo(map);


    }

    
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
  left:0vw;
  width: 70vw;
  height: 100vh;
  position: absolute;
}
</style>
