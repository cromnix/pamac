
MSGLANGS=$(notdir $(wildcard *.po))

MSGOBJS=$(addprefix locale/,$(MSGLANGS:.po=/LC_MESSAGES/pamac.mo))

gettext: ../data/polkit/org.pamac.policy.in $(MSGOBJS)
	itstool -j ../data/polkit/org.pamac.policy.in -o ../data/polkit/org.pamac.policy $(MSGLANGS:.po=.mo)

clean:
	rm -rf locale
	rm -f *.mo

locale/%/LC_MESSAGES/pamac.mo: %.po
	msgfmt -c -o $*.mo $*.po
	mkdir -p $(dir $@)
	cp $*.mo $(dir $@)pamac.mo
