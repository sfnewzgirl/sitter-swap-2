class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :city
      t.string :email
      t.string :password_digest

      t.timestamps

      t.index [:email, :password_digest], name: "index_people_on_email_and_password_digest"
      t.index [:email], name: "index_people_on_email"
    end
  end
end
