module ApplicationHelper
  include FooterHelper

  def markdown(text)
    options = [:hard_wrap]
    Redcarpet.new(text, *options).to_html.html_safe
  end

  def display_clock(dt)
    if dt.nil?
      dt = Time.now
    else
      dt = Time.now.in_time_zone(current_user.profile.time_zone)
    end

      dt.strftime('%l:%M %P (%Z)')
  end

  def punt_time
    if true # current_user.profile.punt_default.present?
      '_dw string'
      # current_user.profile.punt_default.to_i.days.from_now
    else
      3.days.from_now
    end
  end
end
