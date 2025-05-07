# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationContractItems < Base
      API_PATH = "/v1/corporations/%<corporation_id>s/contracts/%<contract_id>s/items/"

      attr_reader :corporation_id, :contract_id

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
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
        "esi_contracts.read_corporation_contracts.v1"
      end

      def path
        format(API_PATH, corporation_id: corporation_id, contract_id: contract_id)
      end
    end
  end
end
