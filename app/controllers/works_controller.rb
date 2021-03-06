class WorksController < ApplicationController
  before_action :find_work, only: [:show, :edit, :update]
  
  def index
    @works = Work.all
  end

  def homepage
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to work_path(@work)
      flash[:success] = "Successfully added"
    else
      flash.now[:falture] = "Failed to add"
      flash.now[:error] = @work.errors.messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @work.assign_attributes(work_params)
    if @work.save
      redirect_to work_path(@work)
      flash[:success] = "Successfully updated"
    else
      render :edit
      flash.now[:failure] = "Failed to update"
      flash.now[:error] = @work.errors.messages
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to works_path
  end

  private
  def work_params
    return params.require(:work).permit(:id, :title, :description, :creator, :publication_year)
  end

  def find_work
    @work = Work.find(params[:id])
  end
end
