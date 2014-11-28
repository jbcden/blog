class Post
  attr_accessor :blog, :title, :body

  def initialize
  end

  def valid?
    !title.nil? && !body.nil?
  end

  def publish
    return blog.add_entry(self) if valid?
    fail RuntimeError
  end
end
