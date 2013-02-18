class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.string     :body
      t.integer    :user_id
      t.timestamps
    end
  end

  def down
    drop_table :entries
  end
end
