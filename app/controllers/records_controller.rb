class RecordsController < ApplicationController
    def new
      @record = Record.new
    end
  
    def create
      Rails.logger.debug(params.inspect) 
      @record = Record.new(record_params)
      if @record.save
        redirect_to users_path(current_user)
      else
        redirect_to "/users/page"
      end
    end
  
    private
  
    def record_params
      params.require(:record).permit(:recorder_id, :flight_category_id).merge(user_id: params[:user_id])
    end
  end
  
  