<template>
<table id="firstTable">
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Phone</th>
      <th>Profession</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="row in rows">
      <td>{{row.id}}</td>
      <td>{{row.name}}</td>
      <td>{{row.phone}}</td>
      <td>{{row.profession}}</td>
    </tr>
  </tbody>
</table>

</template>

<script>

import axios from 'axios'

export default {
    data () {
        return {
            people: []
        }
    },
    created () {
        axios.get('http://localhost:3100/person')
        .then(
            response => {
                this.people = response.body
                // console.log(response)
            })
        .catch(function(error){
            console.log(error)
        })
    }
}
</script>

<style type="text/css">
	
ul{
  list-style: none;
}
li{
  display: inline;
}
</style>