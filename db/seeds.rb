# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#user = User.new
#user.email = 'admin2@admin.com'
#user.encrypted_password = 'admin123'
#user.admin = 'true'
#user.save!
 
#user = User.create! :name => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret' , :admin => 'true'

User.create!([
  {age: "12/12/1991", email: "testadmin3@mail.com", password: "testadmin", password_confirmation: "testadmin" ,  admin: true},
  {age: "12/12/1991", email: "testuser3@mail.com", password: "testuser", password_confirmation: "testuser", admin: false, premium: 'si'},
  {age: "12/12/1991", email: "ad@ad.com", password: "testad", password_confirmation: "testad", admin: true, premium: 'solicitado'},
  {age: "12/12/1991", email: "testcustomer3@mail.com", password: "testcustomer", password_confirmation: "testcustomer", admin: false}
])

p 'cargo algo'