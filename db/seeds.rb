#User seeds
User.create(name: 'Jane')
User.create(name: 'Joe')
User.create(name: 'Liz')
User.create(name: 'Harry')
User.create(name: 'Osmundo')
User.create(name: 'Colm')
User.create(name: 'Harriet')

#Event seeds
Event.create(action: 'run', users: User.where(name: 'Jane'))
Event.create(action: 'walk', users: User.where(id: 3))
Event.create(action: 'swim', users: User.where(id: 1))