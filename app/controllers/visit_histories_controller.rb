class VisitHistoriesController < AuthorizedController

  before_action :set_customer
  before_action :set_visit_history, only: [:edit, :update, :destroy]

  def new
    @visit_history = VisitHistory.new
  end

  def edit
  end

  def create
    @visit_history = @customer.visit_histories.new(visit_history_params)

    @visit_history.visited_employee = current_employee

    if @visit_history.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def update

    @visit_history.assign_attributes(visit_history_params)

    # if params[:visit_history][:next_schedule].to_i == 0
    #   @visit_history.next_visit_at = nil
    # end

    if @visit_history.save
      redirect_to customer_path(@customer), notice: '訪問概要を更新しました。'
      # redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @visit_history.destroy
    redirect_to visit_histories_url, notice: 'Visit history was successfully destroyed.'
  end

  private

  def set_customer
    @customer = current_employee.customers.find(params[:customer_id])
  end

  def set_visit_history
    @visit_history = @customer.visit_histories.find(params[:id])
  end

  def visit_history_params
    params.require(:visit_history).permit(:visited_user_id, :visited_at, :memo, :next_visit_at)
  end
end
