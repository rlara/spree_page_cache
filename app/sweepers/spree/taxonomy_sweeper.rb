module Spree
  class TaxonomySweeper < ActionController::Caching::Sweeper
    observe Taxonomy

    def after_save(taxonomy)
      expire_page products_path
      expire_page "/"
      expire_fragment(%r{t/*})
      expire_fragment(%r{products.*})

      FileUtils.rm_rf "#{page_cache_directory}/t"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end

