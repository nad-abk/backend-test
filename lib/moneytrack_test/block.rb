require 'time'
require 'moneytrack_test/payload'

module MoneytrackTest
	class Blocks
		attr :blocks, :block ,:signature, :header

		def self.initialize(given_payloads, given_previous_block = nil, timestamp = nil)
			timestamp = Time.now.utc.iso8601
			@blocks = Array.new
			given_payloads.each do given_payload
				@header = {
						:timestamp => timestamp,
						:previous_block => given_previous_block,
						:payload_signature => MoneytrackTest::Payload.to_sign(given_payload)
				}

				@signature = MoneytrackTest::Payload.to_sign(@header)

				@block = {
					:signature => @signature,
					:header => @header,
					:payload => given_payload
				}

				@blocks.push(@block)
				given_previous_block = @signature
			end
		end
	end
end
