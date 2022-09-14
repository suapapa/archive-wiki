# Archive of Suapapa's wiki

Live > [HERE](https://homin.dev/wiki/) <

This is a run-able archive for Suapapa's wiki which is onlined till May2011 (maybe) in following links

- http://web.suapapa.net:8080/wiki
- http://www.suapapa.net/wiki

## Build & Run

Build:
```bash
docker build -t wiki:latest .
```

Run:
```bash
docker run -d -p 8080:80 --name wiki wiki:latest
```

Visit http://127.0.0.1:8080/wiki

## License

This repository contains `dokuwiki-stable.tgz`, DokuWiki Stable version, 2022-07-31a "Igor".
Which is available free of charge under [GNU General Public License Version 2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

Contents archive, `data.tar.gz` is Homin Lee's property and can be uses under [CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en).