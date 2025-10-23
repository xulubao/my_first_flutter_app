# Complete Guide to Running Flutter with Minimal Android Setup

## Prerequisites

### 1. Flutter SDK Installation
- Download Flutter SDK from official website
- Extract to preferred directory (e.g., `C:\src\flutter`)
- Add `flutter\bin` to system PATH environment variable
- Verify installation with `flutter doctor`

### 2. Minimal Android Components
Instead of full Android Studio, install only required components:

#### Android Command-line Tools
- Download "Command line tools only" from Android developer website
- Extract to desired location (e.g., `C:\android\sdk`)

#### Essential SDK Packages
Using `sdkmanager`, install required components:
```bash
sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"
sdkmanager "emulator"
sdkmanager "system-images;android-30;google_apis;x86_64"
```

#### Environment Variables
Set these environment variables:
- `ANDROID_SDK_ROOT` = path to your SDK directory
- `ANDROID_HOME` = same as `ANDROID_SDK_ROOT` (for compatibility)

### 3. Visual Studio Code Setup
- Install VS Code from official website
- Install Flutter extension (automatically includes Dart extension)
- Configure Flutter SDK path in VS Code settings

## Android Emulator Setup

### Create Virtual Device
```bash
avdmanager create avd -n MyFlutterEmulator -k "system-images;android-30;google_apis;x86_64"
```

### Launch Emulator
```bash
emulator -avd MyFlutterEmulator
```

## Development Workflow

### Project Creation
```bash
flutter create my_app
cd my_app
```

### Running Applications
1. Start emulator manually or connect physical device
2. In VS Code, press `F5` to start debugging
3. Or use terminal command: `flutter run`

### Key VS Code Features for Flutter
- **Hot Reload**: `Ctrl+F5` - Instantly apply code changes
- **Hot Restart**: `Ctrl+Shift+F5` - Restart app with updated code
- **Debug Console**: Real-time logging and error monitoring
- **Flutter Inspector**: Visual widget tree inspection

### Essential Keyboard Shortcuts
| Shortcut | Action |
|----------|--------|
| `F5` | Start debugging |
| `Ctrl+F5` | Run without debugging |
| `Ctrl+\` | Hot reload |
| `Ctrl+Shift+\` | Hot restart |
| `Ctrl+Shift+P` | Open command palette |

## Verification and Troubleshooting

### Check Installation Status
Run `flutter doctor` to verify all components are properly configured.

### Common Issues and Solutions
- **Device not detected**: Ensure `adb` is in PATH and run `adb devices`
- **Emulator won't start**: Check HAXM installation for Intel processors
- **Missing licenses**: Run `flutter doctor --android-licenses` to accept

This minimal setup provides full Flutter development capabilities while consuming fewer system resources than a complete Android Studio installation.