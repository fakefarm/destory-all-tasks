module ApplicationHelper
  include FooterHelper

  def markdown(text)
    options = [:hard_wrap]
    Redcarpet.new(text, *options).to_html.html_safe
  end

  def display_clock(dt)
    unless current_user.profile.time_zone.blank?
      dt = Time.now.in_time_zone(current_user.profile.time_zone)
    end

      dt.strftime('%l:%M %P (%Z)')
  end

  def punt_time
    if current_user.profile.punt_default.present?
      current_user.profile.punt_default.to_i.days.from_now
    else
      3.days.from_now
    end
  end
end
