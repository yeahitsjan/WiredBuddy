<p align="center">
  <a href="#">
    <img height="128" width="128" src="https://raw.githubusercontent.com/yeahitsjan/WiredBuddy/develop/Resources/1024x1024px_hintergrund-128.png">
  </a>
  <h1 align="center">Wired Buddy</i></h1>
</p>

![macOS](https://img.shields.io/badge/macOS-13.0+-lightgray?style=flat-square) ![license](https://img.shields.io/github/license/yeahitsjan/WiredBuddy.svg?style=flat-square) ![downloads](https://img.shields.io/github/downloads/yeahitsjan/WiredBuddy/total.svg?style=flat-square)

A small friendly buddy living on the macOS menu bar, showing the current state of an active ethernet interface.

![active](https://raw.githubusercontent.com/yeahitsjan/WiredBuddy/develop/.github/active.png) ![inactive](https://raw.githubusercontent.com/yeahitsjan/WiredBuddy/develop/.github/inactive.png)

## Installation

> Compatible with macOS 13 or later due to use of MenuBarExtra and LaunchAtLogin-Modern

You can grab the latest version from the [releases page](https://github.com/yeahitsjan/WiredBuddy/releases). Unzip it and copy it to the *Applications* folder. Have fun! :relaxed:

**Due to development signing, you probably need to run the application again from settings, allowing its execution.**

*There will a brew cask in the near future, stay tuned!*

## Compiling

```sh
$ git clone https://github.com/yeahitsjan/WiredBuddy.git
```

Open up ``Wired Buddy.xcodeproj`` in Xcode. Some packages will be fetched so let Xcode finish all its tasks, before you hit build!

If you encounter *signing* issues, you could take a look into [🐛 Self compiling](https://github.com/yeahitsjan/WiredBuddy/issues/1), where there is a pretty good description how to sign the application on your own.

## Roadmap

Wired Buddy's main features (displaying the active state of an ethernet connection) are already fully functional (*bugs inside™*). Still there is something to do before releasing a stable v1.0:

- [ ] the AppIcon as a buddy itself
- [ ] Welcome screen on first launch
- [ ] Localization!

## License

Wired Buddy itself uses [MacControlCenterUI](https://github.com/orchetect/MacControlCenterUI), [MenuBarExtraAccess](https://github.com/orchetect/MenuBarExtraAccess), [SettingsAccess](https://github.com/orchetect/SettingsAccess) and [LaunchAtLogin-Modern](https://github.com/sindresorhus/LaunchAtLogin-Modern) to achieve its native-like look n' feel. Visit these awesome repositories for more informations on their licenses :heart:

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