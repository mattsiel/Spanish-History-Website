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

//   :class=cardData.family_culture.toLowerCase()
</script>

<template>
  <div class="card">
    <img class="card-image" :src="vurl">
    <span class="card-title">{{ cardData.family_name}}</span>
    <span class="card-info">Info Text</span>
  </div>
</template>

<style scoped>

.card {
    transition: all 234ms;
  background: var(--background-color);
  display: flex;
  flex-direction: column;
  box-shadow: 0px 0px 5px 1px rgba(102, 97, 102, 0.71);
  width: 220px;
  height: 310px;
  border-top: 0.25em solid var(--secondary-color);
  border-bottom: 0.25em solid var(--secondary-color);
}

.card:hover {
  border-color: var(--button-color);
}

.card-image {
  width:90%;
  margin-left: auto;
  margin-right: auto;

}
.card-title {
  height:10%;
  text-align: center;
}

.card-info {
  height:10%;
  color:var(--paragraph-color);
  font-size: .8em;
}

/*
.andalusian {
  border-color: #41b883;
}
.catalan {
  border-color: #F05340 ;
}
.castilian {
  border-color: #FCB900;
}
.basque {
  border-color: #FF8A65;
}
.portuguese {
  border-color: #F78DA7;
}

.galician {
  border-color: #89cff0;
}
.aragonese {
  border-color: #C20114;
}
*/
</style>

