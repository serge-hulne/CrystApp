# Makefile


APP = App
STATIC = webroot

dev : src/rucksack.cr 
	RUCKSACK_MODE=0 crystal build -Dpreview_mt ./src/rucksack.cr

exe : src/rucksack.cr 
	RUCKSACK_MODE=1	 crystal build -Dpreview_mt ./src/rucksack.cr
	cat .rucksack >>rucksack

release : src/rucksack.cr
	RUCKSACK_MODE=2 crystal build -Dpreview_mt --release ./src/rucksack.cr
	cat .rucksack >>rucksack

test : src/rucksack.cr
	mkdir -p tst
	cp ./rucksack ./tst/rucksack
	./tst/rucksack

app:
	RUCKSACK_MODE=2 crystal build -Dpreview_mt --release ./src/rucksack.cr
	cat .rucksack >>rucksack
	mkdir -p ${APP}.app/Contents/MacOS
	cp rucksack ${APP}.app/Contents/MacOS/${APP}
	open ${APP}.app/Contents/MacOS/${APP}
