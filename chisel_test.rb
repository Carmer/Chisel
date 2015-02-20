require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "chisel"

class TestChisel < Minitest::Test

  def test_exists
    chisel = Chisel.new("doc")
  end

  def test_it_accepts_a_document_and_changes_to_array_by_line
    chisel = Chisel.new("#document of many lines and more lines \n\n and other lines... oooooo yeah")
    assert_equal ["#document of many lines and more lines ", "", " and other lines... oooooo yeah"], chisel.document
  end

  def test_it_can_split_document
    skip
    chisel = Chisel.new("# test to split doc")
    assert_equal ["#", "test", "to", "split", "doc"], chisel.split
  end

  def test_iterate_array_and_locate_markdown_and_replace_with_html

    chisel = Chisel.new("#document of many lines and more lines \n\n and other lines... oooooo yeah")
    assert_equal ["<h1>document of many lines and more lines </h1>", "", "<p> and other lines... oooooo yeah</p>"], chisel.locate_markdown_and_replace_with_html
  end

end
