class CreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_table :admins do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
