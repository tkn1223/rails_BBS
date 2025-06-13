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
        board = Board.create(board_params)
        # binding.pry
        redirect_to board
    end
    
    def show
        @board = Board.find(params[:id])
        # binding.pry
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        board = Board.find(params[:id])
        board.update(board_params)

        redirect_to board
    end

    def destroy
        board = Board.find(params[:id])
        board.destroy

        redirect_to boards_path
    end

    private

    def board_params
        params.require(:board).permit(:author_name, :title, :body)
    end
end