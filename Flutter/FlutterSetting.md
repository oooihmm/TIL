# Flutter Setting
</br>

## Download Flutter
- First, download the Flutter SDK for macOS from the official website: https://flutter.dev/docs/get-started/install/macos
- Extract the downloaded zip file to a location on your system.
```bash
cd ~/<folder name>
unzip ~/Downloads/flutter_macos_3.7.10-stable.zip

```
- Next, add the Flutter SDK to your system path by opening the terminal and running the following command:
``` bash
export PATH="$PATH:/Users/<your-user-name>/flutter/bin"
export PATH="/Users/<your-user-name>/flutter/bin:$PATH"

```
- To verify that Flutter is properly installed, run the following command:
``` bash
flutter doctor
```
- Install the Dart SDK by downloading the latest version from https://dart.dev/get-dart
- Open VSCode and install the Flutter and Dart plugins from the Extensions tab.
</br>
</br> 
</br>
## Create Project
- Create a new Flutter project by running the following command in the terminal:
``` bash
flutter create <project name>
```
- Select Device by running the following command in Command Palette:
```
Flutter: Select Device
```
- run the following command:
``` bash
flutter run
```