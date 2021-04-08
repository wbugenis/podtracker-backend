class CreateQueuedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :queued_items do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :episode_id
      t.boolean :played, default: false
      t.string :link, default: ""

      t.timestamps
    end
  end
end
