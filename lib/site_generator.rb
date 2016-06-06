require 'pry'

class SiteGenerator



	def make_index!
		f = File.new('_site/index.html', 'w')
		f.puts('<!DOCTYPE html>')
		f.puts('<html>')
		f.puts('  <head>')
		f.puts('    <title>Movies</title>')
		f.puts('  </head>')
		f.puts('  <body>')
		f.puts('    <ul>')
		Movie.all.each do |movie|
			f.puts("      <li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>")
		end
		f.puts('    </ul>')
		f.puts('  </body>')
		f.puts('</html>')
		f.close		
	end

	def generate_pages!
		template = ERB.new(File.read("lib/templates/movie.html.erb"))		
		Movie.all.each do |movie|
			f = File.new("_site/movies/#{movie.url}", 'w')
			f.write(template.result(binding))
		#	binding.pry
			f.close
		end
	end
end