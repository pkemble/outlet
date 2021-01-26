class AddEnclosureToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :enclosure, :string
  end
end
