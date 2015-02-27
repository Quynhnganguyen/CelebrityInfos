class CreateCelebrities < ActiveRecord::Migration
  def change
    create_table :celebrities do |t|
      t.string :name
      t.string :national
      t.string :domain

      t.timestamps
    end
  end
end
