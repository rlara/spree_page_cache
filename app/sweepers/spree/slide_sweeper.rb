module Spree
  class SlideSweeper < ActionController::Caching::Sweeper
    observe Slide

    def after_save(slide)
      expire_page "/"
    end
  end
end
