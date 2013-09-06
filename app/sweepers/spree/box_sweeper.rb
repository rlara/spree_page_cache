module Spree
  class BoxSweeper < ActionController::Caching::Sweeper
    observe Box

    def after_save(box)
      expire_page "/"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end
