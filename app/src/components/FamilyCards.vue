
<script>
import Card from "./Card.vue";
import axios from "axios";
// https://codesandbox.io/s/cards-in-vue-wc436?file=/src/components/Card.vue

export default {
  name: "FamilyCards",
  components: {
    Card
  },
  data: function() {
    return {
        familiesData: [
        ]
    } 
  },

  async beforeMount() {
    const families = await axios.get('http://localhost:3100/family');

    this.familiesData = families.data;
    console.log(families.data);
    console.log(this.familiesData);

  }
};
</script>

<template>
  <div id="cardbox">
    <div class="cardcontainer" v-for="family in familiesData">
      <Card :title=family.family_name series="23" videos="65" :myColor=(family.family_culture.toLowerCase())>
      </Card>
    </div>
  </div>
</template>

<style>
#cardbox {
  display: flex;
  width:20%;
  flex-direction: row;
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  margin: 30px;
}
</style>
