# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterContractItems < Base
      API_PATH = "/v1/characters/%<character_id>s/contracts/%<contract_id>s/items/"

      attr_reader :character_id, :contract_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @contract_id  = options.fetch(:contract_id)
      end

      def contract_items
        @contract_items ||=
          begin
            output = []
            response.each do |contract_item|
              output << Models::ContractItem.new(contract_item)
            end
            output
          end
      end
      
      def scope
        "esi_contracts.read_character_contracts.v1"
      end

      def path
        format(API_PATH, character_id: character_id, contract_id: contract_id)
      end
    end
  end
end
