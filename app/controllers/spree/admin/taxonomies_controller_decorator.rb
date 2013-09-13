Spree::Admin::TaxonomiesController.class_eval do
  cache_sweeper Spree::TaxonomySweeper, :only => [:update, :destroy, :create]
end
