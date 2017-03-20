class CreateEventUsers < ActiveRecord::Migration[5.0]
  def change
  	  create_table :event_users do |t|
  	  	 t.integer :user_id
  	  	 t.integer :event_id
  	  	 t.timestamps null: false
  	  end
  end
end
