xml.instruct!
xml.urlset("xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9", "xmlns:xhtml" => "http://www.w3.org/1999/xhtml") do
  xml.url do
    xml.loc "https://csa-admin.org"
    xml.changefreq "weekly"
    xml.priority "1.0"
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "fr", href: "https://csa-admin.org/acp")
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "de", href: "https://csa-admin.org/solawi")
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "x-default", href: "https://csa-admin.org")
  end

  xml.url do
    xml.loc "https://csa-admin.org/acp"
    xml.changefreq "weekly"
    xml.priority "0.9"
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "en", href: "https://csa-admin.org")
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "de", href: "https://csa-admin.org/solawi")
  end

  xml.url do
    xml.loc "https://csa-admin.org/solawi"
    xml.changefreq "weekly"
    xml.priority "0.9"
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "en", href: "https://csa-admin.org")
    xml.tag!("xhtml:link", rel: "alternate", hreflang: "fr", href: "https://csa-admin.org/acp")
  end
end
