module MoviesHelper
	def money_format(movie)
		if movie.flop?
			content_tag(:strong, "flop!!!")
		else
			number_to_currency(movie.total_gross)
		end
	end


	def image_for(movie)
		if movie.image_file_name.blank?
			image_tag("index.jpg")
		else
			image_tag(movie.image_file_name)
		end
	end

end
