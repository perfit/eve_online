# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationContracts < Base
      API_PATH = "/v1/corporations/%<corporation_id>s/contracts/"

      attr_reader :corporation_id, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
      end

      def contracts
        @contracts ||=
          begin
            output = []
            response.each do |contract|
              output << Models::Contract.new(contract)
            end
            output
          end
      end

      def scope
        "esi-contracts.read_corporation_contracts.v1"
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end
