TARGETS=contact.html index.html new-members.html people.html seminars.html software.html teaching.html publications.html

all: setup $(TARGETS)

# TODO: add scribble-lib as a package here, too
setup:
	raco pkg install --auto --skip-installed gregor

publications.html: publications.rkt templates/*.html shivers.bib
	if [ -f $@ ]; then chmod +w $@; fi
	racket -t $< > $@
	chmod -w $@

%.html: %.rkt templates/*.html
	if [ -f $@ ]; then chmod +w $@; fi
	racket -t $< > $@
	chmod -w $@

clean:
	rm -f $(TARGETS)
