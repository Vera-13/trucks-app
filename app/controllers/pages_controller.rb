class PagesController < ApplicationController
  def home
    set_meta_tags(
      title: "Semi-Truck Repair in Las Vegas",
      description: "Family-owned truck and trailer repair in Las Vegas. Same-day semi truck, trailer, and box truck repair, DPF cleaning, and 24/7 roadside. Call (702) 333-2463."
    )
  end

  def about
    set_meta_tags(
      title: "About Us in Las Vegas",
      description: "Trucks of Nevada is a family-owned, owner-operated truck and trailer shop in Las Vegas. ASE-certified mechanics, same-day repairs, and 24/7 roadside."
    )
    @breadcrumbs = [["Home", root_path], ["About Us", about_path]]
  end

  def services
    set_meta_tags(
      title: "Truck Repair Services in Las Vegas",
      description: "Semi truck, trailer, transmission, electrical, engine, DPF, DOT, and roadside repair in Las Vegas. We do not do tires, alignment, or body work."
    )
    @breadcrumbs = [["Home", root_path], ["Services", services_path]]
  end

  def reviews
    set_meta_tags(
      title: "Google Reviews in Las Vegas",
      description: "Trucks of Nevada is a 4.8 on Google, from nearly 100 reviews. See why drivers come back, or leave your own."
    )
    @breadcrumbs = [["Home", root_path], ["Reviews", reviews_path]]
  end

  def service_areas
    set_meta_tags(
      title: "Service Areas around Las Vegas",
      description: "Mobile and shop repair for Las Vegas, Henderson, North Las Vegas, Boulder City, and Pahrump, about 100 miles from our shop."
    )
    @breadcrumbs = [["Home", root_path], ["Service Areas", service_areas_path]]
  end

  def contact
    set_meta_tags(
      title: "Contact Us in Las Vegas",
      description: "Call Trucks of Nevada at (702) 333-2463 or send a note. Shop hours Monday–Friday 8:30am–5:30pm. Roadside is 24/7."
    )
    @breadcrumbs = [["Home", root_path], ["Contact Us", contact_path]]
  end

  def privacy
    set_meta_tags(
      title: "Privacy Policy",
      description: "What Trucks of Nevada collects on this website, why, who receives it, and how to ask for access or deletion."
    )
  end

  def cookie_policy
    set_meta_tags(
      title: "Cookie Policy",
      description: "Cookies and similar tools on the Trucks of Nevada website, including Google Analytics and Google Ads, which stay off until you accept."
    )
  end

  def terms
    set_meta_tags(
      title: "Terms of Service",
      description: "Terms for using the Trucks of Nevada website. Repair work is agreed separately with the shop."
    )
  end

  def create_contact
    inquiry = contact_params
    acknowledged = ActiveModel::Type::Boolean.new.cast(inquiry[:privacy_ack])
    if inquiry[:name].blank? || inquiry[:phone].blank? || inquiry[:truck_issue].blank? || !acknowledged
      flash.now[:alert] = "Add your name, phone number, and what the truck is doing, and confirm we may call you back about this repair."
      set_meta_tags(title: "Contact Us in Las Vegas")
      @breadcrumbs = [["Home", root_path], ["Contact Us", contact_path]]
      render :contact, status: :unprocessable_entity
      return
    end

    payload = inquiry.to_h.except("privacy_ack", :privacy_ack)
    Rails.logger.info("Website contact: #{payload.inspect}")
    ContactMailer.inquiry(payload).deliver_now
    redirect_to contact_path, notice: "Message sent. If the truck is down, call us now so we can dispatch."
  rescue StandardError => e
    Rails.logger.error("Contact mail failed: #{e.class}: #{e.message}")
    redirect_to contact_path, alert: "We could not send that from the site. Call (702) 333-2463 and we will pick up."
  end

  def service
    @service = SiteContent.find!(params[:slug])
    set_meta_tags(title: @service.h1, description: @service.summary)
    @breadcrumbs = [
      ["Home", root_path],
      ["Services", services_path],
      [@service.name, "/#{@service.slug}"]
    ]
  end

  def sitemap
    origin = "https://trucksofnevada.com"
    pages = [
      root_path, about_path, services_path, reviews_path,
      service_areas_path, contact_path, privacy_policy_path, cookie_policy_path, terms_path
    ]
    slugs = SiteContent.services.map { |service| "/#{service.slug}" }
    @urls = (pages + slugs).uniq.map { |path| "#{origin}#{path}" }
  end

  private

  def contact_params
    params.require(:inquiry).permit(:name, :phone, :truck_issue, :privacy_ack)
  end
end
