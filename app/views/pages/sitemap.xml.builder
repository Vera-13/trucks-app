xml.instruct!
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @urls.each do |loc|
    xml.url { xml.loc loc }
  end
end
