class Movie < ActiveRecord::Base
	def self.all_ratings()
		return Movies.uniq.pluck(:rating)
	end

	def self.with_ratings(ratings_list)
	# 	if ratings_list.length() == 0
	# 		return
	# 	end

	# 	where("rating = '#{ratings_list[0]}'")
	# # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
	# #  movies with those ratings
	# # if ratings_list is nil, retrieve ALL movies
	end

end
