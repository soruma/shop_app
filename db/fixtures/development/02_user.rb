# frozen_string_literal: true

User.seed(:id,
          { id: 1, email: 'user1@example.com', name: 'user1' },
          { id: 2, email: 'user2@example.com', name: 'user2', address: '大坂府大阪市' },
          id: 3, email: 'user3@example.com', name: 'user3', address: '大坂府堺市')
