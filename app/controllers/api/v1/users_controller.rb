module Api
  module V1
    # /v1/users
    class UsersController < ApiController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET v1/users
      def index
        @users = User.all
        render json: @users
      end

      # GET v1/users/:id
      def show
        render json: @user
      end

      # POST v1/users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created, location: v1_user_path(@user)
        else
          render_errors @user
        end
      end

      # PATCH/PUT v1/users/:id
      def update
        if @user.update(user_params)
          render json: @user
        else
          render_errors @user
        end
      end

      # DELETE v1/users/:id
      def destroy
        @user.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(
          :first_name, :last_name, :email, :password, :birthday,
          :website, :about
        )
      end
    end
  end
end
