default: build

h help:
	@grep '^[a-z]' Makefile

.PHONY: build serve bash pre-deploy

JEKYLL_VERSION=3.8

b build:
	docker run --rm \
  		-v `pwd`/cordiano.com/:/srv/jekyll \
		-v `pwd`/vendor/bundle:/usr/local/bundle \
		--env JEKYLL_ENV=production \
		--env TZ=Europe/Rome \
  		-it jekyll/jekyll:${JEKYLL_VERSION} \
  		jekyll build

s serve:
	docker run --rm \
  		-v `pwd`/cordiano.com/:/srv/jekyll \
		-v `pwd`/vendor/bundle:/usr/local/bundle \
  		-it -p 4000:4000 -p 35729:35729 \
		--name jekyll \
		--env JEKYLL_ENV=production \
        --env TZ=Europe/Rome \
  		jekyll/jekyll:${JEKYLL_VERSION} \
  		bundle exec jekyll serve -H 0.0.0.0 --trace --livereload

bash:
	docker run --rm \
  		-v `pwd`/cordiano.com/:/srv/jekyll \
		-v `pwd`/vendor/bundle:/usr/local/bundle \
		--name jekyll \
		--env TZ=Europe/Rome \
  		-it jekyll/jekyll:${JEKYLL_VERSION} \
  		bash

pre-deploy:
	mv cordiano.com/Gemfile .
	rm cordiano.com/Gemfile.lock
