class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @names = Name.all
    respond_with(@names)
  end

  def show
    respond_with(@name)
  end

  def new
    @name = Name.new
    respond_with(@name)
  end

  def edit
  end

  def create
    @name = Name.new(name_params)
    @name.save
    respond_with(@name)
  end

  def update
    @name.update(name_params)
    respond_with(@name)
  end

  def destroy
    @name.destroy
    respond_with(@name)
  end

  private
    def set_name
      @name = Name.find(params[:id])
    end

    def name_params
      params.require(:name).permit(:name, :short, :description, :male, :female)
    end
end
