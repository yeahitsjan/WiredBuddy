## Wired Buddy :ghost:

A small, friendly buddy living on the macOS menu bar, showing the current state of an active ethernet interface.

![active](https://raw.githubusercontent.com/yeahitsjan/WiredBuddy/develop/.github/active.png) ![inactive](https://raw.githubusercontent.com/yeahitsjan/WiredBuddy/develop/.github/inactive.png)

### *Installation*

> Compatible with macOS 13 or later due to use of MenuBarExtra

The application is currently not ready for production usage, but works just fine feature-wise. To see if you can help extend the functionality and bring Wired Buddy to a v1.0, see Roadmap below.

```sh
$ git clone https://github.com/yeahitsjan/WiredBuddy.git
```

Open up ``Wired Buddy.xcodeproj`` in Xcode and hit build!

*With a future v1.0 the app will be downloadable via GitHub releases.*

### Roadmap

Wired Buddy's main features (displaying the active state of an ethernet connection) are already functionality. Still there is something to do before releasing a stable v1.0:

- [ ] a proper AppIcon (there is currently none)
- [ ] the AppIcon as a buddy itself
- [ ] Hide the AppIcon whilst running the app as well as the menubar
- [ ] Welcome screen on first launch
- [ ] Shortcuts / Hotkeys (if any)

### License

Wired Buddy itself uses [MacControlCenterUI](https://github.com/orchetect/MacControlCenterUI), [MenuBarExtraAccess](https://github.com/orchetect/MenuBarExtraAccess) and [SettingsAccess](https://github.com/orchetect/SettingsAccess) to achieve its native-like look n' feel. Visit these awesome repositories for more informations on their licenses :heart:

Wired Buddy is licensed under the MIT license.

```
MIT License

Copyright (c) 2024 Jan Kowalewicz <jan (at) nitroosit (dot) de>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```