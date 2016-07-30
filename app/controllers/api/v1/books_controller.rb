module Api
  module V1
    # /v1/books
    class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update, :destroy]

      # GET v1/books
      def index
        @books = Book.all
        render json: @books
      end

      # GET v1/books/:id
      def show
        render json: @book
      end

      # POST v1/books
      def create
        @book = Book.new(book_params)

        if @book.save
          render json: @book, status: :created, location: v1_book_path(@book)
        else
          render_errors @book
        end
      end

      # PATCH/PUT v1/books/:id
      def update
        if @book.update(book_params)
          render json: @book
        else
          render_errors @book
        end
      end

      # DELETE v1/books/:id
      def destroy
        @book.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_params
        params.require(:book).permit(
          :isbn, :title, :description, :pages, :website, :published
        )
      end
    end
  end
end
