class BoardsController < ApplicationController

    before_action :set_target_board, only: %i[show edit update destroy]

    # 掲示板一覧ページ
    def index
        @boards = Board.page(params[:page])
    end

    # 作成ページ
    def new
        @board = Board.new
    end

    def create
        @board = Board.new(board_params)
        if @board.save
          flash[:notice] = "「#{@board.title}」の掲示板を作成しました"
          redirect_to @board
        else
        #   redirect_to new_board_path, flash: {
        #     board: @board,
        #     error_messages: @board.errors.full_messages
        #   }
          flash.now[:error_messages] = @board.errors.full_messages
          render :new
        end
    end
    
    def show
        @comment = Comment.new(board_id: @board.id)
    end

    def edit
    end

    def update
        @board.update(board_params)

        redirect_to @board
    end

    def destroy
        @board.destroy

        redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
    end

    private

    def board_params
        params.require(:board).permit(:author_name, :title, :body)
    end

    def set_target_board
        @board = Board.find(params[:id])
    end

end