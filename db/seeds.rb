User.create!(name:  "Sudo Su #User Final ",
             email: "example@gmail.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

Account.create(name: "Tarjeta")
Account.create(name: "PayPal")
Account.create(name: "Cartera")
Account.create(name: "Cursos")

Movement.create(user_id: 1, account_id: 1, concepto_de_pago: "Abono de coppel", reference: "1212", date: "2012/06/12", detail: "Pago de deudas")
Movement.create(user_id: 1, account_id: 1, concepto_de_pago: "Compra en amazon", reference: "1313", date: "2012/06/13", detail: "---")

Movement.create(user_id: 1, account_id: 2, concepto_de_pago: "Transferencia bancaria", reference: "Sin Referencia", date: "27/04/16", detail: "envio de dinero a Jose Jose")
Movement.create(user_id: 1, account_id: 2, concepto_de_pago: "Compra en tienda digital", reference: "Sin Referencia", date: "05/05/16", detail: "unos discos")

# $ rails console
# User.first.accounts.find(1)
	#<Account id: 1, name: "Tarjeta", created_at: "2017-01-10 16:37:26", updated_at: "2017-01-10 16:37:26">
# User.first.accounts.find(2)
	#<Account id: 2, name: "PayPal", created_at: "2017-01-10 16:37:26", updated_at: "2017-01-10 16:37:26">


# User.first.movements.find(1)
	#<Movement id: 1, user_id: 1, account_id: 1, concepto_de_pago: "Abono de coppel", reference: "1212", date: "2012-06-12", detail: "Pago de deudas">
# User.first.movements.find(2)
	#<Movement id: 2, user_id: 1, account_id: 1, concepto_de_pago: "Compra en amazon", reference: "1313", date: "2012-06-13", detail: "---">
# User.first.movements.find(3)
	#<Movement id: 3, user_id: 1, account_id: 2, concepto_de_pago: "Transferencia bancaria", reference: "Sin Referencia", date: "0027-04-16", detail: "envio de dinero a Jose Jose">
# User.first.movements.find(4)	
	#<Movement id: 4, user_id: 1, account_id: 2, concepto_de_pago: "Compra en tienda digital", reference: "Sin Referencia", date: "0005-05-16", detail: "unos discos">

# Account.first.movements
	#<ActiveRecord::Associations::CollectionProxy [#<Movement id: 1, user_id: 1, account_id: 1, concepto_de_pago: "Abono de coppel", reference: "1212", date: "2012-06-12", detail: "Pago de deudas">, 
	#<Movement id: 2, user_id: 1, account_id: 1, concepto_de_pago: "Compra en amazon", reference: "1313", date: "2012-06-13", detail: "---">]>

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end
