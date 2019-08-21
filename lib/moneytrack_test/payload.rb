require "msgpack"
require "digest"

module MoneytrackTest
	class Playload

		@payload = {
			"hello" => "world",
			"key" => "value"
		}

		def to_serialize()
			@serialized_payload = @payload.to_msgpack
		end

		def to_sign()
			@signature = Digest::SHA256.hexdigest(@serialized_payload)
		end

	end

end