# frozen_string_literal: true

OrderDetail.seed(:id,
                 { id: 1, order_id: 1, item_id: 1, quantity: 2 },
                 { id: 2, order_id: 1, item_id: 2, quantity: 4 },
                 { id: 3, order_id: 2, item_id: 2, quantity: 1 },
                 id: 4, order_id: 3, item_id: 3, quantity: 5)
