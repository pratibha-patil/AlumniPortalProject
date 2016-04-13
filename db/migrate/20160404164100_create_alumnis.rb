class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
    	t.string :first_name
      t.string :last_name
      t.string :branch
      t.string :email
      t.integer :contact_no
      t.date    :birthdate
      t.string :company
      t.string :post_in_company
      t.string :area_of_interest
      t.string :username
	  t.string :password_digest
      t.timestamps
    end
  end
end
