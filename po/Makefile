
MSGLANGS=$(notdir $(wildcard *.po))

MSGOBJS=$(addprefix locale/,$(MSGLANGS:.po=/LC_MESSAGES/pamac.mo))

gettext: ../data/polkit/org.pamac.policy.in $(MSGOBJS)
	msgfmt --xml --template ../data/polkit/org.pamac.policy.in -d ./ -o ../data/polkit/org.pamac.policy

clean:
	rm -rf locale
	rm -f *.mo

locale/%/LC_MESSAGES/pamac.mo: %.po
	msgfmt -c -o $*.mo $*.po
	mkdir -p $(dir $@)
	cp $*.mo $(dir $@)pamac.mo
