import { Controller } from "@hotwired/stimulus"
import "leaflet"

export default class extends Controller {
  connect() {
    const L = window.leaflet
    if (!L) return

    const shop = [36.2302, -115.1257]
    const places = [
      { name: "The shop", detail: "1260 Rockpebble Ave, North Las Vegas", coords: shop, shop: true },
      { name: "Las Vegas", detail: "Mobile response typically 30–45 minutes", coords: [36.1699, -115.1398] },
      { name: "Henderson", detail: "Mobile response typically 30–45 minutes", coords: [36.0397, -114.9819] },
      { name: "Boulder City", detail: "Mobile response typically 60–90 minutes", coords: [35.9786, -114.832] },
      { name: "Pahrump", detail: "Mobile response typically 60–90 minutes", coords: [36.2083, -115.9839] }
    ]

    this.map = L.map(this.element, {
      scrollWheelZoom: false,
      dragging: false,
      doubleClickZoom: false,
      touchZoom: false,
      boxZoom: false,
      keyboard: false,
      zoomControl: true
    }).setView(shop, 8)
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 18,
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(this.map)

    const coverage = L.circle(shop, {
      radius: 160934,
      color: "#0056b3",
      weight: 2,
      fillColor: "#0056b3",
      fillOpacity: 0.12
    }).addTo(this.map)

    places.forEach((place) => {
      const marker = L.circleMarker(place.coords, {
        radius: place.shop ? 9 : 6,
        color: place.shop ? "#0056b3" : "#14181d",
        weight: 2,
        fillColor: place.shop ? "#0056b3" : "#ffffff",
        fillOpacity: 1
      }).addTo(this.map)
      marker.bindPopup(this.popup(place.name, place.detail))
      if (place.shop) marker.openPopup()
    })

    this.map.fitBounds(coverage.getBounds(), { padding: [24, 24] })
    this.map.setMinZoom(this.map.getZoom())
  }

  disconnect() {
    this.map?.remove()
    this.map = null
  }

  popup(name, detail) {
    const node = document.createElement("div")
    const title = document.createElement("strong")
    title.textContent = name
    const text = document.createElement("p")
    text.textContent = detail
    node.append(title, text)
    return node
  }
}
