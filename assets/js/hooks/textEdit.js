import Quill from 'quill';
export let TextEditor = {
  mounted() {
    console.log('Mounting');
    let quill = new Quill(this.el, {
      theme: 'snow'
    });

    quill.on('text-change', (delta, oldDelta, source) => {
      const contents = quill.getContents();
      this.el.value = JSON.stringify(contents);
      console.log(this.el.value)
    });


  },
  updated() {
    console.log('U');
  }
}