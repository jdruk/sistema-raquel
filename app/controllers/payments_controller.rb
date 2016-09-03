class PaymentsController < ApplicationController
    before_action :set_client, except: [:geral]
    before_action :set_payment, only: [:show, :edit, :update, :destroy]

    def geral
        @payments = Payment.all
    end
    # GET /payments
    # GET /payments.json
    def index
        @payments = Payment.where client: @client
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
        @payment.client = @client
        respond_to do |format|
            if @payment.save
                format.html { redirect_to client_path(@client) , notice: 'Pagamento criado com sucesso.' }
                format.json { render :show, status: :created, location: @payment }
            else
                format.html { render :new }
            end
        end
    end

    # PATCH/PUT /payments/1
    # PATCH/PUT /payments/1.json
    def update
        respond_to do |format|
            if @payment.update(payment_params)
                format.html { redirect_to client_path(@client), notice: 'Pagamento foi atualizado com sucesso.' }
            else
                format.html { render :edit }
            end
        end
    end

    # DELETE /payments/1
    # DELETE /payments/1.json
    def destroy
        @payment.destroy
        respond_to do |format|
            format.html { redirect_to client_path(@client), notice: 'Pagamento deletado.' }
        end
    end

    private
    def set_client
        @client = Client.find(params[:client_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
        @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
        params.require(:payment).permit(:price, :payment_type, :description, :client_id, :date_payment)
    end
end
