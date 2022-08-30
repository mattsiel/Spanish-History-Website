
<script>
  import Card from "./Card.vue";
  import axios from "axios";
  import { RouterLink } from 'vue-router'

// https://codesandbox.io/s/cards-in-vue-wc436?file=/src/components/Card.vue

  export default {
    name: "FamilyCards",
    components: {
      Card
    },
    data: function() {  
      return {
          familiesData: {
          }
      } 
    },

  async beforeMount() {
    const families = await axios.get('http://localhost:3100/family');
    this.familiesData = families.data;

    this.familiesData = this.familiesData.map((family) => {
       const image = `src/assets/coas/House_of_${family.family_name}.svg`;
       family = {...family, ...{image: image}};
       return family;
      }
    );
    console.log(this.familiesData);
  }
};
</script>

<template>
  <div id="cardbox">
      <div class="cardcontainer" v-for="family in familiesData" :key=family.family_name>
        <RouterLink :to="{ name: 'familyInfo', params: { id: family.family_name }}">
          <Card :cardData="family" :vurl="family.image"></Card>
        </RouterLink>
      </div>
  </div>
</template>

<style>
#cardbox {
  flex-direction: row;
  width:100vw;
  display: flex;
  flex-wrap: wrap;
  overflow-x: hidden;
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  margin: 30px;
  padding:20px;
}

.cardcontainer {
  display: flex;
  flex-direction: column;
  margin:5px;
}
</style>
