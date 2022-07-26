<script>
    import axios from "axios"

    export default {
        name : 'AddFamilyInfo',
        data (){
            return {
                dynasty_name: '',
                dynasty_head: '',
                dynasty_creator_id: '',
                dynasty_start: ''
            }
        },
        submit: function() {
            if(!this.name){
                alert('Please Add a Name')
                return
            }
            this.dynasty_name = ' ',
            this.dynasty_head = ' '
            this.dynasty_creator_id = ' ',
            this.dynasty_start = ' '

            axios.get("http://localhost:3100/person");
        }
    }
</script>

<template>
    <div>
      <div>
        <h2>Dynasty Name</h2>
        <input type="text" v-model="dynasty_name" />
      </div>

      <div>
        <h2>Dynasty Head</h2>
        <input type="number" v-model="dynasty_head" />
      </div>

      <div>
        <h2>Dynasty Creator</h2>
        <input type="number" v-model="dynasty_creator_id" />
      </div>

      <div>
        <h2>Dynasty Start</h2>
        <input type="date" v-model="dynasty_start" />
      </div>

      <div>
        <h2>Submit</h2>
        <input type="submit" value="Submit" v-on:click="submit" />
      </div>
    </div>
</template>

<style>

</style>