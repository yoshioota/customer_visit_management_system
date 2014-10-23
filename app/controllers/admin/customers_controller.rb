# 管理側顧客管理

class Admin::CustomersController < Admin::AdminAuthorizedController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  before_action do
    if action_name == 'index'
      add_breadcrumb '顧客管理'
    else
      add_breadcrumb '顧客管理', admin_customers_path
    end
  end

  def index
    @customers = Customer.page(params[:page]).all
  end

  def show
    add_breadcrumb @customer.name
  end

  def new
    @customer = Customer.new
  end

  def edit
    add_breadcrumb @customer.name, admin_customer_path(@customer)
    add_breadcrumb '更新'
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
    redirect_to admin_customers_url, notice: '削除しました。'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :tel, :memo)
  end
end
