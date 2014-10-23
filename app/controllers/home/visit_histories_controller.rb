# 訪問履歴

class Home::VisitHistoriesController < Home::AuthorizedController

  before_action :set_customer
  before_action :set_visit_history, only: [:edit, :update, :destroy]

  before_action do
    add_breadcrumb '担当顧客管理', home_customers_path
    add_breadcrumb @customer.name, home_customer_path(@customer)
  end

  def new
    add_breadcrumb '新規訪問履歴'
    @visit_history = VisitHistory.new
  end

  def edit
    add_breadcrumb '更新'
  end

  def create
    add_breadcrumb '新規訪問履歴'
    @visit_history = @customer.visit_histories.new(visit_history_params)

    @visit_history.visited_employee = current_employee

    if @visit_history.save
      redirect_to home_customer_path(@customer)
    else
      render :new
    end
  end

  def update
    add_breadcrumb '更新'
    @visit_history.assign_attributes(visit_history_params)

    if @visit_history.save
      redirect_to home_customer_path(@customer), notice: '訪問概要を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @visit_history.destroy
    redirect_to home_visit_histories_url, notice: '削除しました。'
  end

  private

  def set_customer
    @customer = current_employee.customers.find(params[:customer_id])
  end

  def set_visit_history
    @visit_history = @customer.visit_histories.find(params[:id])
  end

  def visit_history_params
    params.require(:visit_history).permit(:visited_employee_id, :visited_at, :memo, :next_visit_at)
  end
end
