class PostsBelongToNotebooks < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.belongs_to :notebook
    end
  end
end
