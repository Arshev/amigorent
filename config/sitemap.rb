# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://amigorent.ru'
SitemapGenerator::Sitemap.sitemaps_path = ''
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add cars_path, :priority => 0.7, :changefreq => 'daily'
  add economy_cars_path, :priority => 0.7, :changefreq => 'daily'
  add middle_cars_path, :priority => 0.7, :changefreq => 'daily'
  add minivans_cars_path, :priority => 0.7, :changefreq => 'daily'
  add crossovers_cars_path, :priority => 0.7, :changefreq => 'daily'
  add business_cars_path, :priority => 0.7, :changefreq => 'daily'
  add commercial_cars_path, :priority => 0.7, :changefreq => 'daily'
  
  add abouts_path, :priority => 0.3, :changefreq => 'weekly'
  add faqs_path, :priority => 0.3, :changefreq => 'weekly'
  add prices_path, :priority => 0.7, :changefreq => 'daily'
  add contacts_path, :priority => 0.3, :changefreq => 'weekly'
  add bookings_path, :priority => 0.3, :changefreq => 'weekly'
  add reviews_path, :priority => 0.5, :changefreq => 'weekly'
  add terms_path, :priority => 0.5, :changefreq => 'weekly'
  add services_path, :priority => 0.5, :changefreq => 'weekly'
  add conditions_path, :priority => 0.3, :changefreq => 'weekly'
  

  add cars_en_path, :priority => 0.3, :changefreq => 'daily'
  add economy_cars_en_path, :priority => 0.7, :changefreq => 'daily'
  add middle_cars_en_path, :priority => 0.7, :changefreq => 'daily'
  add minivans_cars_en_path, :priority => 0.7, :changefreq => 'daily'
  add crossovers_cars_en_path, :priority => 0.7, :changefreq => 'daily'
  add business_cars_en_path, :priority => 0.7, :changefreq => 'daily'
  add commercial_cars_en_path, :priority => 0.7, :changefreq => 'daily'

  add abouts_en_path, :priority => 0.3, :changefreq => 'weekly'
  add faqs_en_path, :priority => 0.3, :changefreq => 'weekly'
  add prices_en_path, :priority => 0.3, :changefreq => 'daily'
  add contacts_en_path, :priority => 0.3, :changefreq => 'weekly'
  add bookings_en_path, :priority => 0.3, :changefreq => 'weekly'
  add reviews_en_path, :priority => 0.3, :changefreq => 'weekly'
  add terms_en_path, :priority => 0.5, :changefreq => 'weekly'
  add conditions_en_path, :priority => 0.3, :changefreq => 'weekly'

  add deliveries_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_aeroport_hrabrovo_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_zelenogradsk_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_svetlogorsk_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_yantarnyi_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_baltyisk_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_pionerskyi_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_chernyahovsk_path, :priority => 0.5, :changefreq => 'weekly'

  add deliveries_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_aeroport_hrabrovo_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_zelenogradsk_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_svetlogorsk_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_yantarnyi_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_baltyisk_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_pionerskyi_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_chernyahovsk_en_path, :priority => 0.3, :changefreq => 'weekly'

  add services_path, :priority => 0.5, :changefreq => 'weekly'
  add arenda_avto_s_voditelem_path, :priority => 0.5, :changefreq => 'weekly'
  add car_sharing_path, :priority => 0.5, :changefreq => 'weekly'
  add casko_path, :priority => 0.5, :changefreq => 'weekly'
  add corporativnym_clientam_path, :priority => 0.5, :changefreq => 'weekly'
  add sales_system_path, :priority => 0.5, :changefreq => 'weekly'
  add payment_methods_path, :priority => 0.5, :changefreq => 'weekly'
  add transportnyi_autsorsing_path, :priority => 0.5, :changefreq => 'weekly'
  add full_insurance_path, :priority => 0.5, :changefreq => 'weekly'

  add services_en_path, :priority => 0.3, :changefreq => 'weekly'
  add arenda_avto_s_voditelem_en_path, :priority => 0.3, :changefreq => 'weekly'
  add car_sharing_en_path, :priority => 0.3, :changefreq => 'weekly'
  add casko_en_path, :priority => 0.3, :changefreq => 'weekly'
  add corporativnym_clientam_en_path, :priority => 0.3, :changefreq => 'weekly'
  add sales_system_en_path, :priority => 0.3, :changefreq => 'weekly'
  add payment_methods_en_path, :priority => 0.3, :changefreq => 'weekly'
  add transportnyi_autsorsing_en_path, :priority => 0.3, :changefreq => 'weekly'
  add full_insurance_en_path, :priority => 0.3, :changefreq => 'weekly'

  Car.find_each do |car|
    add car_path(car), :lastmod => car.updated_at
    add car_en_path(car), :lastmod => car.updated_at
  end

  Article.find_each do |article|
    add article_path(article), :lastmod => article.updated_at
  end
end
