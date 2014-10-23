# 顧客管理コントローラー

class Home::CustomersController < Home::AuthorizedController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  before_action do
    if action_name == 'index'
      add_breadcrumb '担当顧客管理'
    else
      add_breadcrumb '担当顧客管理', home_customers_path
    end
  end

  def index
    @customers = current_employee.customers.all
  end

  def show
    add_breadcrumb @customer.name
  end

  def new
    add_breadcrumb '新規作成'
    @customer = Customer.new
  end

  def edit
    add_breadcrumb @customer.name
    add_breadcrumb '更新'
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      @customer.employees << current_employee

      redirect_to [:home, @customer], notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to [:home, @customer], notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to home_customers_url, notice: '削除しました。'
  end

  private

    def set_customer
      @customer = current_employee.customers.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :address, :tel, :memo)
    end
end
