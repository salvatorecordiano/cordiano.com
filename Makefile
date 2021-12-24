.PHONY: build serve bash

usage:
	@echo "Choose a right target to continue..."

JEKYLL_VERSION=3.8

build:
	docker run --rm \
  		-v `pwd`:/srv/jekyll \
		-v `pwd`/vendor/bundle:/usr/local/bundle \
		--env JEKYLL_ENV=production \
		--env TZ=Europe/Rome \
  		-it jekyll/jekyll:${JEKYLL_VERSION} \
  		jekyll build

serve:
	docker run --rm \
  		-v `pwd`:/srv/jekyll \
		-v `pwd`/vendor/bundle:/usr/local/bundle \
  		-it -p 4000:4000 \
		--name jekyll \
		--env JEKYLL_ENV=production \
        --env TZ=Europe/Rome \
  		jekyll/jekyll:${JEKYLL_VERSION} \
  		bundle exec jekyll serve -H 0.0.0.0

bash:
	docker run --rm \
  		-v `pwd`:/srv/jekyll \
		-v `pwd`/vendor/bundle:/usr/local/bundle \
		--name jekyll \
		--env TZ=Europe/Rome \
  		-it jekyll/jekyll:${JEKYLL_VERSION} \
  		bash
