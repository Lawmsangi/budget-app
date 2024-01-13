class PaymentsController < ApplicationController
  def index
    @payments = @category.payments.order(created_at: :desc)
    @category = current_user.categories.find(params[:category_id])
  end

  def new
    @categories = current_user.categories
    @category = current_user.categories.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    category_params = params[:payment][:category]
    name = params[:payment][:name]
    amount = params[:payment][:amount]

    @category = Category.find_by(name: category_params)
    @payment = current_user.payments.build(name:, amount:)
    @category.payments << @payment

    if @category.save
      redirect_to category_payments_path(@category)
    else
      render 'new'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category)
  end
end
