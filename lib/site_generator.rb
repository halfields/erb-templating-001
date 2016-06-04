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
		Movie.all.each do |movie|
			f = File.new("_site/movies/#{movie.title}.html", 'w')
			f.write("<!DOCTYPE html>
<html>
  <head>
    <title>#{movie.title}</title>
  </head>
  <body>
    <h1>#{movie.title}</h1>
    <h3>Release Date: #{movie.release_date}</h3>
    <h4><em>Director: #{movie.director}</em></h4>
    <p>#{movie.summary}</p>
    <br />
    <h2>Other Movies</h2>
    <ul>")
			f.puts
			Movie.all.each {|movie| f.puts("      <li><a href=\"#{movie}.html\">#{movie.title}</a></li>")}
			f.write("    </ul>
  </body>
</html>")
		f.close
		end
	end
end