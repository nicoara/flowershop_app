FactoryBot.define do
  factory :order do
    is_delivered true
    client_name 'George'
    nr_roses 7
    delivery_date { 1.years.ago }
  end
end