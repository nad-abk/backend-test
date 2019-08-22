require 'msgpack'
require 'digest'

module MoneytrackTest
	class Payload

		def self.to_serialize(payload)
			payload.to_msgpack
		end

		def self.to_sign(payload)
			Digest::SHA256.hexdigest(to_serialize(payload))
		end

	end
end