class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.date :birthday
      t.boolean :isActive
      t.text :description

      t.timestamps null: false
    end
  end
end
