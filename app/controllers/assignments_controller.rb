class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:edit, :update, :destroy]
  def index
    @assignments = current_user.assignments
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = current_user.assignments.new(assignment_params)
    if @assignment.save
      flash[:success] = "Assignment Graded"
      redirect_to root_path
    else
      flash[:error] = "Error #{@account.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @assignment.udpate
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path
  end

  private
    def assignment_params
      params.require(:assignment).permit(:name, :grade)
    end

    def set_assignment
      @assignment = current_user.assignments.find(params[:id])
    end
end
