class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  def index
    @stocks = Stock.all
    @items = Item.all
  end

  # GET /stocks/1
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
        @items = Item.all

  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
   def create
    # @stock = Stock.new(params[:data].keys, params[:data].values)
   params["data"].each do |d|
    # if d["altas"].nil? && d["bajas"].nil?
    
    # else
    @stock = Stock.create(my_params(d))
    if @stock.altas == nil && @stock.bajas == nil
      @stock.destroy
    else
      @stock.save
       
    end
    @item = Item.find(@stock.item_id)
    if @stock.altas != nil
     @item.quantity =  @item.quantity + @stock.altas
     @item.save
   end
    if  @stock.bajas != nil
      @item.quantity = @item.quantity - @stock.bajas
      @item.save

    end
   end
    
      redirect_to change_path, notice: 'Stock was successfully created.'

   end

  # PATCH/PUT /stocks/1
  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end
  
  def change
    @stocks = Stock.where("created_at >= ?", Time.zone.now - 1.hour)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:altas, :bajas, :item_id)
    end
    
    def my_params(my_params)
      my_params.permit(:altas, :bajas, :item_id)
    end
end
