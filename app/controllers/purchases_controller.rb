class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @purchases = current_user.purchases.order(created_at: :desc)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
    @purchase = Purchase.new
    @selected_category_ids = []
  end

  def create
    primary_category_id = params[:purchase][:primary_category_id]
    additional_category_ids = params[:additional_category_ids] || []

    name = params[:purchase][:name]
    amount = params[:purchase][:amount]

    @purchase = Purchase.new(name:, amount:, user: current_user)

    if @purchase.save
      PurchaseCategory.create(purchase_id: @purchase.id, category_id: primary_category_id)

      additional_category_ids.each do |category_id|
        next if category_id.blank?

        PurchaseCategory.create(purchase_id: @purchase.id, category_id:)
      end

      redirect_to category_path(primary_category_id), notice: 'Purchase was successfully created.'
    else
      @categories = current_user.categories
      render :new
    end
  end

  def edit; end

  def update
    if @purchase.update(purchase_params)
      @purchase.category_ids = params[:purchase][:category_ids]
      redirect_to @purchase, notice: 'Purchase was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_url, notice: 'Purchase was successfully destroyed.'
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :user_id, category_ids: [])
  end
end
