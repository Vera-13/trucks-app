import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", "count", "query", "sort"]
  static values = { items: Array, profile: String }

  connect() {
    this.render()
  }

  render() {
    const query = this.queryTarget.value.trim().toLowerCase()
    const items = this.itemsValue
      .filter((item) => !query || `${item.author} ${item.body}`.toLowerCase().includes(query))
      .sort((a, b) => (this.sortTarget.value === "oldest" ? a.date.localeCompare(b.date) : b.date.localeCompare(a.date)))

    this.countTarget.textContent = items.length === 1 ? "Showing 1 review" : `Showing ${items.length} reviews`
    const cards = items.map((item) => this.card(item))
    this.listTarget.replaceChildren(...(cards.length ? cards : [this.empty()]), this.invite())
  }

  card(item) {
    const article = document.createElement("article")
    article.className = "review-card"

    const top = document.createElement("div")
    top.className = "review-card-top"
    top.append(this.stars(item.rating), this.googleLink())

    const name = document.createElement("h2")
    name.textContent = item.author

    const date = document.createElement("p")
    date.className = "review-date"
    date.textContent = new Date(`${item.date}T00:00:00`).toLocaleDateString("en-US", {
      month: "long",
      day: "numeric",
      year: "numeric"
    })

    const body = document.createElement("p")
    body.textContent = item.body

    article.append(top, name, date, body)
    return article
  }

  invite() {
    const link = document.createElement("a")
    link.className = "review-invite"
    link.href = this.profileValue
    link.target = "_blank"
    link.rel = "noopener noreferrer"

    const icon = document.createElement("img")
    icon.src = this.element.dataset.reviewsIcon
    icon.alt = ""

    const title = document.createElement("strong")
    title.textContent = "Review us on Google"

    const text = document.createElement("span")
    text.textContent = "Had a truck in the shop? Leave the review the next driver will read."

    link.append(icon, title, text)
    return link
  }

  stars(rating) {
    const row = document.createElement("p")
    row.className = "star-row"
    row.setAttribute("aria-label", `${rating} out of 5`)
    for (let index = 1; index <= 5; index += 1) {
      const star = document.createElement("span")
      star.className = "star"
      star.style.setProperty("--fill", index <= rating ? "100%" : "0%")
      row.append(star)
    }
    return row
  }

  googleLink(label = "") {
    const link = document.createElement("a")
    link.href = this.profileValue
    link.target = "_blank"
    link.rel = "noopener noreferrer"
    link.className = label ? "review-more" : "review-g"
    if (!label) link.setAttribute("aria-label", "Open the Google listing")
    const icon = document.createElement("img")
    icon.src = this.element.dataset.reviewsIcon
    icon.alt = ""
    link.append(icon)
    if (label) link.append(document.createTextNode(label))
    return link
  }

  empty() {
    const note = document.createElement("p")
    note.className = "review-empty"
    note.textContent = "Nothing in this set matches."
    return note
  }
}
