# HTML Proofer, Dockerized

[![CircleCI](https://circleci.com/gh/mtlynch/html-proofer-docker.svg?style=svg)](https://circleci.com/gh/mtlynch/html-proofer-docker) [![Docker Pulls](https://img.shields.io/docker/pulls/mtlynch/htmlproofer.svg?maxAge=604800)](https://hub.docker.com/r/mtlynch/htmlproofer/)

HTML validation, made easy. This repository is the [HTML Proofer](https://github.com/gjtorikian/html-proofer) Ruby gem wrapped up in a Docker container, so you don't have to fuss with installing things like [Ruby](https://www.ruby-lang.org/) or [Nokogiri](http://www.nokogiri.org/).

## Usage

Requires [Docker](https://www.docker.com/).

```bash
docker run mtlynch/htmlproofer
```

This will print out the usage instructions. Arguments for [the `htmlproofer` CLI](https://github.com/gjtorikian/html-proofer#using-on-the-command-line) can then be appended to the command. Note that **it's not (yet) recommended this be used against live sites** due to [this issue](https://github.com/gjtorikian/html-proofer/issues/334).

### Directory of files

e.g. those created by a static site builder like [Jekyll](http://jekyllrb.com/) or [Hugo](https://gohugo.io/). You will need to [mount the directory as a data volume](https://docs.docker.com/storage/volumes/#start-a-container-with-a-volume) so it's available in the container, like so:

```bash
docker run -v /absolute/path/to/site/:/mounted-site mtlynch/htmlproofer /mounted-site
```

### Single file

You can also mount a single file, like so:

```bash
docker run -v /absolute/path/to/file.html:/mounted-file.html mtlynch/htmlproofer /mounted-file.html
```