require_relative 'test_helper'
require 'post'

class PostTest < MiniTest::Test
  def setup
    @post = Post.new
    @post.blog = Blog.new
  end

  def test_post_starts_with_null_title
    assert_nil @post.title
  end

  def test_post_starts_with_null_body
    assert_nil @post.body
  end

  def test_can_set_title_and_body
    @post.title = "This is a title"
    @post.body = "Apples are great"

    refute_nil @post.title
    refute_nil @post.body
  end

  def test_post_can_determine_if_not_valid
    assert_equal false,  @post.valid?
  end

  def test_post_can_determine_valid
    @post.title = 'I am valid'
    @post.body = 'And this is my story'

    assert_equal true, @post.valid?
  end

  def test_can_publish_entry
    @post.title = 'I am valid'
    @post.body = 'And this is my story'

    @post.publish
  end
end
