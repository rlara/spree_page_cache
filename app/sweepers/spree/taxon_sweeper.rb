module Spree
  class TaxonSweeper < ActionController::Caching::Sweeper
    observe Taxon

    def after_save(taxon)
      expire_page "/"
      expire_page products_path
      expire_fragment(%r{products.*})
      expire_fragment(%r{t/*})
      FileUtils.rm_rf "#{page_cache_directory}/t"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end
