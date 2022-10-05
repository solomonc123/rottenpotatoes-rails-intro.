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

	def self.sortTitle(ratings_list)
		if ratings_list == nil or ratings_list.length() == 0
			return Movie.order(title: :asc)
		end
		return Movie.order(title: :asc)
	end

	def self.sortDate(ratings_list)
		if ratings_list == nil or ratings_list.length() == 0
			return Movie.order(release_date: :asc)
		end
		return Movie.order(release_date: :asc)
	end


end
