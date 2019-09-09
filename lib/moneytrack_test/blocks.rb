require 'time'
require 'moneytrack_test/payload'

module MoneytrackTest
	class Blocks
		attr :blocks, :block ,:signature, :header

		def initialize(given_payloads, given_previous_block = nil, timestamp = nil)
			timestamp = Time.now.utc.iso8601
			@blocks = Array.new
			given_payloads.each do |given_payload|
				@block = Block.new(given_payload, given_previous_block, timestamp)

				@blocks.push(@block)
				given_previous_block = @blocks.last.signature
			end
		end
	end
end