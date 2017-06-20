class InputMoneysController < ApplicationController
  layout 'layouts/main_layout'
  before_action :find_input_money,except: [:index, :new, :create, :edit_in_js]

  def new
    @input_money = InputMoney.new()
    respond_to do |format|
      format.js
    end
  end

  def create
    @input_money = InputMoney.new(input_money_params)
    if @input_money.save
      flash[:success] = "Create Input Money success"
      redirect_to daily_cashes_path
    else
      flash[:error] = @input_money.errors.full_messages.join(' | ')
      redirect_to daily_cashes_path
    end
  end

  def update
    if @input_money.update(input_money_params)
      flash[:success] = "Update Input Money success"
      redirect_to daily_cashes_path
    else
      flash[:error] = @input_money.errors.full_messages.join(' | ')
      redirect_to daily_cashes_path
    end
  end

  def edit_in_js
    @input_money = InputMoney.find(params[:id_js])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def destroy
    flash[:success] = "Delete Input Money success"
    redirect_to daily_cashes_path if @input_money.destroy
  end

  private

  def input_money_params
    params.require(:input_money).permit(:reason, :user_name, :money, :input_date)
  end

  def find_input_money
    @input_money = InputMoney.find(params[:id])
  end
end
