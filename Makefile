# Versions and variables
NODE_BIN     = node_modules/.bin

# Executables
GULP         := $(NODE_BIN)/gulp

setup:
	npm install

dev:
	$(GULP)

build:
	$(GULP) build
