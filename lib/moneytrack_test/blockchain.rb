require 'moneytrack_test/block'


module MoneytrackTest
	class Blockchain
		attr :blockchain, :last_last_signature

		def self.initialize(initial_payload)
			@blockchain = Array.new(MoneytrackTest::Blocks.new(initial_payload))
		end

		def self.add_blocks(new_payload)
			@last_last_signature  = @blockchain.last(@blocks.last.signature)
			@blockchain.push(MoneytrackTest::Blocks.new(new_payload, @last_last_signature)
		end
	end
end