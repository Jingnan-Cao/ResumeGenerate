require_relative "generate"

if ARGV.size < 2
	puts "At least 2 projects"
	exit
end

template = "Resume.tex"

projects = []
new_file_name = ""
ARGV.each do |proj|
	projects.push(proj + ".tex")
	new_file_name += (proj + "_") 
end
new_file_name = new_file_name.chop
new_file_name += ".tex"

g = Generator.new(template, projects)
g.gen(new_file_name)
