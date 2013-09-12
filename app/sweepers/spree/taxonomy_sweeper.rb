module Spree
  class TaxonomySweeper < ActionController::Caching::Sweeper
    observe Taxonomy

    def after_save(taxonomy)
      expire_page "/"
      expire_page products_path
      expire_fragment(%r{products.*})
      expire_action(:controller => 'products', :action => :index)
      expire_fragment('taxon_items_header')
      expire_fragment('taxon_items_footer')
      expire_fragment(%r{taxons/*})
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end

