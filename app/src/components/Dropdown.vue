<template>
  <div class="dropdown">
      <button class="dropbtn">{{ selector }}</button>
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
          { name: "Name", id: "family_name"},
          { name: "Culture", id: "family_culture"},
          { name: "Dynasty", id: "dynasty_id"},
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
    .dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  width:6vw;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
  float:inline-end;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  width:6vw;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.selection {
  color: black;
  background-color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.selection:hover {
  background-color: lightgray;
  color: black;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}
  </style>
  