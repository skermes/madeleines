class CreateRemembrances < ActiveRecord::Migration
  def change
    create_table :remembrances do |t|
      t.string :url
      t.string :title
      t.text :preview
      t.timestamp :remembered_on
      t.timestamp :dropped_on
    end
  end
end
