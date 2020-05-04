# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  before_action :set_stats, except: [:home]
  def home; end

  def game; end

  def hiscores
    @users = User.order('wins DESC')
  end

  def played
    current_user.wins += 1 if params[:win]
    current_user.losses += 1 if params[:loss]
    current_user.ties += 1 if params[:tie]
    current_user.save
  end

  private

  def filter_params
    params.permit(:win, :loss, :tie)
  end

  def set_stats
    @wins = current_user.wins
    @losses = current_user.losses
    @ties = current_user.ties
  end
end
