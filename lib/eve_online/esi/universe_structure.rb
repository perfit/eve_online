# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class UniverseStructure < Base
      extend Forwardable

      API_PATH = "/v2/universe/structures/%<structure_id>s/"

      attr_reader :structure_id

      def initialize(options)
        super

        @structure_id = options.fetch(:structure_id)
      end

      def_delegators :model, :as_json, :name, :owner_id, :solar_system_id,
                     :type_id, :position

      def model
        @model ||= Models::Structure.new(response)
      end

      def scope
        "esi-universe.read_structures.v1"
      end
      
      def path
        API_PATH
      end
      
    end
  end
end
      
