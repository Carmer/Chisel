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

  attr_reader :document

  def initialize(document)
    @document = document
    find_all_markdown = false
  end

  def split
    @document.split(" ")
  end

  def locate_markdown_and_replace_open_head_tag
  html_doc =  @document.split.map do |markdown|
        if  markdown == "####"
          puts markdown
            markdown.replace "<h4>"
      elsif markdown == "###"
            markdown.replace "<h3>"
      elsif markdown == "##"
            markdown.replace "<h2>"
      elsif markdown == ("#")
            markdown.replace "<h1>"
      else  markdown
      end
    end
  end

  def collect_closing_head_tag


  end




end


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
