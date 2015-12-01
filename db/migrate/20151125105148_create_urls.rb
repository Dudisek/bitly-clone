class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |a|
			a.string :short_url
			a.string :long_url
			a.integer :counter, :default => 0
  		a.timestamps null: false #SET UP DATE
		end
	end
end


	# INSERT INTO films (code, title, did, date_prod, kind) VALUES
 #    ('B6717', 'Tampopo', 110, '1985-02-10', 'Comedy'),
 #    ('HG120', 'The Dinner Game', 140, DEFAULT, 'Comedy');