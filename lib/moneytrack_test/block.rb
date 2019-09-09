require 'time'
require 'moneytrack_test/payload'

module MoneytrackTest
	class Block
		attr :payload ,:signature, :header

		def initialize(given_payload, given_previous_block = nil, timestamp = Time.now.utc.iso8601)
			@header = {
					:timestamp => timestamp,
					:previous_block => given_previous_block,
					:payload_signature => MoneytrackTest::Payload.to_sign(given_payload)
			}

			@signature = MoneytrackTest::Payload.to_sign(@header)

			@payload = given_payload
		end

		def get_previous_block
			@header[:previous_block]
		end
	end
end