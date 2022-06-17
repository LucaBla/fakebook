import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'dropDown' ]

  show() {
    this.dropDownTarget.classList.toggle('hidden')
  }
}