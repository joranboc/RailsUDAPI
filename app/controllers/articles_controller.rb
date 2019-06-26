class ArticlesController < ApplicationController
    before_action :set_author
    before_action :set_article, only: [:show,:update,:destroy]


    def index        
        @articles = @author.articles
        render json: @articles
    end

    def show
        render json: @article
    end

    def create
        @article = @author.articles.create(article_params)
        render json: @article, status: :created
    end

    def update
        @article.update(article_params)
        render json: @article
    end
    def destroy
        @article.destroy
        render json: "Este articulo fue destruido"
    end

    private
    def article_params
        params.permit(:title,:text)
    end


    def set_author
        @author = Author.find(params[:author_id])
    end
    def set_article
        @article = @author.articles.find(params[:id])
    end
end
