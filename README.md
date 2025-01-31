<h1 align="center">
  <img src="https://github.com/JGeek00/droid-hole/raw/master/assets/other/banner.png" />
</h1>

<h5 align="center">
  <b>
    DroidHole is an unnoficial
    <a href="https://pi-hole.net/" target="_blank" rel="noopener noreferrer">
      Pi-hole®
    </a> 
    client developed with Flutter.</b>
</h5>

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=com.jgeek00.droid_hole" target="_blank" rel="noopener noreferrer">
    <img src="/assets/other/get_google_play.png" width="300px">
  </a>
  <a href="https://github.com/JGeek00/droid-hole/releases" target="_blank" rel="noopener noreferrer">
    <img src="/assets/other/get-github.png" width="300px">
  </a>
</p>

## Main features
<p>▶ Manage your Pi-hole® server on an easy way.</p>
<p>▶ Enable and disable the server with only one button.</p>
<p>▶ Beautiful charts with all the statistics you need to see.</p>
<p>▶ Add multiple servers to the app, and manage all of them from here.</p>
<p>▶ Explore the query logs list and see the log details.</p>
<p>▶ Manage your domain lists. Add and remove domains to the whitelist or blacklist.</p>
<p>▶ Material You interface with dynamic theming (only Android 12+)</p>
<p>Requires Android 8.0+</p>

## Privacy policy
Check the privacy policy [here](https://github.com/JGeek00/droid-hole/wiki/Privacy-policy).

## Disclaimer
This is an unofficial application. The Pi-hole team and the development of the Pi-hole software is not related in any way with this application.

## Recommended lists
On [this repository](https://github.com/JuanRodenas/Pihole_list) you can find some recommended lists. Thanks to [JuanRodenas](https://github.com/JuanRodenas).


## Prepare the development environment
1. Clone the repository
2. Run ``flutter pub get``
3. Clone the ``.env.sample`` file and name it ``.env``
4. On the ``SENTRY_DSN`` variable assign it's value
5. Inside the ``android`` folder, clone the ``key.properties.sample`` file and name it ``key.properties``
6. Open the file and fill the variables with the corresponding values
7. Store your ``keystore.jks`` file inside ``android/app``


## Compile the production build
##### Android
1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build apk --release`` to build the .apk file
4. Run ``flutter build appbundle --release`` to build the .aab file

##### macOS
1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build macos --release`` to build the .app file

##### Linux
1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build linux --release`` to build the Linux executable
4. If you want to build also the .deb file do this:
  4.1. Run ``dart pub global activate flutter_to_debian`` to install the utility that will build the .deb file
  4.2. Run ``flutter_to_debian``

##### Windows
1. Run ``flutter clean``
2. Run ``flutter pub get``
3. Run ``flutter build windows --release`` to build the Windows executable
4. Install the [InnoSetup](https://jrsoftware.org/isdl.php) software you don't have it
5. Run ``iscc /Q windows/innosetup_installer_builder.iss`` to generate the Windows installer

## Third party libraries
- [provider](https://pub.dev/packages/provider)
- [sqflite](https://pub.dev/packages/sqflite)
- [http](https://pub.dev/packages/http)
- [expandable](https://pub.dev/packages/expandable)
- [flutter web browser](https://pub.dev/packages/flutter_web_browser)
- [package info plus](https://pub.dev/packages/package_info_plus)
- [flutter phoenix](https://pub.dev/packages/flutter_phoenix)
- [flutter displaymode](https://pub.dev/packages/flutter_displaymode)
- [qr code scanner](https://pub.dev/packages/qr_code_scanner)
- [flutter launcher icons](https://pub.dev/packages/flutter_launcher_icons)
- [flutter native splash](https://pub.dev/packages/flutter_native_splash)
- [intl](https://pub.dev/packages/intl)
- [charts flutter](https://pub.dev/packages/charts_flutter)
- [html](https://pub.dev/packages/html)
- [pie chart](https://pub.dev/packages/pie_chart)
- [flutter svg](https://pub.dev/packages/flutter_svg)
- [fl chart](https://pub.dev/packages/fl_chart)
- [animations](https://pub.dev/packages/animations)
- [qr code scanner](https://pub.dev/packages/qr_code_scanner)
- [permission handler](https://pub.dev/packages/permission_handler)
- [dynamic color](https://pub.dev/packages/dynamic_color)
- [device info](https://pub.dev/packages/device_info)
- [vibration](https://pub.dev/packages/vibration)
- [url launcher](https://pub.dev/packages/url_launcher)
- [percent indicator](https://pub.dev/packages/percent_indicator)
- [flutter app lock](https://pub.dev/packages/flutter_app_lock)
- [sqlite3 flutter libs](https://pub.dev/packages/sqlite3_flutter_libs)
- [sqflite common ffi](https://pub.dev/packages/sqflite_common_ffi)
- [sentry flutter](https://pub.dev/packages/sentry_flutter)
- [flutter dotenv](https://pub.dev/packages/flutter_dotenv)
- [contextmenu](https://pub.dev/packages/contextmenu)
- [window size](https://github.com/google/flutter-desktop-embedding)
- [flutter split view](https://github.com/TerminalStudio/flutter_split_view)
- [local auth](https://pub.dev/packages/local_auth)

<br>

##### Created by JGeek00
