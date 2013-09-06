module Spree
  class SlideSweeper < ActionController::Caching::Sweeper
    observe Slide

    def after_save(slide)
      expire_page "/"
      FileUtils.rm_rf "#{page_cache_directory}/index.html"
    end
  end
end
