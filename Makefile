# Almost a generic Makefile to build the distributable css (dist/).  Also some
# helpful development setup with livereload and such to automate things. This
# Makefile is based on the https://github.com/jkenlooper/skin-makefile

STATIC_DIR := .

# Postcss json config files
postcssjson := $(shell find $(STATIC_DIR) -name 'postcss*.json')

# Top level sibling css files to each postcss json config file.
postcssjson_sibling_css_files := $(shell for f in $(postcssjson); do find $$(dirname $$f) -maxdepth 1 -name *.css; done)

# Only use postcss command if these assumptions are correct
postcss := $(if $(postcssjson_sibling_css_files), .postcss, )

all : $(postcss) .livereload
.PHONY : all

# Build the css if using postcss.  This makes the assumption that the
# postcss.json config file is next to top-level css files.  The top level css
# files have all their imported css files added as prerequisites for the
# .postcss target. Uses the csssources command to output a list of css file
# paths that are imported.  Using the npm config script setup to actually build
# the css.  See the package.json.
#
# A note on the package.json script `buildcss` to build css for the site as
# well as one for old ie:
# "buildcss": "postcss -c static/css/postcss.json"
# "postbuildcss": "mkdir -p dist/css/oldie && postcss -u oldie -u postcss-url -d dist/css/oldie/ dist/css/*.css"
.postcss : $(shell csssources $(postcssjson_sibling_css_files) 2> /dev/null)
	npm install;
	@touch .postcss;

.livereload : $(postcss) test/index.html
	touch .livereload;
