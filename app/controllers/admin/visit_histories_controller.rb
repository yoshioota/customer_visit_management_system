class Admin::VisitHistoriesController < Admin::AdminAuthorizedController

  before_action :set_customer
  before_action :set_visit_history, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @visit_history.update(visit_history_params)
      redirect_to admin_customer_path(@customer), notice: '訪問概要を更新しました。'
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
    @customer = Customer.find(params[:customer_id])
  end

  def set_visit_history
    @visit_history = @customer.visit_histories.find(params[:id])
  end

  def visit_history_params
    params.require(:visit_history).permit(:visited_user_id, :visited_at, :memo, :next_visit_at)
  end
end
