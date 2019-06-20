class AuthorsController < ApplicationController
    
    def index
        @authors = Author.all
        render json: @authors
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            render json: @author
        else

        end

    end

end
