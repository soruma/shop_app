# frozen_string_literal: true

Product.seed(:id,
             { id: 1, name: '製品 1', price: 120, end_of_production: false },
             { id: 2, name: '製品 2', price: 220, end_of_production: true },
             { id: 3, name: '製品 3', price: 140, end_of_production: false },
             id: 4, name: '製品 5', price: 220, end_of_production: false)
