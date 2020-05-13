# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://amigorent.ru"
SitemapGenerator::Sitemap.sitemaps_path = 'public/'
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add cars_path, :priority => 0.7, :changefreq => 'daily'
  add abouts_path, :priority => 0.3, :changefreq => 'weekly'
  add faqs_path, :priority => 0.3, :changefreq => 'weekly'
  add prices_path, :priority => 0.7, :changefreq => 'daily'
  add contacts_path, :priority => 0.3, :changefreq => 'weekly'
  add bookings_path, :priority => 0.3, :changefreq => 'weekly'

  add arenda_avto_aeroport_hrabrovo_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_zelenogradsk_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_svetlogorsk_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_yantarnyi_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_baltyisk_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_pionerskyi_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_chernyahovsk_path, :priority => 0.5, :changefreq => 'weekly'

  add arenda_avto_s_voditelem_path, :priority => 0.5, :changefreq => 'weekly'
  add car_sharing_path, :priority => 0.5, :changefreq => 'weekly'
  add casko_path, :priority => 0.5, :changefreq => 'weekly'
  add corporativnym_clientam_path, :priority => 0.5, :changefreq => 'weekly'
  add sales_system_path, :priority => 0.5, :changefreq => 'weekly'
  add payment_methods_path, :priority => 0.5, :changefreq => 'weekly'
  add transportnyi_autsorsing_path, :priority => 0.5, :changefreq => 'weekly'
  add full_insurance_path, :priority => 0.5, :changefreq => 'weekly'

  Car.find_each do |car|
    add car_path(car), :lastmod => car.updated_at
  end

  Article.find_each do |article|
    add article_path(article), :lastmod => article.updated_at
  end
end
