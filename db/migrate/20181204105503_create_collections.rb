class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.references :game, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
