class RecordsController < ApplicationController
    def new
      @record = Record.new
    end
  
    def create
      Rails.logger.debug(params.inspect)
      @record = Record.new(record_params)
    
      if @record.save
        redirect_to user_path(current_user.id)
      else
        flash.now[:alert] = '記入者を選んでください'
        render 'users/write_create'
      end
    end
    
    def show
      @record = Record.find(params[:id])
      @record.destroy
      redirect_to user_path(current_user.id)
    end
  
    private
  
    def record_params
      params.require(:record).permit(:recorder_id, :flight_category_id, :has_urinated, :breastmilk_amount, :remarks).merge(user_id: current_user.id)
    end
  end
  