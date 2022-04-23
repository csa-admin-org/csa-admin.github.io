require 'slim'

Dir['./*/*.rb'].each { |file| load file }
include FaviconsHelper

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
set :url_root, @app.data.site.host

activate :tailwind do |config|
  config.destination_path = 'source/stylesheets/site.css'
  config.css_path = 'source/stylesheets/tailwind.css'
  config.config_path = 'tailwind.config.js'
end
activate :livereload

configure :development do
  set      :debug_assets, true
end

configure :build do
  set      :asset_host, @app.data.site.host
  set      :relative_links, true
  activate :asset_hash
  activate :directory_indexes
  activate :favicon_maker, icons: generate_favicons_hash
  activate :gzip
  activate :minify_html
  activate :search_engine_sitemap
  activate :relative_assets
  activate :robots,
    rules: [{ user_agent: '*', allow: %w[/] }],
    sitemap: File.join(@app.data.site.host, 'sitemap.xml')
end
activate :inline_svg

set :favicons, [
  {
    rel: 'apple-touch-icon',
    size: '180x180',
    icon: 'apple-touch-icon.png'
  },
  {
    rel: 'icon',
    type: 'image/png',
    size: '32x32',
    icon: 'favicon32x32.png'
  },
  {
    rel: 'icon',
    type: 'image/png',
    size: '16x16',
    icon: 'favicon16x16.png'
  },
  {
    rel: 'shortcut icon',
    size: '64x64,32x32,24x24,16x16',
    icon: 'favicon.ico'
  }
]
