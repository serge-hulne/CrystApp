# Makefile

APP = App

init : # inits the installation of the required libs (shards)
	shards install

init_svelte :
	npm create vite@latest svelte --template svelte-ts
	cd svelte && npm install

dev : src/main.cr # dev
	RUCKSACK_MODE=0 DEBUG=true crystal build -Dpreview_mt ./src/main.cr

svelte_dev :
	cd svelte && npm run dev

svelte_build :
	cd svelte && npm run build

exe : src/main.cr # build exe (not entire app)
	RUCKSACK_MODE=1	DEBUG=true crystal build -Dpreview_mt ./src/main.cr
	cat .rucksack >>main

release : src/main.cr # build optimized exe
	RUCKSACK_MODE=2 DEBUG=false crystal build -Dpreview_mt --release ./src/main.cr
	cat .rucksack >>main

packing : src/main.cr # Tests if packaging asserts works
	mkdir -p tst
	cp ./rucksack ./tst/main
	./tst/rucksack

app : src/main.cr # build complete app
	cd svelte && npm run build
	RUCKSACK_MODE=2 DEBUG=true crystal build -Dpreview_mt --release ./src/main.cr
	cat .rucksack >>main
	mkdir -p ${APP}.app/Contents/MacOS
	cp main ${APP}.app/Contents/MacOS/${APP}
	open ${APP}.app/Contents/MacOS/${APP}

help : # Lists all available commands and summaries
	@grep '^[^#[:space:]].*:' Makefile

show : # Opens "Finder to run app from finder"
	open .

run : # Runs app
	open App.app

rundev : # Runs exe
	./main

format : # Format source code
	crystal tool format ./src

clean : # Remove latest build  
	clear
	rm -f main main.dwarf .rucksack .rucksack.toc shards.lock .DS_Store
	rm -rf App.app tst lib
	ls -LAF

clean_all : # Remove latest build and Svelte directory
	clear
	rm -f main main.dwarf .rucksack .rucksack.toc shards.lock .DS_Store
	rm -rf App.app tst svelte lib
	ls -lAF