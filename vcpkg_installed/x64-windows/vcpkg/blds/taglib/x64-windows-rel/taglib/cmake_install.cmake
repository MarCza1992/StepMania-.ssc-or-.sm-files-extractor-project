# Install script for directory: C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/pkgs/taglib_x64-windows")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "OFF")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib/tag.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib/tag.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/taglib" TYPE FILE FILES
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/tag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/fileref.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/audioproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/taglib_export.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/taglib.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tstring.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tlist.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tlist.tcc"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tstringlist.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tbytevector.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tbytevectorlist.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tvariant.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tbytevectorstream.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tiostream.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tfilestream.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tmap.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tmap.tcc"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tpicturetype.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tpropertymap.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tdebuglistener.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/toolkit/tversionnumber.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/mpegfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/mpegproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/mpegheader.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/xingheader.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v1/id3v1tag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v1/id3v1genres.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2extendedheader.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2frame.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2header.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2synchdata.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2footer.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2framefactory.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/id3v2tag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/attachedpictureframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/commentsframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/eventtimingcodesframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/generalencapsulatedobjectframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/ownershipframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/popularimeterframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/privateframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/relativevolumeframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/synchronizedlyricsframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/textidentificationframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/uniquefileidentifierframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/unknownframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/unsynchronizedlyricsframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/urllinkframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/chapterframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/tableofcontentsframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpeg/id3v2/frames/podcastframe.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/oggfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/oggpage.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/oggpageheader.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/xiphcomment.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/vorbis/vorbisfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/vorbis/vorbisproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/flac/oggflacfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/speex/speexfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/speex/speexproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/opus/opusfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ogg/opus/opusproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/flac/flacfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/flac/flacpicture.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/flac/flacproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/flac/flacmetadatablock.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ape/apefile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ape/apeproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ape/apetag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ape/apefooter.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/ape/apeitem.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpc/mpcfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mpc/mpcproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/wavpack/wavpackfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/wavpack/wavpackproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/trueaudio/trueaudiofile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/trueaudio/trueaudioproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/riff/rifffile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/riff/aiff/aifffile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/riff/aiff/aiffproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/riff/wav/wavfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/riff/wav/wavproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/riff/wav/infotag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/asf/asffile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/asf/asfproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/asf/asftag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/asf/asfattribute.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/asf/asfpicture.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4file.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4atom.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4tag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4item.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4properties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4coverart.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mp4/mp4itemfactory.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mod/modfilebase.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mod/modfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mod/modtag.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/mod/modproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/it/itfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/it/itproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/s3m/s3mfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/s3m/s3mproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/xm/xmfile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/xm/xmproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/dsf/dsffile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/dsf/dsfproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/dsdiff/dsdifffile.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/dsdiff/dsdiffproperties.h"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/src/v2.0-2fb6cacda4.clean/taglib/dsdiff/dsdiffdiintag.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib/taglib-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib/taglib-targets.cmake"
         "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib/CMakeFiles/Export/398eef5e047a0959864f2888198961bf/taglib-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib/taglib-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib/taglib-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib" TYPE FILE FILES "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib/CMakeFiles/Export/398eef5e047a0959864f2888198961bf/taglib-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib" TYPE FILE FILES "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib/CMakeFiles/Export/398eef5e047a0959864f2888198961bf/taglib-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/taglib" TYPE FILE FILES
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib-config.cmake"
    "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib-config-version.cmake"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Dev/nauka praktyczna/Wyciąganie info z .ssc/vcpkg_installed/x64-windows/vcpkg/blds/taglib/x64-windows-rel/taglib/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
