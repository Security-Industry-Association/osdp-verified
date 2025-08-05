GROUP_050_CASES = \
  test-cases-050/test-050-group-header.md test-cases-050/test-050-01-01.md \
  test-cases-050/test-050-09-01.md test-cases-050/test-050-09-02.md \
  test-cases-050/test-050-09-14.md \
  test-cases-050/test-050-09-19.md
GROUP_060_CASES = \
  test-cases-060/test-060-group-header.md \
  test-cases-060/test-060-05-01.md \
  test-cases-060/test-060-11-01.md \
  test-cases-060/test-060-16-03.md \
  test-cases-060/test-060-19-01.md \
  test-cases-060/test-060-26-01.md
GROUP_070_CASES = \
  test-cases-070/test-070-group-header.md \
  test-cases-070/test-070-03-03.md \
  test-cases-070/test-070-05-12.md \
  test-cases-070/test-070-22-01.md
TEST_CASES_DOCSRC = ${GROUP_050_CASES} ${GROUP_060_CASES} ${GROUP_070_CASES}
PANDOCFLAGS=--toc --toc-depth=4

all:	combined.pdf sample.pdf

clean:
	rm -f *.pdf osdp-verified-test-cases.md sample.md

combined.pdf:	test-cases-frontspiece.md ${TEST_CASES_DOCSRC} test-cases-end.md
	cat >osdp-verified-test-cases.md \
	  test-cases-frontspiece.md \
	  ${TEST_CASES_DOCSRC} test-cases-end.md
	pandoc ${PANDOCFLAGS} -o osdp-verified-test-cases.pdf osdp-verified-test-cases.md

sample.pdf:	sample.md
	pandoc ${PANDOCFLAGS} -o sample.pdf sample.md

sample.md:	test-cases-frontspiece.md test-999-99-TEMPLATE.md test-cases-end.md
	cat >sample.md \
	  test-cases-frontspiece.md \
	  test-999-99-TEMPLATE.md test-cases-end.md

