Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about", as: :about
  get "services", to: "pages#services", as: :services
  get "gallery", to: redirect("/", status: 301)
  get "reviews", to: "pages#reviews", as: :reviews
  get "service-areas", to: "pages#service_areas", as: :service_areas
  get "contact", to: "pages#contact", as: :contact
  post "contact", to: "pages#create_contact"
  get "privacy-policy", to: "pages#privacy", as: :privacy_policy
  get "cookie-policy", to: "pages#cookie_policy", as: :cookie_policy
  get "terms-of-service", to: "pages#terms", as: :terms

  SiteContent.services.each do |service|
    get service.slug, to: "pages#service", defaults: { slug: service.slug }, as: service.slug.tr("-", "_")
  end

  get "aftertreatment", to: redirect("/dpf-cleaning", status: 301)
  get "maintenance", to: redirect("/preventive-maintenance", status: 301)
  get "diagnostic", to: redirect("/dot-inspections", status: 301)
  get "roadside_assistance", to: redirect("/roadside-assistance", status: 301)
  get "fleet_services", to: redirect("/semi-truck-repair", status: 301)
  get "blog", to: redirect("/", status: 301)

  get "sitemap.xml", to: "pages#sitemap", defaults: { format: "xml" }

  get "up" => "rails/health#show", as: :rails_health_check
end
