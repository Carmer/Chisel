require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "chisel"

class TestChisel < Minitest::Test

  def test_exists
    chisel = Chisel.new("doc")
  end

  def test_it_can_accept_a_document
      chisel = Chisel.new("Accept a Document?")
      assert_equal ["Accept a Document?"], chisel.document
    end

  def test_it_can_split_doc_by_paragraph_and_hold_it_in_an_array
    chisel = Chisel.new("# test to split doc\n\nby paragraph")
    assert_equal ["# test to split doc", "by paragraph"], chisel.document
  end

  def test_it_can_find_paragraphs_and_insert_html_tags
    chisel = Chisel.new("#There will be a paragraph\n\n here")
    assert_equal ["<h1>There will be a paragraph</h1>", "<p> here</p>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_can_find_headers_and_replace_them_with_html
    chisel = Chisel.new("#")
    assert_equal ["<h1></h1>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_can_find_headers_and_replace_them_with_html
    chisel = Chisel.new("##")
    assert_equal ["<h2></h2>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_can_find_headers_and_replace_them_with_html
    chisel = Chisel.new("###")
    assert_equal ["<h3></h3>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_can_find_headers_and_replace_them_with_html
    chisel = Chisel.new("####")
    assert_equal ["<h4></h4>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_can_find_headers_and_replace_them_with_html
    chisel = Chisel.new("#####")
    assert_equal ["<h5></h5>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_can_find_headers_and_replace_with_html
    chisel = Chisel.new("######")
    assert_equal ["<h6></h6>"], chisel.locate_markdown_replace_with_html
  end

  def test_it_formats_to_html
    chisel = Chisel.new('# My Life in Desserts


    ## Chapter 1: The Beginning

    "You just *have* to try the cheesecake," he said. "Ever since it appeared in
    **Food & Wine** this place')
    assert_equal ["<h1>", "My", "Life", "in", "Desserts</h1><h2>", "Chapter", "1:", "The", "Beginning</h2><p>", "\"You", "just", "<em>have</em>", "to", "try", "the", "cheesecake,\"", "he", "said.", "\"Ever", "since", "it", "appeared", "in", "<strong>Food</strong>", "&", "<strong>Wine</strong>", "this", "place</p>"], chisel.formatting
  end

  def test_reassemble_to_html_doc
    chisel = Chisel.new('# My Life in Desserts


    ## Chapter 1: The Beginning

    "You just *have* to try the cheesecake," he said. "Ever since it appeared in
    **Food & Wine** this place')
    assert_equal "<h1> My Life in Desserts</h1><h2> Chapter 1: The Beginning</h2><p> \"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in <strong>Food</strong> & <strong>Wine</strong> this place</p>", chisel.reassemble
  end

end
