class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
	@order = Order.find(params[:order_id])
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
	@payment.order = Order.find(payment_params[:order_id])

    respond_to do |format|
      if @payment.save
	    if @payment.make_transaction
		
		  # UPDATE STATUS OF THE ORDER
		  @payment.order.status = Status.find(2)
		  @payment.order.save
		  
		  # CLEAR current_order
		  reset_session
		
          format.html { redirect_to @payment.order, notice: 'Payment was successfully created.' }
          format.json { render :show, status: :created, location: @payment.order }
		else
		  @order = @payment.order
		  @payment.destroy
		  
		  format.html { redirect_to @order, notice: 'Payment failed.' }
          format.json { render :show, status: :created, location: @order }
		end
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :order_id, :first_name, :last_name, :card_number, :card_expires_on)
    end
end
