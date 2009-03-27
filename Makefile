
ADPCM_SRC = \
	AdpcmMediaStreamSource/AdpcmMediaStreamSource.cs \
	AdpcmMediaStreamSource/WaveFormatExtensible.cs \
	AdpcmMediaStreamSource/StringExtensions.cs

ADPCM_TEST_SRC = \
	AdpcmMediaStreamSourceTest/App.xaml \
	AdpcmMediaStreamSourceTest/App.xaml.cs \
	AdpcmMediaStreamSourceTest/Page.xaml \
	AdpcmMediaStreamSourceTest/Page.xaml.cs

all: build/AdpcmMediaStreamSourceTest.xap

build/AdpcmMediaStreamSourceTest.xap: build/AdpcmMediaStreamSource.dll $(MOON_VORBIS_TEST_SRC)
	cp AdpcmMediaStreamSourceTest/*.xaml build
	cp AdpcmMediaStreamSourceTest/*.xaml.cs build
	cp AdpcmMediaStreamSourceTestProperties/AppManifest.xml build/AppManifest.xaml
	cd build; mxap --application-name=AdpcmMediaStreamSourceTest; cd ..

build/AdpcmMediaStreamSource.dll: $(MOON_VORBIS_SRC)
	smcs -t:library -out:AdpcmMediaStreamSource.dll -debug $(MOON_VORBIS_SRC)
	mv AdpcmMediaStreamSource.dll build
	mv AdpcmMediaStreamSource.dll.mdb build
