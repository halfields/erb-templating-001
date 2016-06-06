require 'erb'
require 'pry'

class Movie
	attr_accessor :title, :release_date, :director, :summary

	@@movies = []

	def initialize(title, release_date, director, summary)
		@title = title
		@release_date = release_date
		@director = director
		@summary = summary
		@@movies << self
	end

	def url
		array = self.title.downcase.split(//).map do |char|
			if char == " "
				char = "_"
			elsif char == "'"
				char = ""
			else char = char
			end
		end
		str = array.join + ".html"
	end

	def self.all
		@@movies
	end

	def self.reset_movies!
		@@movies = []
	end

	def self.make_movies!
		movie = []
		f = File.new("spec/fixtures/movies.txt")
		loop do
			str = f.gets
			break if str == nil
			movie = str.split(" - ")
			Movie.new(movie[0], movie[1].to_i, movie[2], movie[3])
	    end
	end

	def self.recent
		recent_movies = []
	#	binding.pry
		@@movies.each do |movie|
			if movie.release_date >= 2012
				recent_movies << movie
	#			binding.pry
			end
		end
		recent_movies
	end


	


end