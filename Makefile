SOURCE="https://download-cf.jetbrains.com/webide/PhpStorm-2020.2.1.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="PhpStorm.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  $(SOURCE)

	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r PhpStorm-*/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf PhpStorm-202.6397.115
	rm -f $(DESTINATION)
	rm -rf AppDir/opt
