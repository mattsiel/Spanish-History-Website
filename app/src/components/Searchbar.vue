<template>
    <div class="search-container">
      <input @change='changeQuery()' v-model="query" type="text" placeholder="Search.." >
    </div>
  </template>

<script>
export default {
  name: "Searchbar",
  props: ["keyword"],
  data: function() {
    return {
      query: ""
    };
  },
  computed: {
    changeQuery() {
        this.$emit('changeQuery', this.query)
    },
  }
};
</script>
  
  <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

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
  