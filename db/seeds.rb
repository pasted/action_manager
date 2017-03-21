#User seeds
User.create(name: 'Jane')
User.create(name: 'Joe')
User.create(name: 'Liz')

#Event seeds
Event.create(action: 'run', users: User.where(id: 1))
Event.create(action: 'walk', users: User.where(id: 3))
Event.create(action: 'swim', users: User.where(id: 1))