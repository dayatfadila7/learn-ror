class SpeechesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_speech, only: %i[ show edit update destroy ]

  # GET /speeches or /speeches.json
  def index
    @speeches = Speech.all
  end

  # GET /speeches/1 or /speeches/1.json
  def show
  end

  # GET /speeches/new
  def new
    @speech = Speech.new
    @new_record = true
  end

  # GET /speeches/1/edit
  def edit
    @speech = Speech.find(params[:id])
    @new_record = false
  end

  # POST /speeches or /speeches.json
  def create
    @speech = Speech.new(speech_params)

    respond_to do |format|
      
      if @speech.save
        format.html { redirect_to speech_url(@speech), notice: "Speech was successfully created." }
        format.json { render :show, status: :created, location: @speech }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speeches/1 or /speeches/1.json
  def update
    respond_to do |format|
      if @speech.update(speech_params)
        format.html { redirect_to speech_url, notice: "Speech was successfully updated." }
        format.json { render :show, status: :ok, location: @speech }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speeches/1 or /speeches/1.json
  def destroy

    @speech = Speech.find(params[:id])
    @speech.destroy

    respond_to do |format|
      format.html { redirect_to speeches_url, status: :see_other, notice: "Speech was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speech
      @speech = Speech.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def speech_params
      params.require(:speech).permit(:president_name, :country_age, :tagline, :content, :logo)
    end
end
