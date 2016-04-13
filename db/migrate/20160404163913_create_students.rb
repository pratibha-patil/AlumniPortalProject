class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :PRN_no
      t.string :branch
      t.string :email
      t.integer :contact_no
      t.date    :birthdate
      t.string :username
	    t.string :password_digest
      t.timestamps
    end
  end
end
