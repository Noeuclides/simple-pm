#Admin
User.create!(email:"admin@mail.com", password:"123456", role: 0)

#Owners
o1 = User.create!(email:"owner1@mail.com", password:"123456", role: 1)
o2 = User.create!(email:"owner2@mail.com", password:"123456", role: 1)

#team_members
u1 = User.create!(email:"n1@mail.com", password:"123456", role: 2)
u2 = User.create!(email:"n2@mail.com", password:"123456", role: 2)
u3 = User.create!(email:"n3@mail.com", password:"123456", role: 2)
u4 = User.create!(email:"n4@mail.com", password:"123456", role: 2)
u5 = User.create!(email:"n5@mail.com", password:"123456", role: 2)
u6 = User.create!(email:"n6@mail.com", password:"123456", role: 2)

#projects
# p1 = Project.create!(name: "proyecto uno", description: "Descripción proyecto uno", owner: o1)
# p2 = Project.create!(name: "proyecto dos", description: "Descripción proyecto 2", owner: o1)
# p3 = Project.create!(name: "proyecto tres", description: "Descripción proyecto 3", owner: o1)
# p4 = Project.create!(name: "proyecto cuatro", description: "Descripción proyecto 4", owner: o1)
# p5 = Project.create!(name: "proyecto cinco", description: "Descripción proyecto 5", owner: o1)
# p6 = Project.create!(name: "proyecto seis", description: "Descripción proyecto 6", owner: o1)
# p7 = Project.create!(name: "proyecto siete", description: "Descripción proyecto 7", owner: o1)
#
# #tasks
# Task.create!(name: "tarea 1 proyecto uno", description: "descripción tarea 1 p1", project: p1, user: u1)
# Task.create!(name: "tarea 2 proyecto uno", description: "descripción tarea 2 p1", project: p1, user: u2)
# Task.create!(name: "tarea 3 proyecto uno", description: "descripción tarea 3 p1", project: p1, user: u3)
# Task.create!(name: "tarea 4 proyecto uno", description: "descripción tarea 4 p1", project: p1, user: u4)




