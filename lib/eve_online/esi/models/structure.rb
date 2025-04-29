# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Structure < Base
        def as_json
          {
            name: name,
            owner_id: owner_id,
            solar_system_id: solar_system_id,
            type_id: type_id
          }
        end

        def name
          options["name"]
        end

        def owner_id
          options["owner_id"]
        end

        def solar_system_id
          options["solar_system_id"]
        end

        def type_id
          options["type_id"]
        end

        def position
          @position ||= Position.new(options["position"])
        end
      end
    end
  end
end
