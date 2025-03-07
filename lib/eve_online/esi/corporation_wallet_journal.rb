# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationWalletJournal < Base
      API_PATH =
        "/v4/corporations/%<corporation_id>s/wallet/%<division>s/journal/"

      attr_reader :corporation_id, :page, :from_id, :division

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @from_id = options.fetch(:from_id, nil)
        @page = options.fetch(:page, 1)
        @division = options.fetch(:division, 1)
      end

      def wallet_journal_entries
        @wallet_journal_entries ||=
          begin
            output = []
            response.each do |wallet_journal|
              output << Models::WalletJournal.new(wallet_journal)
            end
            output
          end
      end

      def scope
        "esi-wallet.read_corporation_wallet.v1"
      end

      def additional_query_params
        [:from_id, :page, :division]
      end

      def path
        format(API_PATH, corporation_id: corporation_id, division: division)
      end
    end
  end
end
