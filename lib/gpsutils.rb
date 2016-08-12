module GpsUtils

	class Point
		# @!attribute [r] lat
		#	@return [Float, Integer] Latitude
		attr_reader :lat

		# @!attribute [r] lng
		#	@return [Float, Integer] Longitude
		attr_reader :lng

		# Initialize Point.
		#
		# @param lat [Integer, Float] Latitude
		# @param lng [Integer, Float] Langitude
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

		# @return [Array] Array with latitude and longitude as Float or Integer
		#   values, as used when object was initialized
		def to_a
			[@lat, @lng]
		end

		def to_s
			"#{@lat},#{@lng}"
		end
	end

	class BoundingBox
		# @!attribute [r] nw
		#	@return [Point] North-West corner
		attr_reader :nw

		# @!attribute [r] nw
		#	@return [Point] South-East corner
		attr_reader :se

		# Initialize BoundingBox.
		#
		# @param nw_point [Point] North-West corner
		# @param se_point [Point] South-East corner
		def initialize(nw_point, se_point)
			unless nw_point.is_a? Point
				raise ArgumentError.new 'nw_point must be a Point.'
			end

			unless se_point.is_a? Point
				raise ArgumentError.new 'se_point must be a Point.'
			end

			@nw = nw_point
			@se = se_point

			@p21 = @se.lat - @nw.lat
			@p41 = @nw.lng - @se.lng

			@p21ms = @p21 ** 2
			@p41ms = @p41 ** 2
		end

		# Determine whether point is inside bounding box.
		#
		# @param point [Point]
		def cover?(point)
			p = [point.lat - @nw.lat, point.lng - @se.lng]

			p21x = p[0] * @p21
			p41x = p[1] * @p41

			0 < p21x and p21x < @p21ms and 0 <= p41x and p41x <= @p41ms
		end

	end

end
