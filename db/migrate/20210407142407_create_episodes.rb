class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :description
      t.string :runtime
      t.string :filepath
      t.time :published_date
      t.belongs_to :podcast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
