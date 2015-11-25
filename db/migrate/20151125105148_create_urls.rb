class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |a|
			a.string :short_url
			a.string :long_url
		end
	end
end