import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booking-display"
export default class extends Controller {
	connect() {
		console.log("bonjour du controller display booking");
	}
}
