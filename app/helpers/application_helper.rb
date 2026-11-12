module ApplicationHelper
  def phone_link(label = "Call Now (702) 333-2463", **options)
    classes = ["phone-number", options.delete(:class)].compact.join(" ")
    link_to label, "tel:+17023332463", class: classes, **options
  end

  # A generated hero fills a page when a file is dropped at
  # app/assets/images/heroes/<key>.jpg (jpeg, png, and webp also work).
  # Keys: home, about, services, reviews, service-areas, contact, and each service slug.
  # Service heroes reuse shop photos. A file in heroes/<slug> still replaces these.
  # Each hero is a different file from the photo already shown in that page's body.
  PAGE_PHOTOS = {
    "home" => "shop/00-hero-utah-peterbilt.jpg",
    "semi-truck-repair" => "shop/maria/semi-black-side.jpg",
    "dpf-cleaning" => "shop/maria/red-engine-bay.jpg",
    "engine-repair" => "shop/maria/engine-out.jpg",
    "trailer-repair" => "shop/maria/trailer-rear.jpg",
    "transmission-repair" => "shop/maria/engine-stand.jpg",
    "electrical-battery-repair" => "shop/maria/tech-red-hood.jpg",
    "suspension-repair" => "shop/maria/truck-tilted.jpg",
    "preventive-maintenance" => "shop/maria/parts-rack.jpg",
    "dot-inspections" => "shop/maria/white-truck-front.jpg",
    "carb-inspections" => "shop/maria/yellow-engine-bay.jpg",
    "ac-repair" => "shop/maria/blue-truck-front.jpg",
    "brake-adjustment-inspection" => "shop/maria/techs-on-axle.jpg",
    "box-truck-repair" => "shop/maria/box-open.jpg",
    "motor-home-repair" => "shop/maria/motorhome-front.jpg",
    "crane-repair" => "shop/maria/crane-boom.jpg",
    "roadside-assistance" => "shop/maria/yellow-truck-side.jpg"
  }.freeze

  SHOP_PHOTOS = {
    "about" => "shop/maria/shop-machine.jpg",
    "semi-truck-repair" => "shop/maria/semi-red-front.jpg",
    "dpf-cleaning" => "shop/maria/engine-in-chassis.jpg",
    "engine-repair" => "shop/maria/engine-stand-tech.jpg",
    "trailer-repair" => "shop/maria/car-hauler.jpg",
    "transmission-repair" => "shop/maria/engine-cart.jpg",
    "electrical-battery-repair" => "shop/maria/tech-red-bay.jpg",
    "suspension-repair" => "shop/maria/techs-on-axle.jpg",
    "preventive-maintenance" => "shop/maria/tech-red-side.jpg",
    "dot-inspections" => "shop/maria/semi-black-front.jpg",
    "carb-inspections" => "shop/maria/tech-in-engine.jpg",
    "ac-repair" => "shop/maria/blue-engine-bay.jpg",
    "brake-adjustment-inspection" => "shop/maria/tech-red-door.jpg",
    "box-truck-repair" => "shop/maria/box-rear-doors.jpg",
    "motor-home-repair" => "shop/maria/motorhome-green.jpg",
    "crane-repair" => "shop/maria/crane-yellow.jpg",
    "roadside-assistance" => "shop/maria/semi-blue.jpg"
  }.freeze

  GALLERY_PHOTOS = [
    ["shop/maria/semi-red-front.jpg", "Red semi in the Trucks of Nevada yard"],
    ["shop/maria/semi-black-front.jpg", "Black conventional truck in the yard"],
    ["shop/maria/semi-black-side.jpg", "Black semi parked at the shop"],
    ["shop/maria/semi-blue.jpg", "Blue semi outside the shop"],
    ["shop/maria/blue-truck-front.jpg", "Blue truck in the bay"],
    ["shop/maria/white-truck-front.jpg", "White truck in the bay"],
    ["shop/maria/white-truck-side.jpg", "White truck beside the shop"],
    ["shop/maria/car-hauler.jpg", "Car hauler in the yard"],
    ["shop/maria/car-on-hauler.jpg", "Truck loaded on a hauler"],
    ["shop/maria/trailer-rear.jpg", "Rear of a trailer at the shop"],
    ["shop/maria/box-rear-doors.jpg", "Rear doors of a box truck"],
    ["shop/maria/box-open.jpg", "Open box truck in the bay"],
    ["shop/maria/motorhome-green.jpg", "Green motor home in the shop"],
    ["shop/maria/motorhome-front.jpg", "Front of a motor home in the bay"],
    ["shop/maria/white-truck-rear.jpg", "Rear of a truck in the bay"],
    ["shop/maria/truck-tilted.jpg", "Truck raised in the shop"],
    ["shop/maria/crane-yellow.jpg", "Yellow crane truck"],
    ["shop/maria/crane-close.jpg", "Crane truck in the bay"],
    ["shop/maria/crane-boom.jpg", "Crane boom over a truck"],
    ["shop/maria/crane-arm-tech.jpg", "Technician working at a crane"],
    ["shop/maria/yellow-truck-front.jpg", "Yellow truck in the yard"],
    ["shop/maria/yellow-truck-side.jpg", "Yellow truck parked outside"],
    ["shop/maria/yellow-flatbed.jpg", "Yellow flatbed in the yard"],
    ["shop/maria/yellow-engine-bay.jpg", "Engine bay on a yellow truck"],
    ["shop/maria/tech-red-hood.jpg", "Technician with a hood open"],
    ["shop/maria/tech-red-side.jpg", "Technician working along a red truck"],
    ["shop/maria/tech-red-door.jpg", "Technician at the door of a red truck"],
    ["shop/maria/tech-red-bay.jpg", "Technician in a truck engine bay"],
    ["shop/maria/tech-in-engine.jpg", "Technician working in an engine bay"],
    ["shop/maria/techs-on-axle.jpg", "Technicians working at an axle"],
    ["shop/maria/engine-in-chassis.jpg", "Engine work in a truck chassis"],
    ["shop/maria/engine-stand-tech.jpg", "Engine on a stand in the shop"],
    ["shop/maria/engine-stand.jpg", "Engine stand in the bay"],
    ["shop/maria/engine-cart.jpg", "Engine on a cart in the shop"],
    ["shop/maria/engine-cart-two.jpg", "Engine waiting on a cart"],
    ["shop/maria/engine-cart-three.jpg", "Engine on a shop cart"],
    ["shop/maria/engine-out.jpg", "Engine removed from a truck"],
    ["shop/maria/red-engine-bay.jpg", "Open engine bay on a red truck"],
    ["shop/maria/blue-engine-bay.jpg", "Open engine bay on a blue truck"],
    ["shop/maria/shop-machine.jpg", "Machine in the Trucks of Nevada shop"],
    ["shop/maria/parts-rack.jpg", "Parts laid out in the shop"]
  ].freeze

  # First call on a page claims the photo. Later calls on that same page skip it.
  def take_photo(key, used)
    photo = page_photo(key)
    return if photo.nil? || used.include?(photo)

    used << photo
    photo
  end

  def page_photo(key)
    %w[jpg jpeg png webp].each do |ext|
      relative = "heroes/#{key}.#{ext}"
      return relative if image_asset?(relative)
    end

    fallback = PAGE_PHOTOS[key]
    fallback if fallback && image_asset?(fallback)
  end

  def shop_photo(key)
    path = SHOP_PHOTOS[key]
    path if path && image_asset?(path)
  end

  def photo_alt(path)
    GALLERY_PHOTOS.find { |photo, _alt| photo == path }&.last ||
      "Truck repair at Trucks of Nevada in Las Vegas"
  end

  # Homepage reel. Kept off the six homepage cards so a photo is not on this page twice.
  BAY_REEL = %w[
    shop/maria/tech-in-engine.jpg
    shop/maria/crane-yellow.jpg
    shop/maria/box-open.jpg
    shop/maria/motorhome-front.jpg
    shop/maria/yellow-truck-front.jpg
    shop/maria/engine-out.jpg
    shop/maria/techs-on-axle.jpg
    shop/maria/white-truck-side.jpg
    shop/maria/yellow-flatbed.jpg
    shop/maria/crane-arm-tech.jpg
    shop/maria/semi-black-front.jpg
    shop/maria/box-rear-doors.jpg
    shop/maria/engine-cart.jpg
    shop/maria/tech-red-hood.jpg
    shop/maria/white-truck-front.jpg
    shop/maria/crane-boom.jpg
    shop/maria/motorhome-green.jpg
    shop/maria/parts-rack.jpg
    shop/maria/truck-tilted.jpg
    shop/maria/blue-truck-front.jpg
  ].freeze

  def bay_reel_photos
    BAY_REEL.filter_map do |path|
      next unless image_asset?(path)

      [path, photo_alt(path)]
    end
  end

  def hero_photo_style(photo)
    "--hero-photo: url('#{asset_path(photo)}');".html_safe
  end

  PUBLIC_ORIGIN = "https://trucksofnevada.com".freeze

  def public_url(path)
    "#{PUBLIC_ORIGIN}#{path}"
  end

  def public_asset(path)
    url = asset_url(path)
    return public_url(url) if url.start_with?("/")

    url.sub(%r{\Ahttps?://(?:localhost|127\.0\.0\.1)(?::\d+)?}, PUBLIC_ORIGIN)
  end

  def breadcrumb_json(crumbs)
    {
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => crumbs.each_with_index.map do |(name, path), index|
        {
          "@type" => "ListItem",
          "position" => index + 1,
          "name" => name,
          "item" => public_url(path)
        }
      end
    }.to_json
  end

  def image_asset?(relative)
    Rails.root.join("app/assets/images", relative).file?
  end
end
