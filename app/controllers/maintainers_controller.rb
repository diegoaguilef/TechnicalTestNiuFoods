class MaintainersController < ApplicationController
  # frozen_string_literal: true

  before_action :set_model
  before_action :set_entity, only: %i[update destroy edit]

  def index
    @entities = @model.all
    respond_to do |format|
      format.html
      format.json { render json: @model.all }
    end
  end

  def new
    @entity = params[:entity_class].classify.constantize.new
  end

  def edit
  end

  def create
    @entity = @model.new(entity_params)
    respond_to do |format|
      if @entity.save
        format.html { redirect_to maintainers_url(entity_class: params[:entity_class]), notice: "Parámetro creado correctamente." }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to maintainers_url(entity_class: params[:entity_class]), notice: "Parámetro actualizado." }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to maintainers_url(entity_class: params[:entity_class]), notice: "Channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_model
    @model = params[:entity_class].classify.constantize
  end

  def set_entity
    @entity = @model.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(
      :name, :city_id
    )
  end
end
