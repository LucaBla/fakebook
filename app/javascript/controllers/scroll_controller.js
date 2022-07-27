import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'newPost' ]

  scroll() {
    //this.newPostTarget.scrollIntoView({block: 'start', behavior: 'smooth'})
  }
}