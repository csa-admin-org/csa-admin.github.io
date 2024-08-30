xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.path =~ /\.html/ }.each do |page|
    path = page.destination_path == "index.html" ? "" : "/#{page.destination_path}"
    xml.url do
      xml.loc "https://csa-admin.org#{path}"
      xml.changefreq "weekly"
      xml.priority path.blank? ? "1.0" : "0.5"
    end
  end
end
