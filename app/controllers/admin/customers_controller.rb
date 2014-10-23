class Admin::CustomersController < Admin::AdminAuthorizedController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  before_action do
    add_breadcrumb '顧客管理'
  end

  def index
    @customers = Customer.page(params[:page]).all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to admin_customers_path, notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customers_path, notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: '削除しました。'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :tel, :memo)
  end
end
