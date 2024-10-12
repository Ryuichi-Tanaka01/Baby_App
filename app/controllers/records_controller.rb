class RecordsController < ApplicationController
    def new
      @record = Record.new
    end
  
    def create
      Rails.logger.debug(params.inspect)
      @record = Record.new(record_params)
    
      if @record.save
        redirect_to page_users_path, notice: '記録が保存されました。'
      else
        flash.now[:alert] = @record.errors.full_messages.to_sentence
        render :new
      end
    end
    
  
    private
  
    def record_params
      params.require(:record).permit(:recorder_id, :flight_category_id).merge(user_id: current_user.id)
    end
  end
  