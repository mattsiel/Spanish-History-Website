<template>
  <div class="dropdown">
      <button class="dropbutton">{{ selector }}</button>
      <div class="dropdown-content" >
          <div v-for="family in selections" :key="family.id"  class="selection" @click="changeSelector(family)">{{ family.name }}</div>
      </div>
  </div>
</template>

<script>
export default {
  data() {
      return {
        selector:"Name",
        selections: [
          { name: "Name" },
          { name: "Culture" },
        ],
      };
  },
  methods: {
    changeSelector(selection) {
      this.selector = selection.name;
      this.$emit('changeSelector', this.selector);
    }
  }
}
</script>
  
  <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.dropbutton {
  background-color: var(--button-color);
  color: var(--background-color);
  padding: 1vh;
  width:8vw;
  height:5vh;
  border: none;
  
}

.dropdown:hover .dropbutton {
  background-color: var(--button-hover-color);
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  width:100%;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  font-size: 1em;
}

.selection {
  color: black;
  background-color: white;
  padding: 1vh;
  display: block;
}

.selection:hover {
  background-color: lightgray;
  color: black;
}

.dropdown:hover .dropdown-content {
  display: block;
}

</style>
  