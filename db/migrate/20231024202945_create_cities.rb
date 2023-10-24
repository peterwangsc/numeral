class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :lon
      t.float :lat
      t.float :temp

      t.timestamps
    end
  end
end
