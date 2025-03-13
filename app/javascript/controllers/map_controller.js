import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/bcasagrande/cm878uuj7009p01qrfpvq7ik6"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({
        closeButton: false, // Pas de bouton de fermeture
        closeOnClick: false // Reste visible tant que la souris est dessus
      }).setHTML(marker.info_window_html)

      // Créer un élément HTML pour le marqueur personnalisé
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Créer le marqueur avec l'élément HTML
      const mapMarker = new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)

      // Ajout des événements pour le survol
      customMarker.addEventListener("mouseenter", () => popup.addTo(this.map).setLngLat([marker.lng, marker.lat]))
      customMarker.addEventListener("mouseleave", () => popup.remove())
    })
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
