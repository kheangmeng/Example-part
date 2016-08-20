class Movie < ApplicationRecord
RATINGS = %w(G PG PG-13 R NC-17)
	validates :title,:duration,:released_on, presence: true
	validates :description, length: { minimum: 10 }
	validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
	validates :image_file_name, allow_blank: true, format: {
  	with:    /\w+.(gif|jpg|png|jpeg)\z/i,
  	message: "must reference a GIF, JPG, or PNG,JPEG image"
		}
	validates :rating, inclusion: { in: RATINGS }

	#:title:description,:rating,:total_gross,:duration,:released_on ,:director,:cast,:image_file_name,
	def flop?
		total_gross.blank? || total_gross > 200000
	end
	def self.upcomming
		where("released_on >= ?", Time.now).order("released_on")
	end
end
