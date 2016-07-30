module Api
  module V1
    # v1/authors
    class AuthorsController < ApiController
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
        return render_errors @author unless @author.save

        render json: @author, status: :created,
               location: v1_author_path(@author)
      end

      # PATCH/PUT v1/authors/:id
      def update
        return render json: @author if @author.update(author_params)
        render_errors @author
      end

      # DELETE v1/authors/:id
      def destroy
        @author.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_author
        id = params[:id] || params[:author_id]
        @author = Author.find(id)
      end

      # Only allow a trusted parameter "white list" through.
      def author_params
        params.require(:author).permit(:first_name, :last_name, :about)
      end
    end
  end
end
