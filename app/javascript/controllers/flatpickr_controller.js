import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['DateInput']
  
  connect() {
    console.log(this.DateInputTarget)
    flatpickr(this.DateInputTarget, {
      "plugins": []
    })
  }
}
