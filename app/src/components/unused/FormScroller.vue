<script>
export default {
 data: {
  	currentItem: 1,
  	items: [{id: 1, text: 'some text'}, {id: 2, text: 'some other text'}, {id: 3, text: 'last text'}]
  },
  mounted () {
  document.addEventListener("keyup", this.nextItem);
  },
  methods: {
  	nextItem () {
    	if (figure.keyCode == 38 && this.currentItem > 1) {
      	this.currentItem--
      } else if (figure.keyCode == 40 && this.currentItem < 3) {
      	this.currentItem++
      }
    }
  }
}

// https://jsfiddle.net/h7gqmw6e/2/
</script>