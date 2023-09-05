class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @search = params[:search]
    @word = params[:word]
    if @model == "User"
      @users = User.looks(@search, @word)
    else
      @books = Book.looks(@search, @word)
    end
  end
end
