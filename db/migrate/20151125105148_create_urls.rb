class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |a|
			a.string :short_url
			a.string :long_url
			a.integer :counter, default: 0
  		a.timestamps null: false #SET UP DATE
		end
	end
end