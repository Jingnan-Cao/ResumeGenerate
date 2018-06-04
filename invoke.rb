require_relative "generate"

template = "Resume.tex"
projects = ["3D.tex", "depixelizing.tex", "RtreeDB.tex"]
new_file_name = "Resume_3D_depixelizing_RtreeDB.tex"

g = Generator.new(template, projects)
g.gen(new_file_name)
