# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


r1 = Role.create!({ name: 'Buyer', description: 'Can read items' })
r2 = Role.create!({ name: 'Organizer', description: 'Can read and create items. Can update and destroy own items' })
r3 = Role.create!({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

#u1 = User.create({ email: 'admin@admin.com', password: 'lala123', password_confirmation: 'lala123', role_id: r1.id })