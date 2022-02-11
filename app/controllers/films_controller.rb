class FilmsController < ApplicationController

    def index
        @films = Film.all.order("created_at DESC")
    end

    def show
        @film = Film.find(params[:id])
    end
end
