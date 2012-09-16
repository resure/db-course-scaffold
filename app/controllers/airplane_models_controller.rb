class AirplaneModelsController < ApplicationController
  def index
    @airplane_models = AirplaneModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @airplane_models }
    end
  end

  def show
    @airplane_model = AirplaneModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @airplane_model }
    end
  end

  def new
    @airplane_model = AirplaneModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @airplane_model }
    end
  end

  def edit
    @airplane_model = AirplaneModel.find(params[:id])
  end

  def create
    @airplane_model = AirplaneModel.new(params[:airplane_model])

    respond_to do |format|
      if @airplane.save
        format.html { redirect_to @airplane_model, notice: 'Airplane model was successfully created.' }
        format.json { render json: @airplane_model, status: :created, location: @airplane_model }
      else
        format.html { render action: "new" }
        format.json { render json: @airplane_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @airplane_model = AirplaneModel.find(params[:id])

    respond_to do |format|
      if @airplane_model.update_attributes(params[:airplane_model])
        format.html { redirect_to @airplane_model, notice: 'Airplane model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @airplane_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @airplane_model = AirplaneModel.find(params[:id])
    @airplane_model.destroy

    respond_to do |format|
      format.html { redirect_to airplane_models_url }
      format.json { head :no_content }
    end
  end
end
