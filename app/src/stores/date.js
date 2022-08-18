import { defineStore } from 'pinia'

export const useDateStore = defineStore('date', {
  state: () => {
    return { date: null}
  },
  // could also be defined as
  // state: () => ({ count: 0 })
  actions: {
    locate(newDate) {
      if(newDate === '1'){
        this.date = 1212;
      }else if(newDate === '2'){
        this.date = 1204;
      }else{
        this.date = 1154;
      }
    },
    print(){
      return this.date;
    },
  },
})