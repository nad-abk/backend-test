require "msgpack"
require "digest"

payload = {
		"hello" => "world",
		"key" => "value"
}

serialized = payload.to_msgpack

signature = Digest::SHA256.hexdigest(serialized)