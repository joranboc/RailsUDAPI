class AuthorsController < ApplicationController
    
    def index
        @authors = Author.all
        render json: @authors
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            render json: @author, status: :created
        else
            render json: @author.errors, status: :unprocessable_entity
        end
    end

    private
    def author_params
        params.permit(:name,:age,:nationality)
    end

end
