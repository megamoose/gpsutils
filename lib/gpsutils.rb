module GpsUtils
	R = 6371e3

	def self.to_radians(degrees)
		degrees * Math::PI / 180
	end

	class Point
		attr_accessor :lat, :lng

		def initialize(lat, lng)
			unless lat.is_a? Float or lat.is_a? Integer
				raise ArgumentError.new 'lat must be float or integer.'
			end

			unless lng.is_a? Float or lng.is_a? Integer
				raise ArgumentError.new 'lng must be float or integer.'
			end

			@lat = lat
			@lng = lng
		end

		def to_a
			[@lat, @lng]
		end

		def to_s
			"#{@lat},#{@lng}"
		end

		# Measure the distance between this point and another.
		#
		# Distance is calculated using equirectangular projection.
		# @see https://en.wikipedia.org/wiki/Equirectangular_projection
		#
		# @param other [Point]
		# @return [Float]
		# @raise [ArgumentError] if other is not a Point
		def distance(other)
			unless other.is_a? Point
				raise ArgumentError.new 'other must be a Point.'
			end

			dlng = GpsUtils::to_radians(other.lng - @lng)
			dlat = GpsUtils::to_radians(other.lat - @lat)

			x = dlng * Math.cos(dlat / 2)
			y = GpsUtils::to_radians(other.lat - @lat)

			Math.sqrt(x**2 + y**2) * GpsUtils::R
		end

	end

	class BoundingBox
		attr_accessor :se, :nw

		def initialize(nw_point, se_point)
			@nw = nw_point
			@se = se_point

			@p21 = @se.lat - @nw.lat
			@p41 = @nw.lng - @se.lng

			@p21ms = @p21 ** 2
			@p41ms = @p41 ** 2
		end

		def cover?(point)
			return false if @nw.lat == @se.lat and @nw.lng == @se.lng

			p = [point.lat - @nw.lat, point.lng - @se.lng]

			p21x = p[0] * @p21
			p41x = p[1] * @p41

			0 <= p21x and p21x <= @p21ms and 0 <= p41x and p41x <= @p41ms
		end

	end

end
