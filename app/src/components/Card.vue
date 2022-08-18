<template>
  <div class="card">
    <div
      @mouseover="hover=true"
      @mouseout="hover=false"
      v-bind:class="myColor"
      class="card__overlay"
    >
      <img class="card__image" :src="vurl">
      <h2 class="card__title">{{title}}</h2>
      <button class="card__button hidden">
        <i class="far fa-play-circle fa-lg"></i>Expore
      </button>
    </div>
    <div class="card__data card__data--series">
      <h3 class="total series__total">{{series}}</h3>
      <p class="card__label card__label--series">series</p>
    </div>
    <span></span>
    <div class="card__data card__data--videos">
      <h3 class="total videos__total">{{videos}}</h3>
      <p class="card__label card__label--totals">videos</p>
    </div>
  </div>
</template>

<script>

// https://colors-picker.com/hex-color-picker/
export default {
  name: "Card",
  props: {
    series: Number,
    videos: Number,
    title: String,
    vurl: String,
    myColor: String
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: arial;
}

.card {
  display: flex;
  position: relative;
  flex-direction: column;
  width: 250px;
  height: 295px;
  border-radius: 15px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  margin: 10px;
}

.card__overlay {
  display: block;
  position: relative;
  border-radius: 15px;
  height: 70%;

  transition: height 300ms ease;
  z-index: 1000;
}

.card__overlay:hover {
  height: 100%;
}

.card__overlay:hover .card__button {
  z-index: 1001;
  opacity: 1;
  pointer-events: auto;
}

.andalusian {
  background-image: linear-gradient(180deg, #34495e, #41b883);
}
.catalan {
  background-image: linear-gradient(180deg, #6C6C6C, #F05340);
}
.castilian {
  background-image: linear-gradient(180deg, #D9E3F0, #FCB900);
}
.basque {
  background-image: linear-gradient(180deg, #6C6C6C, #FF8A65);
}
.portuguese {
  background-image: linear-gradient(180deg, #D9E3F0, #F78DA7);
}

.card__image {
  position: absolute;
  width: 150px;
  height: 150px;
  left: 50%;
  top: 20px;
  transform: translateX(-52%);
}

.card__title {
  display: block;
  margin-top: 165px;
  text-align: center;
  color: white;

  text-shadow: 0 0 3px rgba(0, 0, 0, 0.4);
}

.card__button {
  display: block;
  margin: 35px auto;
  width: 60%;
  height: 30px;
  border-radius: 20px;
  background-color: rgba(255, 255, 255, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.3);
  color: white;
  opacity: 1;
  font-weight: bold;
  letter-spacing: 0.8px;
  transition: all 400ms ease;
}

.card__button:hover {
  color: rgb(0, 0, 50, 0.7);
  background-color: white;
  cursor: pointer;
}

.trans__state {
  height: 100%;
}

i {
  margin-top: 4px;
  margin-right: 10px;
}

.hidden {
  opacity: 0;
  pointer-events: none;
}

.card__data {
  display: inline;
  position: absolute;
  width: 40%;
  text-align: center;
  bottom: 10%;
}

.card__data--series {
  left: 10%;
}
.card__data--videos {
  left: 50%;
  border-left: 1px solid rgba(0, 0, 0, 0.1);
}

.total {
  font-weight: normal;
  color: rgba(0, 0, 0, 0.7);
}

.card__label {
  font-size: 11px;
  color: rgba(0, 0, 0, 0.4);
}
</style>
