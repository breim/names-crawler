class NamesController < ApplicationController

  respond_to :json

  def index
    if params[:gender] == 'male'
      @names = Name.where(male: true)
      respond_with @names
    elsif params[:gender] == 'female'
      @names = Name.where(female: true)
      respond_with @names
    end
  end

  private
    def set_name
      @name = Name.find(params[:id])
    end

    def name_params
      params.require(:name).permit(:name, :short, :description, :male, :female)
    end
end
