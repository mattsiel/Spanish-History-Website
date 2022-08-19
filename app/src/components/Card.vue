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
    link: String,
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
  width: 200px;
  height: 290px;
  margin:20px;

}

.card-image {

}
.card-title {
  height:1.75em;
  text-align: center;
}

.card-info {
  color:#6C6C6C;
  font-size: .8em;
}
.andalusian {
  border-color: linear-gradient(180deg, #34495e, #41b883);
}
.catalan {
  border-top: 0.25em solid #F05340 ;
  border-bottom: 0.25em solid #F05340 ;
}
.castilian {
  border-top: 0.25em solid #FCB900;
  border-bottom: 0.25em solid #FCB900;
}
 
.basque {
  border-top: 0.25em solid #FF8A65;
  border-bottom: 0.25em solid #FF8A65;
}
.portuguese {
  border-top: 0.25em solid #F78DA7;
  border-bottom: 0.25em solid #F78DA7;
}
</style>

