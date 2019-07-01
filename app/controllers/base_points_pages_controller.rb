class BasePointsPagesController < ApplicationController
  def base_points
    @base_points = BasePoint.all
  end
  
  def new
    @base_point = BasePoint.new
  end

  def create
    @base_point = BasePoint.new(base_point)
    if @base_point.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @base_point
    else
      render :new
    end
  end
  
  def edit
    @base_point = BasePoint.find(params[:id])
  end
  
  private

    def base_point_params
      params.require(:base_point).permit(:base_point_name, :time_classification)
    end

end
