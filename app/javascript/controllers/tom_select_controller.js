import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"; // On importe notre librairie tom-select

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    // On connecte TOm-select à notre balise, notre élément
    new TomSelect(this.element, {
      createOnBlur: true,
      sortField: {field: "text"}
    });
  }
}
