module Spree
  class ProductSweeper < ActionController::Caching::Sweeper
    observe Product

    def after_save(product)
      expire_page product_path(product)
      expire_page products_path
      expire_page "/"
      expire_fragment(%r{t/*})
      expire_fragment(%r{products.*})

      FileUtils.rm_rf "#{page_cache_directory}/index.html"
      FileUtils.rm_rf "#{page_cache_directory}/t"
    end
  end
end
