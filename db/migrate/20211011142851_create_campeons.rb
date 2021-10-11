class CreateCampeons < ActiveRecord::Migration[5.2]
  def change
    create_table :campeons do |t|
      t.string :nombre
      t.string :region
      t.string :rol
      t.string :comp

      t.timestamps
    end
  end
end
