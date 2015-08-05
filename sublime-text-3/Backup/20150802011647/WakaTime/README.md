sublime-wakatime
================

Fully automatic time tracking for Sublime Text 2 & 3.

Installation
------------

Heads Up! For Sublime Text 2 on Windows & Linux, WakaTime depends on [Python](http://www.python.org/getit/) being installed to work correctly.
    
1. Install [Package Control](https://packagecontrol.io/installation).

2. Using [Package Control](https://packagecontrol.io/docs/usage):

  a) Inside Sublime, press `ctrl+shift+p`(Windows, Linux) or `cmd+shift+p`(OS X).

  b) Type `install`, then press `enter` with `Package Control: Install Package` selected.

  c) Type `wakatime`, then press `enter` with the `WakaTime` plugin selected.

3. Enter your [api key](https://wakatime.com/settings#apikey), then press `enter`.

4. Use Sublime and your time will be tracked for you automatically.

5. Visit https://wakatime.com/dashboard to see your logged time.

Screen Shots
------------

![Project Overview](https://wakatime.com/static/img/ScreenShots/ScreenShot-2014-10-29.png)

Troubleshooting
---------------

First, turn on debug mode in your `WakaTime.sublime-settings` file.

![sublime user settings](https://wakatime.com/static/img/ScreenShots/sublime-wakatime-settings-menu.png)

Add the line: `"debug": true`

Then, open your Sublime Console with `View -> Show Console` to see the plugin executing the wakatime cli process when sending a heartbeat. Also, tail your `$HOME/.wakatime.log` file to debug wakatime cli problems.

For more general troubleshooting information, see [wakatime/wakatime#troubleshooting](https://github.com/wakatime/wakatime#troubleshooting).
