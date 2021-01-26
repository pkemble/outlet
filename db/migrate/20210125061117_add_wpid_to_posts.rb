class AddWpidToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :wpid, :int
  end
end
