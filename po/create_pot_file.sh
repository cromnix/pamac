#! /bin/sh

xgettext --from-code=UTF-8 --add-location=file \
	--package-name=Pamac --msgid-bugs-address=cromer@cromnix.org \
	--files-from=files_to_translate --keyword=translatable --output=pamac.pot
