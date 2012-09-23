module ApplicationHelper
  def markdown text
    MarkdownParser.new(text).to_html.html_safe
  end

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

  def nested_messages(message)
    messages.map do |message, sub_messages|
      render(message) + content_tag(:div, nested_messages(sub_messages), class: 'nested')
    end.join.html_safe
  end

  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def query(query, show_query = true)
    content_for(:query) { h(query.to_s) }
    @show_query = show_query
  end

  def show_query?
    @show_query
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
