module Spree
  class ProductSweeper < ActionController::Caching::Sweeper
    observe Product

    def after_save(product)
      expire_page product_path(product)
      expire_page products_path
      expire_page "/"
      expire_action(:controller => 'products', :action => :index)
      expire_action(:controller => 'taxons', :action => :show)
      FileUtils.rm_rf "#{page_cache_directory}/t"
      FileUtils.rm_rf "#{page_cache_directory}/taxons"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end
