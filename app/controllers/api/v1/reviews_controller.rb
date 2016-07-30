module Api
  module V1
    # v1/books/:book_id/reviews
    class ReviewsController < ApiController
      before_action :set_book
      before_action :set_review, only: [:show, :update, :destroy]

      # GET v1/books/:book_id/reviews
      def index
        @reviews = @book.reviews

        render json: @reviews
      end

      # GET v1/books/:book_id/reviews/:id
      def show
        render json: @review
      end

      # POST v1/books/:book_id/reviews
      def create
        @review = @book.reviews.new(review_params)
        @review.user = @current_user
        return render_errors @review unless @review.save

        render json: @review, status: :created,
               location: v1_book_review_path(@review, @book.id)
      end

      # PATCH/PUT v1/books/:book_id/reviews/:id
      def update
        if @review.update(review_params)
          @review.user = @current_user
          return render json: @review
        end
        render_errors @review
      end

      # DELETE v1/books/:book_id/reviews/:id
      def destroy
        @review.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:book_id])
      end

      def set_review
        @review = Review.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def review_params
        params.require(:review).permit(:text)
      end
    end
  end
end
