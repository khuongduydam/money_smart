class DailyCashesController < ApplicationController
  # before_action :authenticate_user!, except: :index
  before_action :find_daily_cash,except: [:index, :new, :create]
  
  def index
    @daily_cashes = DailyCash.order('with_draw_date desc')
    @daily_cash = DailyCash.new()
  end

  def new
    @daily_cash = DailyCash.new()
  end

  def show
  end

  def create
    @daily_cash = DailyCash.new(daily_cash_params)
    if @daily_cash.save
      flash[:success] = "Create Daily Cash success"
      redirect_to daily_cashes_path
    else
      flash[:error] = @daily_cash.errors.full_messages.join(' | ')
      render :new
    end
  end

  def edit
  end

  def update
    if @daily_cash.update(daily_cash_params)
      flash[:success] = "Update Daily Cash success"
      redirect_to daily_cashes_path
    else
      flash[:error] = @daily_cash.errors.full_messages.join(' | ')
      render :edit
    end
  end

  def destroy
    @daily_cash.destroy
    redirect_to daily_cashes_path
  end

  private

  def find_daily_cash
    @daily_cash = DailyCash.find(params[:id])
  end

  def daily_cash_params
    params.require(:daily_cash).permit(:reason, :with_draw_date, :money, :from, :to)
  end
end
