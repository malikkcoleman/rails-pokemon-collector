class PokemonSetsController < ApplicationController
  before_action :set_pokemon_set, only: %i[ show edit update destroy ]

  # GET /pokemon_sets or /pokemon_sets.json
  def index
    @pokemon_sets = PokemonSet.all
  end

  # GET /pokemon_sets/1 or /pokemon_sets/1.json
  def show
  end

  # GET /pokemon_sets/new
  def new
    @pokemon_set = PokemonSet.new
  end

  # GET /pokemon_sets/1/edit
  def edit
  end

  # POST /pokemon_sets or /pokemon_sets.json
  def create
    @pokemon_set = PokemonSet.new(pokemon_set_params)

    respond_to do |format|
      if @pokemon_set.save
        format.html { redirect_to pokemon_set_url(@pokemon_set), notice: "Pokemon set was successfully created." }
        format.json { render :show, status: :created, location: @pokemon_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemon_sets/1 or /pokemon_sets/1.json
  def update
    respond_to do |format|
      if @pokemon_set.update(pokemon_set_params)
        format.html { redirect_to pokemon_set_url(@pokemon_set), notice: "Pokemon set was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemon_sets/1 or /pokemon_sets/1.json
  def destroy
    @pokemon_set.destroy

    respond_to do |format|
      format.html { redirect_to pokemon_sets_url, notice: "Pokemon set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_set
      @pokemon_set = PokemonSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_set_params
      params.require(:pokemon_set).permit(:series_id, :name, :image)
    end
end
