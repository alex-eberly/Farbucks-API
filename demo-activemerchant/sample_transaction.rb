
# Include gems (since we are not creating a Rails app)
require 'rubygems'
require 'openssl'
require 'active_merchant'
require 'active_merchant/billing/rails'

# Use the test server
ActiveMerchant::Billing::Base.mode = :test

# Construct a gateway

gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new({
  :login    => '5f8Ygta6D4UP',
  :password => '9X6tq5dS5y4uE3mx'
})

# Create a credit card object
credit_card = ActiveMerchant::Billing::CreditCard.new({
  :first_name => 'Rob',
  :last_name  => 'Elliott',
  :number     => '4111111111111111',
  :month      => '10',
  :year       => (Time.now.year + 1).to_s,
  :verification_value => '999'
})

# Begin purchase


# Check to see that the credit card OBJECT is valid
if credit_card.valid?

  # Collect response from Authorize.Net

  response = gateway.purchase(2500, credit_card)

  # If the transaction is successful, tell the user and display the authorization ID
  if response.success?
		puts "The transaction was successful!  The authorization is #{response.authorization}"
		puts response.params

  # If the transaction is not successful, tell the user and give them the message
  else
    puts "The transaction was unsuccessful because #{response.message}"
  end

# If the credit card OBJECT is not valid, tell the user
else
	puts "The credit card OBJECT is invalid"
end
