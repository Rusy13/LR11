class Lr11cController < ApplicationController
    # before_action :check_num, only: :result
  
  
    def input
    end

    def view
      @new_result = Result.find_by(input: params[:number])
      return unless @new_result.nil?
      @new_result = Result.new(input: params[:number])
      if @new_result.valid?
        @new_result.save
      else
        redirect_to '/', alert: @new_result.errors['expiration_date'][0]
      end
    end

    def show
      render xml: Result.all.as_json.to_xml
    end

  end