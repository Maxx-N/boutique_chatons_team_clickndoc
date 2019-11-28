class ItemsController < ApplicationController
  def index
    all_item = []
    if params[:id]
      @it = ItemTag.where(tag_id: params[:id])
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      @items = Item.all
    end

  end

  def show
    @item = Item.find(params[:id])

    @tags = ItemTag.where(item_id: @item.id)
  end

  def create
  end
end
