describe "GpsUtils" do

	context "Point" do

		context "given two arguments" do

			context "that are floats" do

				it "create object" do
					expect { GpsUtils::Point.new(1.2, 3.4) }.to_not raise_error

					x = GpsUtils::Point.new(1.2, 3.4)
					expect(x.lat).to eq 1.2
					expect(x.lng).to eq 3.4
				end

			end

			context "that are integers" do

				it "create object" do
					expect { GpsUtils::Point.new(1, 3) }.to_not raise_error

					x = GpsUtils::Point.new(1, 3)
					expect(x.lat).to eq 1
					expect(x.lng).to eq 3
				end

			end

			context "that are strings" do

				it "raise exception" do
					expect { GpsUtils::Point.new('1.2', '3.4') }.to raise_error(ArgumentError)
				end

			end

		end

	end

	context "BoundingBox" do

		context "cover" do

			context "given box((-56.18, 8.25), (-56.50, 9.07))" do

				before :all do
					@n_nw = GpsUtils::Point.new(-56.137947, 8.251422)
					@n_se = GpsUtils::Point.new(-56.503488, 9.075396)
					@n_box = GpsUtils::BoundingBox.new(@n_nw, @n_se)
				end

				it "point(-56.30, 8.70) should be inside" do
					p = GpsUtils::Point.new(-56.3, 8.7)
					expect(@n_box.cover? p).to be true
				end

				it "point(-56.30, 8.20) should be outside" do
					p = GpsUtils::Point.new(-56.3, 8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.30, 9.20) should be outside" do
					p = GpsUtils::Point.new(-56.3, 9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.10, 8.20) should be outside" do
					p = GpsUtils::Point.new(-56.10, 8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.10, 8.70) should be outside" do
					p = GpsUtils::Point.new(-56.10, 8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.10, 9.20) should be outside" do
					p = GpsUtils::Point.new(-56.10, 9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.60, 8.70) should be outside" do
					p = GpsUtils::Point.new(-56.60, 8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.60, 8.20) should be outside" do
					p = GpsUtils::Point.new(-56.60, 8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.60, 9.20) should be outside" do
					p = GpsUtils::Point.new(-56.60, 9.20)
					expect(@n_box.cover? p).to be false
				end
			end

			context "given box((-56.18, -8.25), (-56.50, -9.07))" do

				before :all do
					@n_nw = GpsUtils::Point.new(-56.137947, -8.251422)
					@n_se = GpsUtils::Point.new(-56.503488, -9.075396)
					@n_box = GpsUtils::BoundingBox.new(@n_nw, @n_se)
				end

				it "point(-56.30, -8.70) should be inside" do
					p = GpsUtils::Point.new(-56.3, -8.7)
					expect(@n_box.cover? p).to be true
				end

				it "point(-56.30, -8.20) should be outside" do
					p = GpsUtils::Point.new(-56.3, -8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.30, -9.20) should be outside" do
					p = GpsUtils::Point.new(-56.3, -9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.10, -8.20) should be outside" do
					p = GpsUtils::Point.new(-56.10, -8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.10, -8.70) should be outside" do
					p = GpsUtils::Point.new(-56.10, -8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.10, -9.20) should be outside" do
					p = GpsUtils::Point.new(-56.10, -9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.60, -8.70) should be outside" do
					p = GpsUtils::Point.new(-56.60, -8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.60, -8.20) should be outside" do
					p = GpsUtils::Point.new(-56.60, -8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(-56.60, -9.20) should be outside" do
					p = GpsUtils::Point.new(-56.60, -9.20)
					expect(@n_box.cover? p).to be false
				end
			end

			context "given box((56.18, 8.25), (56.50, 9.07))" do

				before :all do
					@n_nw = GpsUtils::Point.new(56.137947, 8.251422)
					@n_se = GpsUtils::Point.new(56.503488, 9.075396)
					@n_box = GpsUtils::BoundingBox.new(@n_nw, @n_se)
				end

				it "point(56.30, 8.70) should be inside" do
					p = GpsUtils::Point.new(56.3, 8.7)
					expect(@n_box.cover? p).to be true
				end

				it "point(56.30, 8.20) should be outside" do
					p = GpsUtils::Point.new(56.3, 8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.30, 9.20) should be outside" do
					p = GpsUtils::Point.new(56.3, 9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.10, 8.20) should be outside" do
					p = GpsUtils::Point.new(56.10, 8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.10, 8.70) should be outside" do
					p = GpsUtils::Point.new(56.10, 8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.10, 9.20) should be outside" do
					p = GpsUtils::Point.new(56.10, 9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.60, 8.70) should be outside" do
					p = GpsUtils::Point.new(56.60, 8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.60, 8.20) should be outside" do
					p = GpsUtils::Point.new(56.60, 8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.60, 9.20) should be outside" do
					p = GpsUtils::Point.new(56.60, 9.20)
					expect(@n_box.cover? p).to be false
				end
			end

			context "given box((56.18, -8.25), (56.50, -9.07))" do

				before :all do
					@n_nw = GpsUtils::Point.new(56.137947, -8.251422)
					@n_se = GpsUtils::Point.new(56.503488, -9.075396)
					@n_box = GpsUtils::BoundingBox.new(@n_nw, @n_se)
				end

				it "point(56.30, -8.70) should be inside" do
					p = GpsUtils::Point.new(56.3, -8.7)
					expect(@n_box.cover? p).to be true
				end

				it "point(56.30, -8.20) should be outside" do
					p = GpsUtils::Point.new(56.3, -8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.30, -9.20) should be outside" do
					p = GpsUtils::Point.new(56.3, -9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.10, -8.20) should be outside" do
					p = GpsUtils::Point.new(56.10, -8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.10, -8.70) should be outside" do
					p = GpsUtils::Point.new(56.10, -8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.10, -9.20) should be outside" do
					p = GpsUtils::Point.new(56.10, -9.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.60, -8.70) should be outside" do
					p = GpsUtils::Point.new(56.60, -8.70)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.60, -8.20) should be outside" do
					p = GpsUtils::Point.new(56.60, -8.20)
					expect(@n_box.cover? p).to be false
				end

				it "point(56.60, -9.20) should be outside" do
					p = GpsUtils::Point.new(56.60, -9.20)
					expect(@n_box.cover? p).to be false
				end
			end

		end

	end

end
