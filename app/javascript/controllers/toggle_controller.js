import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle"
export default class extends Controller {
	static targets = ["toggElement", "flatElement"];
	connect() {
		console.log("Hello from toggle_controller.js");
	}

	display() {
		this.toggElementTarget.classList.toggle("d-none");
		this.toggElementTarget.scrollIntoView({ behavior: "smooth" });
	}
}
