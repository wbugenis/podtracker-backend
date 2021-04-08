class CreateUserEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_episodes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :episode_belongs_to
      t.boolean :listened
      t.integer :current_time

      t.timestamps
    end
  end
end
