module Api
  module V1
    # v1/authors
    class AuthorsController < ApplicationController
      before_action :set_author, only: [:show, :update, :destroy]

      # GET v1/authors
      def index
        @authors = Author.all
        render json: @authors
      end

      # GET v1/authors/:id
      def show
        render json: @author
      end

      # POST v1/authors
      def create
        @author = Author.new(author_params)

        if @author.save
          render json: @author, status: :created,
                 location: v1_author_path(@author)
        else
          render_errors @author
        end
      end

      # PATCH/PUT v1/authors/:id
      def update
        if @author.update(author_params)
          render json: @author
        else
          render_errors @author
        end
      end

      # DELETE v1/authors/:id
      def destroy
        @author.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def author_params
        params.require(:author).permit(:first_name, :last_name, :about)
      end
    end
  end
end
