class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :website
      t.string :short_id
      t.integer :visit

      t.timestamps
    end
  end
end
