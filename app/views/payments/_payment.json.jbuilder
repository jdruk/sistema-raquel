json.extract! payment, :id, :price, :payment_type, :description, :client_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)