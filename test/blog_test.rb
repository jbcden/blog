require_relative 'test_helper'
require 'blog'

class TestBlog < MiniTest::Test
  def setup
    @blog = Blog.new
    @blog.title = "This is a test"
  end

  def test_has_a_title
    assert_equal "This is a test", @blog.title
  end

  def test_can_read_its_title
    refute_nil @blog.title
  end

  def test_starts_with_an_empty_collection_of_entries
    assert_empty @blog.entries
  end

  def test_new_post_returns_an_entry
    new_entry = OpenStruct.new
    @blog.post_source = ->{new_entry}

    assert_equal new_entry, @blog.new_post
  end

  def test_makes_a_reference_to_its_blog
    post = @blog.new_post

    assert_equal @blog, post.blog
  end

  def test_can_add_an_entry
    assert_empty @blog.entries

    @blog.add_entry(@blog.new_post)

    refute_empty @blog.entries
  end
end
