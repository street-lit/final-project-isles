class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /observations/1
  # GET /observations/1.json
  def show
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  # GET /observations/1/edit
  def edit
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  # POST /observations
  # POST /observations.json
  def create
    @observation = Observation.new(observation_params)
    if @observation.save
      respond_to do |f|
        f.html do |f|
          redirect_to :back
        end
        f.json do
          render json: @observation.to_json(:include => :user)
        end
      end
    else
      flash[:alert] = 'Errors'
      render :back
    end
  end

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to @observation, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { redirect_to :back, notice: "Comment was not updated because #{@observation.errors.full_messages.each { |message| message  } }"  }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    authorize @observation
    photo = @observation.photo
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to photo, notice: 'Observation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observation
      @observation = Observation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_params
      params.require(:observation).permit(:body, :photo_id, :album_id, :user_id)
    end
end
