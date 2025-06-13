class BoardsController < ApplicationController
    # 掲示板一覧ページ
    def index
        @boards = Board.all
    end

    # 作成ページ
    def new
        @board = Board.new
        # binding.pry
    end

    def create
        Board.create(board_params)
        # binding.pry
    end
    
    def show
        @board = Board.find(params[:id])
        # binding.pry
    end

    private

    def board_params
        params.require(:board).permit(:author_name, :title, :body)
    end
end