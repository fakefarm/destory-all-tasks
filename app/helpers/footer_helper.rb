module FooterHelper
  def footer_nav
    if !!current_user
      render 'layouts/footer/logged_in'
    else
      render 'layouts/footer/public'
    end
  end
end
