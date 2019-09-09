require 'moneytrack_test/block'


module MoneytrackTest
	class Blockchain
		attr :blockchain

		def initialize(initial_payload)
			@blockchain = Array.new()
			@blockchain.push(Block.new(initial_payload))
		end

		def add_block(new_payload)
			@blockchain.push(Block.new(new_payload, @blockchain.last.signature))
		end
	end
end