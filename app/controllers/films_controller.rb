class FilmsController < ApplicationController

    def index
        @plays = Film.all.order("created_at DESC")
    end

    def show
        @play = Film.find(params[:id])
    end

    def new
        @play = Film.new
    end

    def create
        @play = Film.new(film_params)
    end

    private 

    def film_params
        params.require(:play).permit(:title, :description,:director)
    end
end
