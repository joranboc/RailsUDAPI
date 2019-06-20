class ArticlesController < ApplicationController
    before_action :set_author


    def index        
        @articles = @author.articles
        render json:@articles
    end

    def create
        @article = @author.articles.create(article_params)
        render json: @article, status: :created

    end

    private
    def article_params
        params.permit(:title,:text)
    end


    def set_author
        @author = Author.find(params[:author_id])
    end
end
