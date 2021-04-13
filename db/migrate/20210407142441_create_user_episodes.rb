class CreateUserEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_episodes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :episode, null: false, foreign_key: true
      t.boolean :listened, default: false
      t.integer :current_time, default: 0

      t.timestamps
    end
  end
end
