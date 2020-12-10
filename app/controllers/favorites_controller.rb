class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @achieved_articles = current_user.favorite_achieved_articles
  end
end
