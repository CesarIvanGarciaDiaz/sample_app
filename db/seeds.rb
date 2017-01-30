require 'date'
require 'time'

User.create!(name:  "Ejemplo",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

Account.create(name: "Tarjeta")
Account.create(name: "PayPal")
Account.create(name: "Cartera")
Account.create(name: "Cursos")
Account.create(name:"Banco")
Account.create(name:"Caja Chica")
Account.create(name:"Pagos")

Category.create(name: "Partida Virtual", classification: "n")
Category.create(name: "Banco", classification: "e")
Category.create(name: "Donativos Recurrentes", classification: "i")
Category.create(name: "Renta Oficinas", classification: "e")
Category.create(name: "Impuestos Federales", classification: "e")

Category.create(name: "Inversion", classification: "i")
Category.create(name: "Donativos Unicos", classification: "e")

Category.create(name: "Prueba 1", classification: "n")
Category.create(name: "Prueba 2", classification: "i")
Category.create(name: "Prueba 3", classification: "n")

# Movement.create(user_id: 1, account_id: 1, concepto_de_pago: "Abono de coppel", reference: "1212", date: "2012/06/12", detail: "Pago de deudas", category_id: 2, withdrawal: 100)
# Movement.create(user_id: 1, account_id: 1, concepto_de_pago: "Fiesta en bar", reference: "1212", date: "2012/06/15", detail: "Pago por fiesta", category_id: 2, withdrawal: 150)
# Movement.create(user_id: 1, account_id: 1, concepto_de_pago: "Compra en amazon", reference: "1313", date: "2012/06/13", detail: "---", category_id: 1, withdrawal: 120)
# Movement.create(user_id: 1, account_id: 1, concepto_de_pago: "Compra en linio", reference: "1313", date: "2012/06/17", detail: "---", category_id: 1, withdrawal: 130)
#
# Movement.create(user_id: 1, account_id: 2, concepto_de_pago: "Transferencia bancaria", reference: "Sin Referencia", date: "27/04/16", detail: "envio de dinero a Jose Jose", category_id: 2, deposit: 400)
# Movement.create(user_id: 1, account_id: 2, concepto_de_pago: "Compra en tienda digital", reference: "Sin Referencia", date: "05/05/16", detail: "unos discos", category_id: 1)
#
# MovementDefined.create(movement_id: 1, detail: "Pago por tv 4k", total_amount: 90600, comission: 0)
# MovementDefined.create(movement_id: 1, detail: "Lavadora 19'", total_amount: 10300, comission: 0)

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

# 
# 3.times do |n|
#
# user_id = 1
# account_id = Faker::Number.number(1)
# concepto_de_pago = 'pago por honorarios'
# reference =  ""
# date = Faker::Date.forward(23).strftime('%Y-%m-%d')
# detail = "Ingresos para alumnos"
# category_id = 1
# withdrawal = 0
# deposit = Faker::Number.number(3)
#   Movement.create!(user_id:  user_id,
#               account_id: account_id,
#               concepto_de_pago: concepto_de_pago,
#               reference: reference,
#               date: date,
#               detail: detail ,
#               category_id: category_id,
# withdrawal: withdrawal,
# deposit: deposit
# )
# end
