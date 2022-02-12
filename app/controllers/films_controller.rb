class FilmsController < ApplicationController

    before_action :find_play, only: [:show,:edit, :update, :destroy ]

    def index
        @plays = Film.all.order("created_at DESC")
    end

    def show
        
    end

    def new
        @play = Film.new
    end

    def create
        @play = Film.new(film_params)
        if @play.save
            redirect_to root_path
        else   
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @play.update(film_params)
            redirect_to film_path(@play)
        else
            render 'edit'
        end

    end

    def destroy
        @play.destroy
        redirect_to root_path
    end

    private 

    def film_params
        params.require(:film).permit(:title, :description,:director)
    end

    def find_play
        @play = Film.find(params[:id])
    end
end
