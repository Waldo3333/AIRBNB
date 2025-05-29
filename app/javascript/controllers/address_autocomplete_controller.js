import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = {apiKey: String}

   static targets = ["address", "searchBarInput"]
   connect() {
     this.geocoder = new MapboxGeocoder({
       accessToken: this.apiKeyValue,
       types: "address, postcode, locality"
      })
      this.geocoder.addTo(this.element)

      this.geocoder.on("result", event => this.#setInputValue(event))
      this.geocoder.on("clear", () => this.#clearInputValue())


      const searchInput = deocument.getElemmentById("search_query");
      console.log(searchInput);
    }

  disconnect() {
    this.geocoder.onRemove()
  }

  

  // private

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue () {
    this.addressTarget.value = ""
  }
}
