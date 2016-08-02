# GpsUtils
Small ruby library for working with GPS coordinates.

# Usage

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
