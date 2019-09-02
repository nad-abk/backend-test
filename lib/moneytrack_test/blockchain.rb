require 'moneytrack_test/block'


module MoneytrackTest
	class Blockchain
		attr :blockchain

		def self.initialize(initial_payload)
			@blockchain = Array.new(Block.new(initial_payload))
		end

		def self.add_block(new_payload)
			@blockchain.push(Block.new(new_payload, @blockchain.last.signature))
		end
	end
end