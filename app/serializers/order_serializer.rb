class OrderSerializer < ActiveModel::Serializer
  attributes :id, :is_delivered, :nr_roses, :client_name, :delivery_date
end
