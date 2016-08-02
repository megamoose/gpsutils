# GpsUtils
Small ruby library for working with GPS coordinates.

## Contents
- [Installation](#installation)
  - [Using Bundler](#using-bundler)
  - [Using locally build gem-file](#using-locally-build-gem-file)
- [Usage](#usage)
- [License](#license)

## Installation

You can install the package using either Bundler or a locally generated gem-file.

### Using Bundler

Edit you Gemfile and add the following line:
```ruby
gem 'gpsutils', :git => 'https://github.com/megamoose/gpsutils.git'
```

Then run:
```bash
$ bundle install
```

### Using locally build gem-file

Clone the repository from github:

```bash
$ git clone https://github.com/megamoose/gpsutils.git gpsutils
$ cd gpsutils
```

Build the gem-file:

```bash
$ gem build gpsutils.gemspec
```

Install the gem-file:

```bash
$ gem install gpsutils-*.gem
```

## Usage

Determine whether or not a given location (point) is within an area (bounding box):

```ruby
# No gem, install library manually by copying files into wanted directory.
require_relative 'gpsutils/lib/gpsutils'

# Latitude, Longitude.
location = GpsUtils::Point.new(-22.955776, -43.536438)

# North-West corner.
nw = GpsUtils::Point.new(-22.746120, -43.795060)
# South-East corner.
se = GpsUtils::Point.new(-23.076347, -43.101608)

# North-West point, South-East point.
area = GpsUtils::BoundingBox.new(nw, se)

area.cover? location
```

## License
This code is free to use under the terms of the [MIT license](LICENSE).
