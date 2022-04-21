export let TextEditor = {
  mounted() {
    const input = document.getElementById('quillHiddenInput');
    const editorInstance = new Quill('#editor', {
      theme: 'snow'
    });
    let initContent = input.value
    editorInstance.setContents(initContent)
    editorInstance.on('text-change', function (delta, oldDelta, source) {
      input.value = editorInstance.root.innerHTML
      console.log(input.value)
    });
  }
}

