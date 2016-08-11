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

			context "that are float and integer, respectively" do

				it "create object" do
					expect { GpsUtils::Point.new(1.2, 3) }.to_not raise_error

					x = GpsUtils::Point.new(1.2, 3)
					expect(x.lat).to eq 1.2
					expect(x.lng).to eq 3
				end

			end

			context "that are integer and float, respectively" do

				it "create object" do
					expect { GpsUtils::Point.new(1, 3.4) }.to_not raise_error

					x = GpsUtils::Point.new(1, 3.4)
					expect(x.lat).to eq 1
					expect(x.lng).to eq 3.4
				end

			end

			context "that are float and string, respectively" do

				it "raise exception" do
					expect { GpsUtils::Point.new(1.2, '3.4') }.to raise_error(ArgumentError)
				end

			end

			context "that are integer and string, respectively" do

				it "raise exception" do
					expect { GpsUtils::Point.new(1, '3.4') }.to raise_error(ArgumentError)
				end

			end

			context "that are string and float, respectively" do

				it "raise exception" do
					expect { GpsUtils::Point.new('1.2', 3.4) }.to raise_error(ArgumentError)
				end

			end

			context "that are string and integer, respectively" do

				it "raise exception" do
					expect { GpsUtils::Point.new('1.2', 3) }.to raise_error(ArgumentError)
				end

			end

		end

		context "given Point(1.2, 3.4)" do

			it ".to_a should return [1.2, 3.4]" do
				x = GpsUtils::Point.new(1.2, 3.4)
				expect(x.to_a).to match_array([1.2, 3.4])
			end

			it ".to_s should return '1.2, 3.4'" do
				x = GpsUtils::Point.new(1.2, 3.4)
				expect(x.to_s).to eq("1.2,3.4")
			end

		end

		context "given Point(1, 3)" do

			it ".to_a should return [1, 3]" do
				x = GpsUtils::Point.new(1, 3)
				expect(x.to_a).to match_array([1, 3])
			end

			it ".to_s should return '1, 3'" do
				x = GpsUtils::Point.new(1, 3)
				expect(x.to_s).to eq("1,3")
			end

		end

		context "given p1 = Point(1, 3)" do
			before :all do
				@p1 = GpsUtils::Point.new(1, 3)
			end

			context "and p2 = Point(2, 3)" do
				before :all do
					@p2 = GpsUtils::Point.new(2, 3)
				end

				it "then p1.distance p2 must be around 111195" do
					expect(@p1.distance(@p2)).to be_within(0.01).of(111194.92)
				end

			end

			context "and p2 = Point(-2, -3)" do
				before :all do
					@p2 = GpsUtils::Point.new(-2, -3)
				end

				it "then p1.distance p2 must be around 745714" do
					expect(@p1.distance(@p2)).to be_within(0.01).of(745713.76)
				end
			end

			context "and p2 is not a Point" do
				it "then p1.distance p2 must raise exception" do
					expect { @p1.distance(-3.2) }.to raise_error(ArgumentError)
					expect { @p1.distance(3) }.to raise_error(ArgumentError)
					expect { @p1.distance('3') }.to raise_error(ArgumentError)
					expect { @p1.distance(nil) }.to raise_error(ArgumentError)
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

			context "given box where nw corner == se corner" do

				before :all do
					@nw = GpsUtils::Point.new(56.137947, -8.251422)
					@se = GpsUtils::Point.new(56.137947, -8.251422)
					@box = GpsUtils::BoundingBox.new(@nw, @se)
				end

				it "any point should be outside" do
					p = GpsUtils::Point.new(56.137947, -8.251422)
					expect(@box.cover? p).to be false

					p = GpsUtils::Point.new(56.60, -9.20)
					expect(@box.cover? p).to be false

					expect(@box.cover? @nw).to be false

					expect(@box.cover? @se).to be false
				end

			end

		end

	end

end
