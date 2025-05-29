import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl"; // Don't forget this!
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
	static values = {
		apiKey: String,
		markers: Array,
	};

	connect() {
		console.log("map-controller connected");
		mapboxgl.accessToken = this.apiKeyValue;
		this.map = new mapboxgl.Map({
			container: this.element,
			style: "mapbox://styles/mapbox/streets-v12",
		});

		if (this.markersValue.length != 0) {
			this.#addMarkersToMap();
			this.#fitMapToMarkers();
		}

		this.map.addControl(
			new MapboxGeocoder({
				accessToken: mapboxgl.accessToken,
				mapboxgl: mapboxgl,
			})
		);
	}

	// private

	#addMarkersToMap() {
		this.markersValue.forEach((marker) => {
			const popup = new mapboxgl.Popup().setHTML(marker.info_window_html); // Add this
			new mapboxgl.Marker()
				.setLngLat([marker.lng, marker.lat])
				.setPopup(popup) // Add this
				.addTo(this.map);
		});
	}

	#fitMapToMarkers() {
		const bounds = new mapboxgl.LngLatBounds();
		this.markersValue.forEach((marker) =>
			bounds.extend([marker.lng, marker.lat])
		);
		this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
	}
}
