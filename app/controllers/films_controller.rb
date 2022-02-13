class FilmsController < ApplicationController

    before_action :find_play, only: [:show,:edit, :update, :destroy ]

    def index
        if params[:category].blank?
            @plays = Film.all.order("created_at DESC")
        else  
            @category_id = Category.find_by(name: params[:category]).id
            @plays = Film.where(:category_id => @category_id).order("created_at DESC")
        end
    end

    def show
        
    end

    def new
        @play = current_user.films.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end

    def create
        @play = current_user.films.build(film_params)
        @play.category_id = params[:category_id]
        if @play.save
            redirect_to root_path
        else   
            render 'new'
        end
    end

    def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }

    end

    def update
        @play.category_id = params[:category_id]

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
        params.require(:film).permit(:title, :description,:director, :category_id)
    end

    def find_play
        @play = Film.find(params[:id])
    end
end
