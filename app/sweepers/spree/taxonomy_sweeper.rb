module Spree
  class TaxonomySweeper < ActionController::Caching::Sweeper
    observe Taxonomy

    def after_save(taxonomy)
      expire_page "/"
      expire_page products_path
      expire_fragment(%r{products.*})
      expire_fragment(%r{t/*})

      FileUtils.rm_rf "#{page_cache_directory}/t"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end

