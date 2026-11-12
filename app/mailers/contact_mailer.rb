class ContactMailer < ApplicationMailer
  def inquiry(inquiry)
    @inquiry = inquiry
    mail(
      to: "info@trucksofnevada.com",
      subject: "Website request from #{inquiry[:name]}"
    )
  end
end
