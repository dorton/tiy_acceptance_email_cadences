class CodeChallengesController < ApplicationController
  before_action :set_code_challenge, only: [:show, :edit, :update, :destroy]

  # GET /code_challenges
  # GET /code_challenges.json
  def index
    @code_challenges = CodeChallenge.all
  end

  # GET /code_challenges/1
  # GET /code_challenges/1.json
  def show
  end

  # GET /code_challenges/new
  def new
    @code_challenge = CodeChallenge.new
  end

  # GET /code_challenges/1/edit
  def edit
  end

  # POST /code_challenges
  # POST /code_challenges.json
  def create
    @code_challenge = CodeChallenge.new(code_challenge_params)

    respond_to do |format|
      if @code_challenge.save
        format.html { redirect_to @code_challenge, notice: 'Code challenge was successfully created.' }
        format.json { render :show, status: :created, location: @code_challenge }
      else
        format.html { render :new }
        format.json { render json: @code_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /code_challenges/1
  # PATCH/PUT /code_challenges/1.json
  def update
    respond_to do |format|
      if @code_challenge.update(code_challenge_params)
        format.html { redirect_to @code_challenge, notice: 'Code challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @code_challenge }
      else
        format.html { render :edit }
        format.json { render json: @code_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /code_challenges/1
  # DELETE /code_challenges/1.json
  def destroy
    @code_challenge.destroy
    respond_to do |format|
      format.html { redirect_to code_challenges_url, notice: 'Code challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code_challenge
      @code_challenge = CodeChallenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_challenge_params
      params.require(:code_challenge).permit(:newline_url, :description, :weeks_out)
    end
end
