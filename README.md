# GpsUtils

[![Build Status](https://travis-ci.org/megamoose/gpsutils.svg?branch=master)](https://travis-ci.org/megamoose/gpsutils)
[![Code Climate](https://codeclimate.com/github/megamoose/gpsutils/badges/gpa.svg)](https://codeclimate.com/github/megamoose/gpsutils)
[![Test Coverage](https://codeclimate.com/github/megamoose/gpsutils/badges/coverage.svg)](https://codeclimate.com/github/megamoose/gpsutils/coverage)

Small ruby library for working with GPS coordinates.

## Contents
- [Installation](#installation)
  - [Using Bundler with rubygems](#using-bundler-with-rubygems)
  - [Using Bundler with github](#using-bundler-with-github)
  - [Using locally build gem-file](#using-locally-build-gem-file)
- [Usage](#usage)
- [License](#license)

## Installation

You can install the package from rubygems or github using Bundler or create your own package from the source code.

### Using Bundler with rubygems

Edit you Gemfile and add the following line:
```ruby
gem 'gpsutils'
```

Then run:
```bash
$ bundle install
```

### Using Bundler with github

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
# Follow instructions in the installation section.
require 'gpsutils'

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

Sort positions (Points) by distance to location (Point):

```ruby
# Follow instructions in the installation section.
require 'gpsutils'

# Latitude, Longitude.
location = GpsUtils::Point.new(-22.955776, -43.536438)

positions = []
positions.push(GpsUtils::Point.new(-23.560112, -46.642043))
positions.push(GpsUtils::Point.new(-12.994417, -38.508040))

positions.sort_by! do |position|
	location.distance(position)
end
```

## License
This code is free to use under the terms of the [MIT license](LICENSE).
