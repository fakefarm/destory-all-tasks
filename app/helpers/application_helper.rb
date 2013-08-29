module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap]
    Redcarpet.new(text, *options).to_html.html_safe
  end
end
