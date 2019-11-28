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

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(title: params[:title], description: params[:description], price: params[:price])
    @item.item_picture.attach(params[:item_picture])

    if @item.save
      flash[:success] = "Le produit a bien été créé"
      redirect_to item_path(@item)
        else
      flash.now[:danger] = "Erreur, le produit n'a pas été créé"
      render "items/new"
    end
  end

  def edit

  end

  def update

  end
end
