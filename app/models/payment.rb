class Payment < ApplicationRecord

  belongs_to :order

  attr_accessor :first_name, :last_name, :card_number, :card_expires_on
  
  serialize :response
  
  def make_transaction
    response = GATEWAY.purchase((amount * 100), credit_card)
	self.response = response
	self.transaction_id = response.params["transaction_id"].to_i
	self.save
	
	response.success?
  end
  
  private 
  
  def credit_card
  
  @credit_card = ActiveMerchant::Billing::CreditCard.new({
    :first_name => first_name, 
	:last_name => last_name,
	:number => card_number.to_s,
	:month => card_expires_on[2].to_s,
	:year => card_expires_on[1].to_s,
	:verification_value => '999'
  })
  
  end

  def validate_card
    unless credit_card.valid?
	  credit_card.errors.full_messages.each do |message|
	    errors.add_to_base_message
	  end
	end
  end

end
