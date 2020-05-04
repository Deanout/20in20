# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy like]
  before_action :set_genres, except: %i[show destroy]
  before_action :is_admin!, except: %i[show index]
  before_action :authenticate_user!, only: [:like]

  # GET /games
  # GET /games.json
  def index
    set_games_and_genre_with_criteria(params[:genre], '')
  end

  def search
    set_games_and_genre_with_criteria(params[:genre], params[:order])
  end

  # GET /games/1
  # GET /games/1.json
  def show; end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit; end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    if current_user.voted_for? @game
      @game.unliked_by current_user
    else
      @game.liked_by current_user
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:title, :body, :review, :rating, :thumbnail, genre_ids: [])
  end

  def set_games_and_genre_with_criteria(requested_genre, requested_order)
    if requested_genre.nil? || requested_genre.eql?('All')
      games_by_genre = Game.all
      @genre_name = 'All'
    else
      games_by_genre = filter_games_by_genre(requested_genre)
      @genre_name = requested_genre
    end
    order_games(requested_order, games_by_genre)
  end

  def filter_games_by_genre(genre_name)
    @genre = Genre.find_by(name: genre_name)
    games = if @genre.nil?
              Game.none
            else
              @genre.games
    end
  end

  def order_games(_order, _games)
    @games = case _order
             when 'A-Z'
               _games.order('title ASC')
             when 'Z-A'
               _games.order('title DESC')
             when 'Highest Rating First'
               _games.order('rating DESC')
             when 'Lowest Rating First'
               _games.order('rating ASC')
             when 'Newest First'
               _games.order('created_at DESC')
             when 'Oldest First'
               _games.order('created_at ASC')
             else
               _games.order('title ASC')
    end
  end
end
