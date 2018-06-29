class Order < ApplicationRecord
	validates :nr_roses,  presence: true, format: { with: /\A\d+\z/ }
	validates :client_name,  presence: true, length: { maximum: 50 }
	validates :delivery_date,  presence: true, date: true
	validates_inclusion_of :is_delivered, in: [true, false]
end
