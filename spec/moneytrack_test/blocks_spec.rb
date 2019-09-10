require 'spec_helper'
require 'moneytrack_test/payload'
require 'moneytrack_test/blocks'


RSpec.describe MoneytrackTest::Blocks do
	context "creates blocks" do
		payloads = [
					  {"hello"=>"world", "key1"=>"value1"},
					  {"hello"=>"world", "key1"=>"value1", "key2"=>"value2"},
					  {"hello"=>"world", "key2"=>"value2"},
					  {"hello"=>"world", "key2"=>"value2", "another"=>"value"}
					]

		blocks = MoneytrackTest::Blocks.new(payloads)

		it "checks that the timestamps are all equal in the same groupe of blocks" do
			blocks.blocks.each do |block|
				expect(block.header[:timestamp]).to eq blocks.blocks.first.header[:timestamp]
			end
		end
	end
end