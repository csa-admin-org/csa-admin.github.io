Dir['./*/*.rb'].each { |file| load file }

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
set :url_root, @app.data.site.host

activate :external_pipeline,
         name: :tailwindcss,
         command: build? ? 'tailwindcss -i source/stylesheets/tailwind.css -o source/stylesheets/site.css --minify' : 'tailwindcss -i source/stylesheets/tailwind.css -o source/stylesheets/site.css --watch',
         source: 'source',
         latency: 1
activate :livereload
activate :i18n,
         mount_at_root: :en,
         lang_map: { fr: :acp, de: :solawi }

configure :development do
  set      :debug_assets, true
end

configure :build do
  set      :asset_host, @app.data.site.host
  set      :relative_links, true
  activate :asset_hash
  activate :directory_indexes
  activate :gzip
  activate :relative_assets
  activate :robots,
           rules: [{ user_agent: '*', allow: %w[/] }],
           sitemap: File.join(@app.data.site.host, 'sitemap.xml')
end
activate :inline_svg

helpers do
  def current_page?(path)
    current_page.url.chomp('/') == path.chomp('/')
  end
end
