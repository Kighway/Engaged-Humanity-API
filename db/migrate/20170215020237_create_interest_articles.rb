class CreateInterestArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_articles do |t|
      t.integer :interest_id
      t.integer :article_id

      t.timestamps
    end
  end
end
