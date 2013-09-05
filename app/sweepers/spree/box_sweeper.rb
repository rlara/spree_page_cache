module Spree
  class BoxSweeper < ActionController::Caching::Sweeper
    observe Box

    def after_save(box)
      expire_page "/"
    end
  end
end
