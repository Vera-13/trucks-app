class ApplicationController < ActionController::Base
  before_action :prepare_meta_tags

  private

  def prepare_meta_tags
    set_meta_tags(
      title: "Semi-Truck Repair in Las Vegas",
      description: "Trucks of Nevada is a family-owned truck and trailer repair shop in Las Vegas. Diagnostics, DPF cleaning, maintenance, and 24/7 roadside assistance.",
      keywords: "semi-truck repair, trailer repair, DPF cleaning, Las Vegas truck repair, roadside assistance",
      canonical: "https://trucksofnevada.com#{request.path}",
      og: {
        title: "Trucks of Nevada | Semi-Truck Repair in Las Vegas",
        description: "Family-owned semi-truck repair in Las Vegas. Call (702) 333-2463.",
        type: "website",
        url: "https://trucksofnevada.com#{request.path}"
      },
      twitter: {
        card: "summary_large_image",
        site: "@trucks_nevada"
      }
    )
  end
end
