class Generator

	def initialize(template_name, projects)
		@src_path = 'Latex-Resume/'
		@projects_path = 'projects/'
		@template_name = template_name
		@projects = projects
	end

	def gen(new_file_name)
		resume = File.new("Generated-Resume/"+ new_file_name, "w")
		template = File.new(@src_path+@template_name, "r")
		if not resume or not template
			puts "Error"
			return
		end
		while line = template.gets
			if line.include? "begin{rSection}{PROJECTS}"
				puts "find section"
				resume.puts line
				line = template.gets
				resume.puts line
				@projects.each do |project|
					File.open(@src_path + @projects_path + project) do |proj|
						proj.each_line {|line| resume.puts line}
					end
					resume.puts "%------------------------------------"
				end
				while not line.include? "end{rSection}" 
					line = template.gets
				end
			end
			resume.puts line
		end
	end

end


#for project in ARGV
#	projects += project

