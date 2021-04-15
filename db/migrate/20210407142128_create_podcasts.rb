class CreatePodcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :rss_feed
      t.string :description, default: nil
      t.string :podcast_img_url
      t.string :podcast_home_url, default: nil

      t.timestamps
    end
  end
end
