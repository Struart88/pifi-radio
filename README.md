# PiFi Radio

PiFi Radio: A MPD web client to listen to radio

## Table of contents

- [Meet PiFi Radio](#meet-pifi-radio)
  - [What is PiFi Radio](#what-is-pifi-radio)
  - [Some features](#some-features)
  - [Demo](#demo)
- [Installation](#installation)
- [Configuration](#configuration)
  - [PiFi configuration](#pifi-configuration)
  - [List of streams](#list-of-streams)
- [Credits](#credits)
- [License](#license)

## Meet PiFi Radio

### What is PiFi Radio

PiFi Radio is a minimalist MPD web client to listen to radio. In other words, it makes your Raspberry Pi play Internet radio, while you control from any device, such as your phone.

As PiFi is just an interface for MPD, it has some advantages compared to other solutions, e.g. bluetooth or AirPlay. For example, the radio playback is completely independent from your phone. You can take calls, play videos, go to an area with poor WiFi signal, or even turn off your phone. Your Pi will still continue to play the radio you picked.

[I started this project in early 2017. At that time, I wanted to configure Raspbian so my parents could listen to radio with ease, but couldn't find any good solution to it.](https://rafaelc.org/blog/the-motivation-for-pifi-radio/)

Some of the goals of PiFi Radio were the following:

- Easy for my parents to use.

- Simple, straight-forward interface. Do the few things they need and in a clear way.

- As fool-proof as possible. Don't show unnecessary options, minimize user interaction and try to predict what they want.

- Display both available and current stations clearly. No URLs or weird names.

- Multi-platform, targeting primarily mobile phones.

- In local language.

### Some features

Although PiFi tries to be minimal, there are some neat features, such as:

- Radios can be organized in categories, if you wish.

- You can select some radios to be offered only to certain IPs. A use case for this is if there are tons of stations that only you listen and you don't want to pollute everyone else's list.

- Streaming URLs can be pasted directly from your web browser. Useful if you want to listen to a radio that was not previously added to the list.

- If by mistake you choose the same station that is currently playing, the playback just continues normally.

- Multiple people can use it at the same time.

- It can be conveniently added to your phone home screen.

- The app has two views [(playback controls and stations list)](#demo), and tries to show each one smartly so you tap less. For example, when you open PiFi and MPD is idle, the list of radios is shown, because you probably want to pick a station.

- Besides radio, it has the "Random" button, that I added by request. Tapping it plays all the music in your MPD library in shuffle mode. To skip the current song, just press it again. That's the only library function available on the app. Think of that as a bonus, as library support is an after-thought on PiFi, and not its main purpose. [You can disable this button in the configuration.](#pifi-configuration)

- PiFi is currently available in a few languages, and it's easy to translate to more.

## Demo

![Video demo](docs/demo.gif)

## Installation

While PiFi was imagined for the Pi, it should run on any computer with:

- Ruby and a few gems
- MPD

[Check the installation guide](INSTALL.md).

## Configuration

### List of streams

PiFi needs a list of the radios you want to listen. [A example is available here](docs/pifi_streams.json).

The list is read by default from `/etc/pifi_streams.json`. You can change this path [creating a configuration file](#pifi-configuration).

To keep it simple, the list of streams is just a JSON file with key-value pairs, where the key is the station name, and the value is the streaming URL. For example:

    {
         "Radio 1": "https://example.com/radio1",
         "Radio 2": "https://example.com/radio"
    }

If you want to arrange the stations in categories, add a pair with the category name as the key and empty value, as in:

    {
         "Talk radio": "",
         "Radio 1": "https://example.com/radio1",
         "Radio 2": "https://example.com/radio2"

         "Classical": "",
         "Radio 3": "https://example.com/radio3",
         "Radio 4": "https://example.com/radio4"
    }

This will add the headers "Talk radio" and "Classical" above each group of stations, [such as "España" in the demo](#demo).

### PiFi configuration

It's now completely optional to have a configuration file for PiFi. You only need one if you want something different from the defaults.

The path is `/etc/pifi.json` and these are the options:

| Key             | Value                                                                                                             |
| --------------- | ----------------------------------------------------------------------------------------------------------------- |
| `streams_file`  | Path to the JSON file containing the streams.                                                                     |
| `mpd_host`      | MPD host.                                                                                                         |
| `mpd_port`      | MPD port.                                                                                                         |
| `mpd_password`  | MPD password.                                                                                                     |
| `streamsp_file` | Path to JSON file containing additional streams. These will be shown only to the devices listed on `special_ips`. |
| `special_ips`   | The IPs of the devices to show additional streams.                                                                |
| `play_local`    | Set it to `true` if you want PiFi to play songs from your local library. This shows the "Random" button.          |
| `serve_static`  | If we should serve static resources. Set it to `false` if your web server is already doing it.                    |

[You can find a sample here](docs/pifi.json.sample). I suggest you download it and edit it to your needs:

```
$ sudo wget https://raw.githubusercontent.com/rccavalcanti/pifi-radio/master/docs/pifi.json.sample -O /etc/pifi.json
$ sudo -e /etc/pifi.json
```

## Credits

- Translation fr-fr: Francis Chavanon "rimeno"
- Translation nl-nl: Heimen Stoffels "Vistaus"
- Icon made by [iconixar](https://www.flaticon.com/authors/iconixar) from [www.flaticon.com](https://www.flaticon.com/), licensed by [Flaticon Basic License](docs/icon/license.pdf).

## License

Released under [GNU GPL v3](LICENSE).

Copyright 2017-2019 Rafael Cavalcanti <hi@rafaelc.org>
