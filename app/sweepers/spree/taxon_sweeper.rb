module Spree
  class TaxonSweeper < ActionController::Caching::Sweeper
    observe Taxon

    def after_save(taxon)
      expire_page products_path
      expire_page "/"
      expire_fragment(%r{t/*})
      expire_fragment(%r{products.*})

      FileUtils.rm_rf "#{page_cache_directory}/index.html"
      FileUtils.rm_rf "#{page_cache_directory}/t"
    end
  end
end
