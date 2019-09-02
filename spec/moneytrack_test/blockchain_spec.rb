#un rspec test qui va balancer deux payload bien précis a la classe block et donc le premier sera le genesis et du coup on vérifie que "précédent" est vide et que le hash du payload corresponde au payload en faisant des "is equal to" et on appelle la donnée avec des "block[data][data]" simplement
#avec les deux payload précédemment donnés, on crée une blockchain en appelant la classe blockchain mais il est possible de combiner les deux tests pour que ce soit plus facile et fluide
#et un test qui ajoute un deuxieme block a la blockchain en verifiant donc les données ... du coup ce test pourrait englober les deux précédents et on est bon

require 'spec_helper'
require 'moneytrack_test/payload'
require 'moneytrack_test/block'
require 'moneytrack_test/blockchain'


RSpec.describe MoneytrackTest::Payload do
	context "adds blocks to the blockchain" do
		payload1 = {hello: "world", key1: "value1"}
		payload1_signature = MoneytrackTest::Payload.to_sign(payload1)
		block1 = MoneytrackTest::Block.new(payload1)
		block1_header = {
					timestamp: Time.now.utc.iso8601,
					previous_block: nil,
					payload_signature: "3a87af5e8ceb519b74e02a2cfde90a12faa34f0f9142b033e5338acab58b18e5"
			}
		block1_signature = MoneytrackTest::Payload.to_sign(block1_header)
		blockchain = MoneytrackTest::Blockchain.new payload1
		payload2 = {hello: "world", key2: "value2"}
		block2 = MoneytrackTest::Block.new(payload2, block1_signature)
		blockchain.push(block2)

		it "generates the payload1 s signature" do
			expect(payload1_signature).to eq "3a87af5e8ceb519b74e02a2cfde90a12faa34f0f9142b033e5338acab58b18e5"
		end
		
		it "generates the first block with previous_block to nil" do
			expect(block1.header.previous_block).to be_nil
		end

		it "generates the block1 s signature" do	
			expect(blockchain.first.signature).to eq(block1_signature)
		end

		it "generates the second block with previous_block to equale block1 s signature" do
			expect(blockchain.last.header.previous_block).to eq(block1_signature)
		end
	end
end