import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'dropDown', 'frame', 'img' ]

  show() {
    this.dropDownTarget.classList.toggle('hidden')
  }

  change_nested_form(event){
    console.log(this.frameTarget)
    if(event.target.checked === true){
      console.log('a')
    }
  }

  imagePreview(){
    console.log(this)
    var src = URL.createObjectURL(event.target.files[0])
    this.imgTarget.src = src
  }

}