class User < ActiveRecord::Base
   has_many :actions_users
   has_many :actions, through: :actions_users
end