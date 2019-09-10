require 'moneytrack_test/blocks'


module MoneytrackTest
	class Blockchains
		attr :blockchains, :last_last_signature

		def initialize(initial_payload)
			@blockchains = Array.new()
			@blockchains.push(Blocks.new(initial_payload))
		end

		def add_blocks(new_payload)
			@last_last_signature = @blockchains.last.last.signature
			@blockchains.push(Blocks.new(new_payload, @last_last_signature, timestamp))
		end
	end
end