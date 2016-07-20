class CreateAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :accesses do |t|
      t.string :user
      t.string :url
      t.string :date

      t.timestamps
    end
  end
end
