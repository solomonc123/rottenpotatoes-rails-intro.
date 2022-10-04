class Movie < ActiveRecord::Base
	def self.all_ratings()
		return Movie.uniq.pluck(:rating)
	end

	def self.with_ratings(ratings_list)
		if ratings_list == nil or ratings_list.length() == 0
			return Movie.all
		end
		return Movie.where(rating:ratings_list)
	end

	def self.sortTitle()

end
