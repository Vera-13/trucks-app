class ApplicationController < ActionController::Base
  before_action :set_meta_tags

  private

  def set_meta_tags
    set_meta_tags(
      title: "Trucks of Nevada | Semi-Truck Repair in Las Vegas",
      description: "Trucks of Nevada is your trusted truck and semi-truck repair shop in Las Vegas, NV. We provide diagnostics, maintenance, aftertreatment, and roadside assistance.",
      keywords: "semi-truck repair, truck maintenance, diesel engine repair, truck diagnostics, Las Vegas truck shop",
      og: {
        title: "Trucks of Nevada | Semi-Truck Repair in Las Vegas",
        description: "Your trusted truck repair shop in Las Vegas specializing in semi-trucks and heavy-duty vehicles.",
        type: "website",
        url: request.original_url,
        image: image_url("trucks_of_nevada_logo.png")
      },
      twitter: {
        card: "summary_large_image",
        site: "@trucksofnevada",
        title: "Trucks of Nevada | Semi-Truck Repair in Las Vegas",
        description: "Expert truck and semi-truck repair services in Las Vegas, NV.",
        image: image_url("trucks_of_nevada_logo.png")
      }
    )
  end
end
