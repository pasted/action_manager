#User seeds
User.create(name: 'Jane')
User.create(name: 'Joe')
User.create(name: 'Liz')

#Event seeds
Event.create(action: 'Deliver', users: User.where(id: 1))
Event.create(action: 'Restock')