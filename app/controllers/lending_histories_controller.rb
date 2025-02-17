class LendingHistoriesController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @lending_history = @book.lending_histories.build
  end

  def create
    @book = Book.find(params[:book_id])
    @lending_history = @book.lending_histories.build(lending_history_params.merge(borrowed_at: Time.current))

    if @lending_history.save
      @book.update(status: 'borrowed')
      redirect_to book_path(@book), notice: 'Book borrowed successfully.'
    else
      render :new
    end
  end

  def return_book
    @lending_history = LendingHistory.find(params[:id])
    @lending_history.update(returned_at: Time.current)
    @lending_history.book.update(status: 'available')

    redirect_to book_path(@lending_history.book), notice: 'Book returned successfully.'
  end

  private

  def lending_history_params
    params.require(:lending_history).permit(:borrower_name)
  end
end
