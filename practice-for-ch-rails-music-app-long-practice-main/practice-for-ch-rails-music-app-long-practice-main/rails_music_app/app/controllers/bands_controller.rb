class BandsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new 
        render :new
    end 

    def create
        @band = Band.new(band_params)

        if @band.save 
            redirect_to bands_url(@band)
        else 
            render json: @band.errors.full_messages, status: 422 
        end 

    end 

    def index
        @bands = Band.all 
        render :index 
    end 

    def edit 
        @band = Band.find(params[:id])
        render :edit 
    end 

    def show 
        @band = Band.find(params[:id])
        render :show 
    end 

    def update 
        @band = Band.find_by(id: params[:id])

        if @band && @band.find_by(band_params)
            redirect_to band_url
        else 
            render json: @band.errors.full_messages, status: 422 
        end 
    end 

    def destroy
        @band = Band.find(params[:id])
        if @band
            @band.destroy
            redirect_to bands_url
        else
            flash[:errors] = ["Band not found"]
            redirect_to bands_url
        end
    end

    private 

    def band_params
        params.require(:band).permit(:name)
    end 


end 