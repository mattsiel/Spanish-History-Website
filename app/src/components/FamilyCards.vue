
<script>
  import axios from "axios";
  import Card from "./Card.vue";
  import Dropdown from './Dropdown.vue';

// https://codesandbox.io/s/cards-in-vue-wc436?file=/src/components/Card.vue

  export default {
    name: "FamilyCards",
    components: {
      Card,
      Dropdown
    },
    data: function() {  
      return {
          keyword: "",
          selected: "Name",
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
  methods:{
    ChangeSelector(newSelector){
      this.selected = newSelector;
    }
  },

  computed: {
    filteredList() {
      return Object.values(this.familiesData).filter(item => {
        switch(this.selected) {
          case 'Name':
            return item.family_name.toLowerCase().includes(this.keyword.toLowerCase());
          case 'Dynasty':
            return item.dynasty_id.toLowerCase().includes(this.keyword.toLowerCase());
          case 'Culture':
            return item.family_culture.toLowerCase().includes(this.keyword.toLowerCase());
          default:
            return item.family_name.toLowerCase().includes(this.keyword.toLowerCase());
        }
      });
    }
  }
};
</script>

<template>
  <div id="cardbox">
    <div id="card-menu">
      <div class="search-container">
        <input @change='filteredList' v-model="keyword" type="text" placeholder="Search.." >
      </div>

      <Dropdown @changeSelector="ChangeSelector($event)"></Dropdown>
    </div>

    <section id="cards">
      <div class="cardcontainer" v-for="family in filteredList" :key=family.family_name>
        <RouterLink :to="{ name: 'familyInfo', params: { id: family.family_name }}">
          <Card :cardData="family" :vurl="family.image"></Card>
        </RouterLink>
      </div>
    </section>
  </div>
</template>

<style>
#cardbox {
  flex-direction: row;
  width:100vw;
  display: flex;
  flex-wrap: wrap;
  text-align: center;
  padding-right: var(--relative-padding);
  padding-left: var(--relative-padding);
}

#cards {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;

}

#card-menu {
  width:100vw;
  height:10vh;
}
.cardcontainer {
  display: flex;
  flex-direction: column;
  padding: 3vw;

}

.search-container {
  position: relative;
  display: inline-block;
  padding: var(--padding);
  height:3vh;
}

input[type=text] {
  padding: var(--padding);
  margin-top: 2vh;
  font-size: 1em;
  border: none;
  height:5vh;
}
</style>
