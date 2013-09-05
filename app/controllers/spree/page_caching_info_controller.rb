module Spree
  class PageCachingInfoController < Spree::StoreController
    ssl_allowed

    respond_to :json

    def index
      @cart_summary = URI.escape(render_to_string(:partial => 'spree/shared/cart_data'))  # don't want screwed up plusses in my cookies
      @preview_cart_summary = URI.escape(render_to_string(:partial => 'spree/shared/preview_cart_data'))
      @authenticity_token = session[:_csrf_token] ||= SecureRandom.base64(32)
    end

  end
end
