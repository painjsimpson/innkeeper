class MenuItemsController < ApplicationController
  before_action :set_menu_item,  only: [:edit, :update, :create, :destroy]

  def show
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to menu_path, notice: 'Menu Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to menu_path, notice: 'Menu Item was successfully updated.'}
      else
        format.html { render :edit }
      end
    end
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:menu_id, :icon, :label, :action, :target, :order)
  end
end
