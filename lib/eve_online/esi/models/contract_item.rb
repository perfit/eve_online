# frozen_string_litereal: true

module EveOnline
  module ESI
    module Models
      class ContractItem < Base
        def as json
          {
            is_included:  is_included,
            is_singleton: is_singleton,
            quantity:     quantity,
            raw_quantity: raw_quantity,
            record_id:    record_id,
            type_id:      type_id
          }
        end

        def is_included
          options["is_included"]
        end

        def is_singleton
          options["is_singleton"]
        end

        def quantity
          options["quantity"]
        end

        def raw_quantity
          options["raw_quantity"]
        end

        def record_id
          options["record_id"]
        end

        def type_id
          options["type_id"]
        end
      end
    end
  end
end
        
