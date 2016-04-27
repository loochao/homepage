

build:
	jekyll build --incremental

publish: build
	rsync --recursive --copy-links --verbose --update --delete --delete-after --delete-excluded --exclude-from=rsync-exclude.txt _site/ /Volumes/nrougier/

clean:
	@rm -rf _site
	@-rm -f `find . -name "*~"`



