class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :employees_display]
  before_action :correct_user, only: [:edit, :update,]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info, :employees_display]
  before_action :set_one_month, only: :show
  # before_action :superior_user, only: :

  def index

    @users = User.paginate(page: params[:page])
    # パラメータとして名前か性別を受け取っている場合は絞って検索する
    if params[:name].present?
    @users = @users.get_by_name params[:name]
    end
    if params[:gender].present?
    @users = @users.get_by_gender params[:gender]
    end

  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      render :edit
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def employees_display
    @users = User.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :employee_number, :uid, :password, :password_confirmation, :basic_time, :work_time, :designated_work_start_time, :designated_work_end_time)
    end
    
    def basic_info_params
      params.require(:user).permit(:name, :email, :department, :employee_number, :uid, :password, :password_confirmation, :basic_time, :work_time, :designated_work_start_time, :designated_work_end_time)
    end
    # def superior_user
    #   redirect_to root_url unless current_user.superior?
    # end
end