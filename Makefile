# Versions and variables
HUGO_VERSION = 0.37
NODE_BIN     = node_modules/.bin
HUGO         = /usr/local/bin/hugo

# Executables
CONCURRENTLY := $(NODE_BIN)/concurrently
FIREBASE     := $(NODE_BIN)/firebase
GULP         := $(NODE_BIN)/gulp
WRITE_GOOD   := $(NODE_BIN)/write-good

# Firebase project names and URLs
PRODUCTION_PROJECT = streamlio-website
STAGING_PROJECT = streamlio-website-staging
SCRATCHPAD_PROJECT = streamlio-scratchpad
REDESIGN_PROJECT = streamlio-redesign
BLOG_PREVIEW_PROJECT = streamlio-blog-preview
PRODUCTION_URL = https://streaml.io
HOSTING_URL = https://$(PRODUCTION_PROJECT).firebaseapp.com
HOSTING_STAGING_URL = https://$(STAGING_PROJECT).firebaseapp.com
SCRATCHPAD_URL = https://$(SCRATCHPAD_PROJECT).firebaseapp.com
REDESIGN_URL = https://$(REDESIGN_PROJECT).firebaseapp.com
BLOG_PREVIEW_URL = https://$(BLOG_PREVIEW_URL).firebaseapp.com

macos-setup: install-assets
	brew install wget
	scripts/hugo-install.sh $(HUGO_VERSION) macOS
	scripts/htmltest-install.sh osx

linux-setup: install-assets
	scripts/hugo-install.sh $(HUGO_VERSION) Linux
	scripts/htmltest-install.sh linux

write-good:
	$(WRITE_GOOD) content/**/*.{md,mmark}

install-assets:
	yarn
	npm rebuild node-sass

build-staging: clean build-static-assets
	ENV=production $(HUGO) \
		--baseURL $(HOSTING_STAGING_URL) \
		--buildDrafts \
		--buildFuture

build-production: clean build-static-assets
	ENV=production $(HUGO) \
		--baseURL $(PRODUCTION_URL)

build-scratchpad: clean build-static-assets
	ENV=production $(HUGO) \
		--baseURL $(SCRATCHPAD_URL) \
		--buildDrafts \
		--buildFuture

build-redesign: clean build-static-assets
	ENV=production $(HUGO) \
		--baseURL $(REDESIGN_URL) \
		--buildDrafts \
		--buildFuture

build-local: clean build-static-assets
	ENV=production $(HUGO) \
		--baseURL "" \
		--buildDrafts \
		--buildFuture

build-static-assets:
	mkdir -p node_modules/node-sass/vendor
	$(GULP) build

.PHONY: dev
dev:
	$(CONCURRENTLY) "make serve" "make develop-static-assets"

develop-static-assets:
	$(GULP)

deploy-cloud-functions:
	$(FIREBASE) deploy \
		--only functions \
		--token $(FIREBASE_TOKEN) \
		--project $(PRODUCTION_PROJECT)

deploy-cloud-functions-staging:
	$(FIREBASE) deploy \
		--only functions \
		--token $(FIREBASE_TOKEN) \
		--project $(STAGING_PROJECT)

clean:
	rm -rf public
	rm -rf static/css/*

serve:
	ENV=development $(HUGO) serve \
		--baseURL "//localhost:1313" \
		--buildDrafts \
		--buildFuture \
		--ignoreCache

circleci-page-open:
	open https://circleci.com/gh/streamlio/website

deploy-blog-preview: clean build-staging

deploy-production: clean firebase-deploy-production

deploy-staging: clean firebase-deploy-staging

deploy-redesign: clean firebase-deploy-redesign

scratchpad: clean firebase-deploy-scratchpad

open:
	open $(HOSTING_URL)

open-staging:
	open $(HOSTING_STAGING_URL)

open-scratchpad:
	open $(SCRATCHPAD_URL)

htmltest-macos:
	~/bin/htmltest-osx

htmltest-linux:
	~/bin/htmltest-linux

test: build-production

test-macos: build-production htmltest-macos

firebase-login:
	$(FIREBASE) login

firebase-ci-login:
	$(FIREBASE) login:ci

firebase-deploy-production: build-production
	@$(FIREBASE) deploy \
		--only hosting \
		--token $(FIREBASE_TOKEN) \
		--project $(PRODUCTION_PROJECT)

firebase-deploy-staging: build-staging
	@$(FIREBASE) deploy \
		--only hosting \
		--token $(FIREBASE_TOKEN) \
		--project $(STAGING_PROJECT)

firebase-deploy-scratchpad: build-scratchpad
	@$(FIREBASE) deploy \
		--only hosting \
		--token $(FIREBASE_TOKEN) \
		--project $(SCRATCHPAD_PROJECT)

firebase-deploy-redesign: build-redesign
	echo @$(FIREBASE) deploy \
		--only hosting \
		--token $(FIREBASE_TOKEN) \
		--project $(REDESIGN_PROJECT)
	@$(FIREBASE) deploy \
		--only hosting \
		--token $(FIREBASE_TOKEN) \
		--project $(REDESIGN_PROJECT)

firebase-deploy-blog-preview: build-staging
	@$(FIREBASE) deploy \
		--only hosting \
		--token $(FIREBASE_TOKEN) \
		--project $(BLOG_PREVIEW_PROJECT)

install-hugo:
	scripts/hugo-install.sh $(HUGO_VERSION)

local-linux-env:
	vagrant up
	vagrant ssh -c 'sudo apt-get update && sudo apt-get install -f'
	vagrant ssh -c 'sudo apt-get install -y curl git && git clone https://$(USER):$(GH_TOKEN)@github.com/streamlio/website'
	vagrant ssh -c 'curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && sudo apt-get install -y nodejs'
	vagrant ssh -c 'sudo npm install npm --global'
	vagrant ssh -c 'echo "cd ~/website" >> ~/.bashrc'
	vagrant ssh
