class ApplicationController < ActionController::Base
  before_action :set_meta_tags

  private

  def set_meta_tags
    super( # 👈 This calls the built-in `set_meta_tags` method instead of itself
      title: "Trucks of Nevada | Semi-Truck Repair in Las Vegas",
      description: "Trucks of Nevada is your trusted truck and semi-truck repair shop in Las Vegas, NV. We provide diagnostics, maintenance, aftertreatment, and roadside assistance.",
      keywords: "semi-truck repair, truck maintenance, diesel repair, Las Vegas truck repair, heavy-duty truck service",
      og: {
        title: "Trucks of Nevada | Expert Semi-Truck Repair",
        description: "Professional semi-truck repair services in Las Vegas, NV. We handle diagnostics, oil changes, aftertreatment, and roadside assistance.",
        type: "website",
        url: request.original_url,

      },
      twitter: {
        card: "summary_large_image",
        site: "@trucks_nevada"
      }
    )
  end
end
