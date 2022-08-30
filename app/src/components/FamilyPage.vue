<script >
import axios from "axios";

export default {
  name: "familyInfo", 
  data: function() {  
      return {
          familyData: {
          }
      } 
  },
  async beforeMount() {

    const family = (await axios.get('http://localhost:3100/family/search', {
        params: {
            family_name: this.$route.params.id,
        }
    })).data[0];

    const image = `../src/assets/coas/House_of_${family.family_name}.svg`;
    this.familyData = {...family, ...{image: image}};
    console.log(this.familyData);
    
  }
};


</script>

<template>
<div>
  <h1>House of {{ familyData.family_name }}</h1>
  <div id="coa-box">
    <img class="coat-of-arms" img :src="familyData.image">
    <p class="coa-info" >Coat of arts of the {{ familyData.family_name}} family</p>
  </div>
    <div class="text-box">yo</div>
</div>
</template>

<style scoped>
@import '@/assets/base.css';

#coa-box{
  width:100vw;
  height:40vh;
  padding-top: 5vh;
  padding-bottom: 10vh;
}

.coat-of-arms{
  height: 100%;
  width: 100%;
  object-fit: contain;
}

.coa-info {
  text-align: center;
  
}
</style>

