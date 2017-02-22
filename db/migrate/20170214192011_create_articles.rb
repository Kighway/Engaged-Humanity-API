class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :source
      t.string :author
      t.string :image_url
      t.string :date

      t.timestamps
    end
  end
end
