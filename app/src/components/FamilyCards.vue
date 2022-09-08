
<script>
  import Card from "./Card.vue";
  import axios from "axios";
  import Dropdown from './Dropdown.vue';
  import Searchbar from './Searchbar.vue';

// https://codesandbox.io/s/cards-in-vue-wc436?file=/src/components/Card.vue

  export default {
    name: "FamilyCards",
    components: {
      Card,
      Dropdown,
      Searchbar
    },
    data: function() {  
      return {
          keyword: "",
          selected: "",
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
  },

  computed: {

    filteredList() {
      console.log(this.familiesData);
      console.log(this.keyword);
      return Object.values(this.familiesData).filter(item => {
        return item.selected.toLowerCase().includes(this.keyword.toLowerCase());
      });
    }
  }
};
</script>

<template>
  <div id="cardbox" class="wapper">
    <div id="card-selector">
      <div class="search-container">
        <input @change='filteredList' v-model="keyword" type="text" placeholder="Search.." >
      </div>

      <Dropdown></Dropdown>
    </div>

    <div class="cardcontainer" v-for="family in filteredList" :key=family.family_name>
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
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  padding-right:5vw;
  padding-left:5vw;
}
#card-selector {
  width:100vw;
  height:10vh;
  padding-top:3vh;
  padding-bottom:3vh;
  padding-right:5vw;
  padding-left:5vw;
}
.cardcontainer {
  display: flex;
  flex-direction: column;
  padding: 2vh;

}

.search-container {
    position: relative;
    display: inline-block;
    padding-left:1vw;
    padding-right:1vw;
    height:3vh;
}

input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
  height:5vh;
}
</style>
