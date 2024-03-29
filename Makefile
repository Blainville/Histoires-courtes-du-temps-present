include_dir=build
source=histoires-courtes.md
title='Histoires courtes du temps present'
filename='histoires-courtes-du-temps-present'

all: html

html:
	pandoc -s $(source) -t html -o index.html -c style.css \
			--include-in-header $(include_dir)/head.html \
			--include-before-body $(include_dir)/author.html \
			--include-before-body $(include_dir)/share.html \
			--include-after-body $(include_dir)/stats.html \
			--title-prefix $(title) \
			--normalize \
			--smart \
			--toc

epub:
	pandoc -s $(source) --normalize --smart -t epub -o $(filename).epub \
			--epub-metadata $(include_dir)/metadata.xml \
			--title-prefix $(title) \
			--normalize \
			--smart \
			--toc
