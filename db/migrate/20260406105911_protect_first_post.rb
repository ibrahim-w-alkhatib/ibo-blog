class ProtectFirstPost < ActiveRecord::Migration[8.1]
  def up
    post = Post.find_by("title LIKE ?", "%What Is This Blog All About%")
    post&.update(protected: true)
  end

  def down
    post = Post.find_by("title LIKE ?", "%What Is This Blog All About%")
    post&.update(protected: false)
  end
end
