

app.js: app.coffee
	coffee -bc app.coffee
	
.PHONY: all

all: app.js