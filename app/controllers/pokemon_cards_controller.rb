class PokemonCardsController < ApplicationController
  before_action :set_pokemon_card, only: %i[ show edit update destroy ]

  # GET /pokemon_cards or /pokemon_cards.json
  def index
    @pokemon_cards = PokemonCard.all
  end

  # GET /pokemon_cards/1 or /pokemon_cards/1.json
  def show
    @pokemon_sets = PokemonSet.all
  end

  # GET /pokemon_cards/new
  def new
    @pokemon_card = PokemonCard.new
  end

  # GET /pokemon_cards/1/edit
  def edit
  end

  # POST /pokemon_cards or /pokemon_cards.json
  def create
    @pokemon_card = PokemonCard.new(pokemon_card_params)

    respond_to do |format|
      if @pokemon_card.save
        format.html { redirect_to pokemon_card_url(@pokemon_card), notice: "Pokemon card was successfully created." }
        format.json { render :show, status: :created, location: @pokemon_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemon_cards/1 or /pokemon_cards/1.json
  def update
    respond_to do |format|
      if @pokemon_card.update(pokemon_card_params)
        format.html { redirect_to pokemon_card_url(@pokemon_card), notice: "Pokemon card was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemon_cards/1 or /pokemon_cards/1.json
  def destroy
    @pokemon_card.destroy

    respond_to do |format|
      format.html { redirect_to pokemon_cards_url, notice: "Pokemon card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_card
      @pokemon_card = PokemonCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_card_params
      params.require(:pokemon_card).permit(:set_id, :name, :card_number, :card_type, :rarity, :edition, :price, :image)
    end
end
