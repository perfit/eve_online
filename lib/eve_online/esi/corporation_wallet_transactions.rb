# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationWalletTransactions < Base
      API_PATH = "/v1/corporations/%<corporation_id>s/wallets/%<division>s/transactions/"

      attr_reader :corporation_id, :division, :from_id

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @division       = options.fetch(:division)
        @from_id        = options.fetch(:from_id, nil)
      end

      def wallet_transactions
        @wallet_transactions ||=
          begin
            output = []
            response.each do |wallet_transaction|
              output << Models::WalletTransaction.new(wallet_transaction)
            end
            output
          end
      end

      def scope
        "esi-wallet.read_corporation_wallet.v1"
      end

      def additional_query_params
        [:from_id]
      end

      def path
        format(API_PATH, corporation_id: corporation_id,
               division: division)
      end
    end
  end
end
