import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'dropDown', 'frame' ]

  show() {
    this.dropDownTarget.classList.toggle('hidden')
  }

  change_nested_form(event){
    console.log(this.frameTarget)
    if(event.target.checked === true){
      console.log('a')
    }
  }
}