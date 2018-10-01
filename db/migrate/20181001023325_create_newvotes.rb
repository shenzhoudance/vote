class CreateNewvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :newvotes do |t|
      t.integer :topic_id

      t.timestamps
    end
  end
end
