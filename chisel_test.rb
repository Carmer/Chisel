require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "chisel"

class TestChisel < Minitest::Test

  def test_exists
    chisel = Chisel.new("doc")
  end

  def test_it_accepts_a_document
    chisel = Chisel.new("document of many lines and more lines \n and other lines... oooooo yeah")
    assert_equal "document of many lines and more lines \n and other lines... oooooo yeah", chisel.document
  end

  def test_it_can_split_document
    chisel = Chisel.new("# test to split doc")
    assert_equal ["#", "test", "to", "split", "doc"], chisel.split
  end

  def test_iterate_array_and_locate_markdown_head_tag
    chisel = Chisel.new("# text ## text ### text")
    assert_equal ["<h1>", "text", "<h2>", "text", "<h3>", "text"], chisel.locate_markdown_and_replace_open_head_tag
  end

  def test_collect_close_head_tag
    skip
    chisel = Chisel.new("#text\n##text\n###text\n")
    assert_equal ["<h1>", "<h1>", "<h1>"], chisel.collect_closing_head_tag
  end


end
