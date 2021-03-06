class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :owner,references: :users, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
