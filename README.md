# OneNotePan

An AutoHotkey v2 script that enables intuitive pan/scroll functionality in OneNote using your mouse buttons.

## 🎯 Features

- **Middle Mouse Button Panning**: Hold the middle mouse button to pan around your OneNote pages
- **XButton1 Support**: Alternative panning with the extra mouse button (XButton1)
- **Smart Detection**: Only activates when your mouse cursor is actually over a OneNote window
- **Seamless Integration**: Automatically switches between pan tool and default mouse tool

## 📋 Requirements

- [AutoHotkey v2.0](https://www.autohotkey.com/) or later
- Microsoft OneNote (Desktop version)
- A mouse with a middle button or extra buttons (XButton1)

## 🚀 Installation

1. Download and install [AutoHotkey v2.0](https://www.autohotkey.com/)
2. Download `OneNotePan.ahk` from this repository
3. **Configure OneNote Shortcuts** (Important):
   - Open OneNote
   - Go to File → Options → Customize Ribbon → Keyboard Shortcuts (or use the "Customize..." button)
   - Bind **Alt + 1** to the **Pan Tool**
   - Bind **Alt + 2** to the **Selection Tool** (default mouse)
   - Click "Assign" for each binding and save
4. Double-click the script to run it
5. (Optional) Add the script to your Windows startup folder to run automatically:
   - Press `Win + R`, type `shell:startup`, and press Enter
   - Create a shortcut to `OneNotePan.ahk` in the startup folder

## 💡 Usage

Once the script is running:

1. Open OneNote
2. **Middle Mouse Button**: Hold down the middle mouse button (scroll wheel) to activate pan mode and drag your page around
3. **XButton1**: Alternatively, use your mouse's extra button (typically the back button) to pan
4. Release the button to return to normal mouse operation

The script automatically:
- Activates pan tool (Alt+1) when you press the designated button
- Simulates left-click drag for smooth panning
- Returns to default tool (Alt+2) when you release the button
- Only works when your cursor is over a OneNote window

## 🔧 How It Works

The script uses AutoHotkey's hotkey system to:
1. Detect when OneNote is active and the mouse is over it
2. Intercept middle mouse button and XButton1 presses
3. Send keyboard shortcuts to switch between OneNote's pan tool (Alt+1) and default tool (Alt+2)
4. Simulate mouse clicks to enable smooth panning behavior
5. Use a focus-stealing trick to ensure proper tool switching

## 🛠️ Customization

You can modify the script to:
- Change which mouse buttons trigger panning (edit `*MButton` or `*XButton1`)
- Adjust the sleep duration for stability (default: 10ms)
- Modify OneNote tool shortcuts if you've customized them

## 📝 Notes

- The script specifically targets `ONENOTE.EXE` (OneNote Desktop)
- It will not interfere with other applications
- The `MouseIsOverOneNote()` function ensures panning only activates when your cursor is over OneNote

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests

## 📄 License

This project is open source and available under the MIT License.

## 👤 Author

Created by [bigorados-bigo](https://github.com/bigorados-bigo)

## ⭐ Support

If you find this script useful, please consider giving it a star on GitHub!
