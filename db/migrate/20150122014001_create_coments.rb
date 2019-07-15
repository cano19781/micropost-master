class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.string :commenter
      t.text :body
      t.references :trouble

      t.timestamps
    end
    add_index :coments, :trouble_id
  end
end
