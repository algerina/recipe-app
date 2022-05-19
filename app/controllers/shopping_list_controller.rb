class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @food = current_user.recipes.includes!(:foods).map(&:foods).flatten.uniq
  end
end
