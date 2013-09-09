module Spree
  class TaxonSweeper < ActionController::Caching::Sweeper
    observe Taxon

    def after_save(taxon)
      expire_page "/"
      expire_page products_path
      expire_action(:controller => 'products', :action => :index)
      expire_action(:controller => 'taxons', :action => :show)
      expire_fragment('taxon_items_header')
      expire_fragment('taxon_items_footer')
      FileUtils.rm_rf "#{page_cache_directory}/t"
      FileUtils.rm_rf "#{page_cache_directory}/taxons"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end
