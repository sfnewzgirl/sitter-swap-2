class CreateFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :families do |t|
      t.string :family_name

      t.timestamps

      t.index [:family_name], name: "index_families_on_family_name"
    end
  end
end
