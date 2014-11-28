require 'post'
class Blog
  attr_writer :post_source
  attr_accessor :title, :entries
  attr_reader :size

  def initialize
    @entries = []
  end

  def new_post
    post_source.call.tap do |e|
      e.blog = self
    end
  end

  def size
    entries.size
  end

  def add_entry(entry)
    entries << entry
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end
end
