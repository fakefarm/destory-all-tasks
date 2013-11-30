module FooterHelper
  def footer_nav
    if !!current_user
      render 'layouts/shared/footer/logged_in'
    else
      render 'layouts/shared/footer/public'
    end
  end
end
