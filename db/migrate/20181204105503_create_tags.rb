class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :game, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
