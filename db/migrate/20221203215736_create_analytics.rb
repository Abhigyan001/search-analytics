class CreateAnalytics < ActiveRecord::Migration[7.0]
  def change
    create_table :analytics do |t|
      t.string :query
      t.integer :articles, default: 0
      t.string :session_id

      t.timestamps
    end
  end
end
