class BudgetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @budget = Budget.new
    @budgets = Budget.all
  end

  def create
    budget = Budget.new(budget_params)
    if budget.save
      flash[:success] = "Budget uploaded"
      redirect_to budgets_path
    else
      flash[:error] = "Upload failed"
      render budgets_path
    end
  end

  def destroy
     budget = Budget.find(params[:id])
     budget.destroy
     flash[:notice] = "File has been deleted."
     redirect_to budgets_path
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :upload)
  end
end