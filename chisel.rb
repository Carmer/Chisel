class Chisel

  attr_reader   :document

  def initialize(document)
    @document = document.split("\n\n")
  end

  def locate_markdown_replace_with_html
    html_doc = @document.map do |markdown|

        if markdown.include? "######"
            text = markdown.delete"######"
            text.gsub text, "<h6>#{text}</h6>"
          elsif markdown.include? "#####"
            text = markdown.delete"#####"
            text.gsub text, "<h5>#{text}</h5>"
          elsif markdown.include? "####"
            text = markdown.delete"####"
            text.gsub text, "<h4>#{text}</h4>"
          elsif markdown.include? "###"
            text = markdown.delete"###"
            text.gsub text, "<h3>#{text}</h3>"
          elsif markdown.include? "##"
            text = markdown.delete"##"
            text.gsub text, "<h2>#{text}</h2>"
          elsif markdown.include? ("#")
            text = markdown.delete"#"
            text.gsub text, "<h1>#{text}</h1>"
          elsif markdown.include? ""
            text = markdown.delete""
            text.gsub text, "<p>#{text}</p>"
        else  markdown
      end
    end
    html_doc
  end

  def formatting
    formatted = locate_markdown_replace_with_html.join.split(" ").map do |text|
      if text.include? "**"
              tag = text.delete"**"
              tag.gsub tag, "<strong>#{tag}</strong>"
      elsif text.include? "*"
              tag = text.delete"*"
              tag.gsub tag, "<em>#{tag}</em>"
      elsif text.include? ""
              text.delete""
        else text
        end
      end
    formatted
    end

  def reassemble
    formatting.join(" ")
  end
end
