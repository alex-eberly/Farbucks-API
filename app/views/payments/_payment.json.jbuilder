json.extract! payment, :id, :amount, :transaction_id, :response, :created_at, :updated_at
json.url payment_url(payment, format: :json)
