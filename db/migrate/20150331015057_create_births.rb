class CreateBirths < ActiveRecord::Migration
  def change
    create_table :births do |t|
      t.date :due_date
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :births, :users
  end
end
