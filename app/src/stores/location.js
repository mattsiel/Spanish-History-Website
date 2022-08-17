import { defineStore } from 'pinia'


export const useLocationStore = defineStore('local', {
  state: () => {
    return { local: {
      name: null,
      info: null,
      sources: null,
    } }
  },
  // could also be defined as
  // state: () => ({ count: 0 })
  actions: {
    locate(newLocal) {
      this.local.name = newLocal.location_name;
      this.local.info = newLocal.location_info;
      this.local.sources = newLocal.location_sources;
    },
    printName(){
      return this.local.name;
    },
    printInfo(){
      return this.local.info;
    },
    printSources(){
      return this.local.sources;
    }
  },
})