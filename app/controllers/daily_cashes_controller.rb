class DailyCashesController < ApplicationController
  layout 'layouts/main_layout'
  before_action :find_daily_cash, only: [:destroy, :update]
  def index
    @daily_cashes = DailyCash.paginate(:page => params[:page], :per_page => 50).order('id asc')
    @input_moneys = InputMoney.paginate(:page => params[:page], :per_page => 50).order('id asc')
    @daily_cash = DailyCash.new()
    @input_money = InputMoney.new()
  end

  def new
    @daily_cash = DailyCash.new()
    respond_to do |format|
      format.js
    end
  end

  def create
    @daily_cash = DailyCash.new(daily_cash_params)
    if @daily_cash.save
      @daily_cash.money = @daily_cash.detail_outputs.pluck(:money).sum()
      @daily_cash.save!
      flash[:success] = "Create Daily Cash success"
      redirect_to daily_cashes_path
    else
      flash[:error] = @daily_cash.errors.full_messages.join(' | ')
      redirect_to daily_cashes_path
    end
  end

  def update
    if @daily_cash.update(daily_cash_params)
      @daily_cash.money = @daily_cash.detail_outputs.pluck(:money).sum()
      @daily_cash.save!
      flash[:success] = "Update Daily Cash success"
      redirect_to daily_cashes_path
    else
      flash[:error] = @daily_cash.errors.full_messages.join(' | ')
      redirect_to daily_cashes_path
    end
  end

  def destroy
    flash[:success] = "Delete Daily Cash success"
    redirect_to daily_cashes_path if @daily_cash.destroy
  end

  def edit_out_js
    @daily_cash = DailyCash.find(params[:id_js])
    respond_to do |format|
      format.js
    end
  end
  
  def total_money_inday_js
    @total_money_inday =  InputMoney.input_money - DailyCash.output_money
    respond_to do |format|
      format.js
    end
  end

  def money_with_month_js
    list_month_out = []
    list_month_in = []
    DailyCash.all.each do |d|
      if d.find_month(d.with_draw_date) == d.find_month(params[:month])
        list_month_out << d.id
      end
    end
    InputMoney.all.each do |i|
      if i.find_month(i.input_date) == i.find_month(params[:month])
        list_month_in << i.id
      end
    end
    out_money_with_month = DailyCash.where(id: list_month_out).pluck(:money).sum()
    in_money_with_month = InputMoney.where(id: list_month_in).pluck(:money).sum()
    @money_with_month = in_money_with_month - out_money_with_month
    respond_to do |format|
      format.js
    end
  end

  private

  def find_daily_cash
    @daily_cash = DailyCash.find(params[:id])
  end

  def daily_cash_params
    params.require(:daily_cash).permit(:with_draw_date, :from, :to, detail_outputs_attributes:[:id, :content, :money, :_destroy])
  end
end
