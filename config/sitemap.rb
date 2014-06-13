# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.educationaldesignstudios.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # 
  add '/',        :priority => 1.0, :changefreq => 'weekly'
  add '/home',    :priority => 1.0, :changefreq => 'weekly'
  add '/index',   :priority => 1.0, :changefreq => 'weekly'

  add '/plans',   :priority => 0.7, :changefreq => 'weekly'
  add '/terms',   :priority => 0.1, :changefreq => 'weekly'
  add '/about',   :priority => 0.9, :changefreq => 'weekly'
  add '/contact', :priority => 0.8, :changefreq => 'weekly'

  add '/login',   :priority => 0.8, :changefreq => 'weekly'
  add '/users/signup', :priority => 0.8, :changefreq => 'weekly'
  add '/signup',  :priority => 0.8, :changefreq => 'weekly'

  add '/founding_members', :priority => 0.1, :changefreq => 'daily'
  Upload.all.each do |u|
    add upload_path(u), :priority => 0.5, :changefreq => 'weekly'
  end
  
  add '/uploads', :priority => 0.7, :changefreq => 'daily'
end
