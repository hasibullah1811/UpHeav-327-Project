# upheav_src

A new Flutter project.

# Getting Started

## Install Flutter on Windows

### Get the Flutter SDK
* Download the following installation bundle to get the latest stable release of the Flutter SDK:
[flutter_windows_1.22.5-stable.zip](https://storage.googleapis.com/flutter_infra/releases/stable/windows/flutter_windows_1.22.5-stable.zip)
For other release channels, and older builds, see the SDK releases page.
* Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK (for example, C:\src\flutter).

Clone from github repo
======
If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the Flutter repo on GitHub, and change branches or tags as needed. For example:

```
C:\src>git clone https://github.com/flutter/flutter.git -b stable
```
You are now ready to run Flutter commands in the Flutter Console.

Android Setup
======
### Install Android Studio
1. Download and install [Android Studio.](https://developer.android.com/studio)
2. Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.

### Setup your android device
1. To prepare to run and test your Flutter app on an Android device, you need an Android device running Android 4.1 (API level 16) or higher.
2. Enable Developer options and USB debugging on your device. Detailed instructions are available in the Android documentation.
3. Windows-only: Install the Google USB Driver.
4. Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.
5. In the terminal, run the `flutter devices` command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your adb tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the ANDROID_SDK_ROOT environment variable to that installation directory.

## For more details please visit
* [Windows Install](https://flutter.dev/docs/get-started/install/windows)

## Install Flutter on MacOS

### Get the Flutter SDK
* Download the following installation bundle to get the latest stable release of the Flutter SDK:
[flutter_macos_1.22.5-stable.zip](https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_1.22.5-stable.zip)
For other release channels, and older builds, see the SDK releases page.
* Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK 
```
cd ~/development
unzip ~/Downloads/flutter_macos_1.22.5-stable.zip

```
* Add flutter to your path
```
export PATH="$PATH:`pwd`/flutter/bin"
```
This command sets your PATH variable for the current terminal window only. To permanently add Flutter to your path, see Update your path.

You are now ready to run Flutter commands!

Clone from github repo
======
If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the Flutter repo on GitHub, and change branches or tags as needed. For example:

```
git clone https://github.com/flutter/flutter.git -b stable
```
You are now ready to run Flutter commands in the Flutter Console.

iOS setup
======
### Install Xcode
To develop Flutter apps for iOS, you need a Mac with Xcode installed.
1. Install the latest stable version of Xcode (using [web download](https://developer.apple.com/xcode/) or the [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835)).
2.Configure the Xcode command-line tools to use the newly-installed version of Xcode by running the following from the command line:
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```
This is the correct path for most cases, when you want to use the latest version of Xcode. If you need to use a different version, specify that path instead.
3. Make sure the Xcode license agreement is signed by either opening Xcode once and confirming or running `sudo xcodebuild -license` from the command line.

## For details Please visit
* [Flutter on MacOs](https://flutter.dev/docs/get-started/install/macos)

# How to run this project
* Clone this project
1. Open Visual Studio Code terminal
2. Write the Git clone command. For example,
```
git clone https://github.com/hasibullah1811/UpHeav-327-Project.git
```
3. Open the folder you have just cloned

4. To launch the app in the Simulator or a real device, ensure that the Simulator is running or the real device is connected and enter:
```
flutter run
```
It should run the program on the connected device.


For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
