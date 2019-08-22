require 'spec_helper'
require 'moneytrack_test/payload'

RSpec.describe MoneytrackTest::Payload do
	context "get the payload's signature " do
		it "generates the payload's signature" do
			payload = {hello: "world", key: "value"}
			expect(MoneytrackTest::Payload.to_sign(payload)).to eq "ca9edf6b92aa42a4e90f8d13f114936cf64156d1d54e00af931ae5e7a24cae28"
		end
	end
end
