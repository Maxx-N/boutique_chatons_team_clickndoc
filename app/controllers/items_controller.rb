class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
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
