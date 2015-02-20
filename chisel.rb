# document = '# My Life in Desserts
#
# ## Chapter 1: The Beginning
#
# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place has been packed every night."'
#
# parser = Chisel.new
# output = parser.parse(document)
# puts output


class Chisel

  attr_reader   :document

  def initialize(document)
    @document = document.split("\n")
  end

  def locate_header_and_replace_with_html
    html_doc = @document.map do |markdown|
        if  markdown == ""
            markdown
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
    html_doc #this is the array by line
  end

  def formatting
    formatted = locate_header_and_replace_with_html.to_s.split(" ").map do |text|
      if text.include? "**"
          tag = text.delete"**"
          tag.gsub tag, "<strong>#{tag}</strong>"
      elsif text.include? "*"
          tag = text.delete"*"
          tag.gsub tag, "<em>#{tag}</em>"
        elsif text.include? ""
          text.delete""
        else
          text
        end
      end
      formatted.join(" ") #this the array by line
    end



  def reassemble
    print formatted.join("\n")
  end

end

# chisel = Chisel.new('# My Life in Desserts
#
# ## Chapter 1: The Beginning
#
# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place')
#
#
# print chisel.split
# test = Chisel.new.parse('# My Life in Desserts
#
# ## Chapter 1: The Beginning
#
# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place')
#
#
#

# <h1>My Life in Desserts</h1>
#
# <h2>Chapter 1: The Beginning</h2>
#
# <p>
#   "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
#   <strong>Food &amp; Wine</strong> this place has been packed every night."
# </p>
