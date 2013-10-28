import fnmatch
import os
from mako.template import Template
from mako.lookup import TemplateLookup

shaderlookup = TemplateLookup(directories=['templates'])

matches = []
for root, dirnames, filenames in os.walk('templates/single'):
	for filename in fnmatch.filter(filenames, '*.glsl'):
		name = os.path.join(root, filename)
		matches.append(name)
		temp = Template(filename=name, lookup=shaderlookup)

		with open("shaders/%s" % filename, "w") as shader_text:
			shader_text.write(temp.render())

		print name
		

