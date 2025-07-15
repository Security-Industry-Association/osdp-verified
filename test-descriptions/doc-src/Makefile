TEST_CASES_DOCSRC = \
        test-cases-050/test-050-group-header.md \
	test-cases-050/test-050-01-01.md \
	test-cases-050/test-050-09-01.md \
        test-cases-060/test-060-group-header.md \
        test-cases-060/test-060-16-03.md \
        test-cases-070/test-070-group-header.md \
        test-cases-070/test-070-22-01.md
PANDOCFLAGS=--toc --toc-depth=4

all:	combined.pdf

clean:
	rm -f *.pdf osdp-verified-test-cases.md sample.md

combined.pdf:	test-cases-frontspiece.md ${TEST_CASES_DOCSRC} test-cases-end.md
	cat >sample.md \
	  test-cases-frontspiece.md \
	  test-999-99-TEMPLATE.md test-cases-end.md
	pandoc ${PANDOCFLAGS} -o sample.pdf sample.md
	cat >osdp-verified-test-cases.md \
	  test-cases-frontspiece.md \
	  ${TEST_CASES_DOCSRC} test-cases-end.md
	pandoc ${PANDOCFLAGS} -o osdp-verified-test-cases.pdf osdp-verified-test-cases.md

