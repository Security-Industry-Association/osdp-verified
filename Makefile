PUBLISHED=osdp-verified-test-descriptions.pdf

all:
	(cd test-descriptions; cat `ls -1 *md` >/tmp/combined.md; pandoc --toc -o ../${PUBLISHED} /tmp/combined.md )

clean:
	rm -f ${PUBLISHED} /tmp/combined.md


