# we cancel the spree_auth override by reusing the override name
Deface::Override.new(:virtual_path => "spree/shared/_nav_bar",
                     :name => "auth_shared_login_bar",
                     :replace => "[data-hook='login-bar']",
                     :partial => "spree/shared/auth_bar",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/shared/_nav_bar",
                     :name => "auth_shared_account_bar",
                     :replace => "[data-hook='account-bar']",
                     :partial => "spree/shared/account_bar",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/shared/_store_menu",
                     :name => "cart_shared_login_bar",
                     :replace => "[data-hook='link-to-cart'], #link-to-cart[data-hook]",
                     :partial => "spree/shared/cart_bar",
                     :disabled => false)
