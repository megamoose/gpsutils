module GpsUtils

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
			p = [point.lat - @nw.lat, point.lng - @se.lng]

			p21x = p[0] * @p21
			p41x = p[1] * @p41

			0 <= p21x and p21x <= @p21ms and 0 <= p41x and p41x <= @p41ms
		end

	end

end
