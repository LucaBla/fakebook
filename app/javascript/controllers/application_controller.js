import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'dropDown', 'modal' ]

  show() {
    this.dropDownTarget.classList.toggle('hidden')
  }

  showModal(){
    this.modalTarget.classList.toggle('hidden')
  }
}