class RodauthApp < Rodauth::Rails::App
  # primary configuration
  configure RodauthMain

  # secondary configuration
  # configure RodauthAdmin, :admin
  rodauth do
    # Налаштування login_form_required
    login_form_required { !current_account }
  end

  route do |r|
    rodauth.load_memory # autologin remembered users

    r.rodauth # route rodauth requests

    # ==> Authenticating requests
    # Call `rodauth.require_account` for requests that you want to
    # require authentication for. For example:
    #
    # # authenticate /dashboard/* and /account/* requests
    # if r.path.start_with?("/dashboard") || r.path.start_with?("/account")
    #   rodauth.require_account
    # end

    # ==> Secondary configurations
    # r.rodauth(:admin) # route admin rodauth requests
    if r.path.start_with?("/categories")
      rodauth.require_authentication
    end
    if r.path.start_with?("/operations")
      rodauth.require_authentication
    end
    if r.path.start_with?("/reports")
      rodauth.require_authentication
    end
    if r.path.start_with?("/accounts/home")
      rodauth.require_authentication
    end
    if r.path.start_with?("/main")
      rodauth.require_authentication
    end
    if rodauth.uses_two_factor_authentication?
      rodauth.require_two_factor_authenticated
    end
  end
end
