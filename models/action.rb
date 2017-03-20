class Action < Sequel::Model
   has_many :actions_users
   has_many :users, through: :actions_users
end