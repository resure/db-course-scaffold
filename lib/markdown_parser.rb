# encoding: utf-8
class MarkdownParser
  def initialize text
    @text = text
  end

  def to_html
    parse @text
  end

  private

  def parse text
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       autolink: true,
                                       space_after_headers: true,
                                       strikethrough: true,
                                       tables: true,
                                       no_images: true,
                                       hard_wrap: true)
    post (markdown.render (pre text))
  end

  def pre(text)
    text
  end

  def post(text)
    result = text.gsub(/\[toggle \&quot\;(.*?)\&quot\; \&quot\;(.*?)\&quot\;\]([\S\s]*?)\[\/toggle\]/i,
      '<div class="toggle">
        <span class="hide_action"><i class="icon-chevron-up"></i>\2</span>
        <span class="show_action"><i class="icon-chevron-down"></i>\1</span>
        <span class="fold_action"><i class="icon-chevron-down"></i>\1</span>
        <p class="fold">
          \3
        </p>
      </div>')
    result = result.gsub(/\[left\]([\S\s]*?)\[\/left\]/i,'<div class="left-align">\1</div>')
    result = result.gsub(/\[right\]([\S\s]*?)\[\/right\]/i,'<div class="right-align">\1</div>')
    result = result.gsub(/\[center\]([\S\s]*?)\[\/center\]/i,'<div class="center-align">\1</div>')
    result = result.gsub(/\[img (\w+) ([\w.-]+) ([\wа-яА-Я\d\s\-]+)\]/i, 
      '<div class="\1 img"><a href="http://i.scp.su/\2" rel="external"><img src="http://i.scp.su/\2" alt="\3"></a><span>\3</span></div>')
    result = result.gsub(/\^(.*?)\^/i,'<small>\1</small>')
    result = result.gsub(/\(c\)/i, '&copy;')
    result = result.gsub(/\(r\)/i, '&reg;')
    result = result.gsub(/\(tm\)/i, '&trade;')
    result = result.gsub(/\.{3,}/i, '&hellip;')
    result = result.gsub(/\s-{1,2}\s/i, '&mdash;')
    result = result.gsub(/--/i, '&mdash;')
    result = result.gsub(/(\D)(\=|%|x|х)(\)|\(){1,}/i, '\1:\3')

    result
  end
end
