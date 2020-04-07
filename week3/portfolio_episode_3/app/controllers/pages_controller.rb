class PagesController < ApplicationController
  def index
    @skills = Skill.all
  end
end
