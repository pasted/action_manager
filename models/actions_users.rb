class ActionsUsers < ActiveRecord::Base
   belongs_to :action
   belongs_to :user
end