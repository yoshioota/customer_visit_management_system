class Admin::EmployeesController < Admin::AdminAuthorizedController

  before_action :set_employee, only: [:show, :edit, :update, :destroy, :edit_customers, :update_customers]

  before_action do
    if action_name == 'index'
      add_breadcrumb '社員管理'
    else
      add_breadcrumb '社員管理', admin_employees_path
    end
  end

  def index
    @employees = Employee.page(params[:page]).all
  end

  def edit
    add_breadcrumb @employee.name
  end

  def show
    add_breadcrumb @employee.name
  end

  def update
    add_breadcrumb @employee.name

    if @employee.update(employee_params)
      redirect_to [:admin, @employee], notice: '更新しました。'
    else
      render :edit
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to [:admin, @employee], notice: '作成しました。'
    else
      render :new
    end

  end

  def destroy
    @employee.destroy
    redirect_to admin_employees_url, notice: '削除しました。'
  end

  def edit_customers
    @customers = Customer.all
  end

  def update_customers
    @employee.customers = Customer.where(id: params[:customer_ids]).all
    @employee.save!
    redirect_to [:admin, @employee], notice: '更新しました。'
  end

  private

  def set_employee
    @employee = Employee.includes(:customers).find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
