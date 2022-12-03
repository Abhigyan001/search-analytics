class CreateAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :analytics do |t|
      t.string :query
      t.integer :count
      t.integer :users
      t.integer :articles
      t.string :session_id

      t.timestamps
    end
  end
end
