class Post < ApplicationRecord
  def body_html
    return "" if body.blank?

    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      fenced_code_blocks: true,
      autolink: true,
      tables: true,
      strikethrough: true,
      highlight: true
    )
    markdown.render(body)
  end
end
