class BoardsController < ApplicationController
    # 掲示板一覧ページ
    def index
    end

    # 作成ページ
    def new
        @board = Board.new
        # binding.pry
    end
end