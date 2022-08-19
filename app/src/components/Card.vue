<script>
export default {
  name: "Card",
  props: {
    cardData: {
      family_name: String,
      family_info: String,
      family_culture: String,
    },
    vurl: String,
  }
};
</script>

<template>
  <div
    class="card"
    :class=cardData.family_culture.toLowerCase()
  >
    <img class="card-image" :src="vurl">
    <span class="card-title">{{ cardData.family_name}}</span>
    <span class="card-info">Kings of Navarre</span>
  </div>
</template>

<style scoped>
.card {
  background: #fcf9f9;
  display: flex;
  flex-direction: column;
  padding: 2px 5px;
  box-shadow: 0px 0px 5px 1px rgba(102, 97, 102, 0.71);
  border-style: solid;
  border-width: 5px;
  width: 200px;
  height: 280px;
  margin:20px;

}

.card-image {

}
.card-title {

}

.card-info {
  color:#6C6C6C;
   font-size: .8em;

}
.andalusian {
  border-color: linear-gradient(180deg, #34495e, #41b883);
}
.catalan {
  border-image: 
    linear-gradient(
      to bottom, 
      #6C6C6C,
      #F05340
    ) 1 100%;
}
.castilian {
    border-image: 
    linear-gradient(
      to bottom, 
      #D9E3F0,
      #FCB900
    ) 1 100%;
}
 
.basque {
  border-color: linear-gradient(180deg, #6C6C6C, #FF8A65);
}
.portuguese {
  border-color: linear-gradient(180deg, #D9E3F0, #F78DA7);
}
</style>

