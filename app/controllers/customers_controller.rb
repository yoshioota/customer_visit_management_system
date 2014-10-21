class CustomersController < AuthorizedController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = current_employee.customers.all
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
      @customer.employees << current_employee

      redirect_to @customer, notice: '作成しました。'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: '更新しました。'
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
      @customer = current_employee.customers.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :address, :tel, :memo)
    end
end
