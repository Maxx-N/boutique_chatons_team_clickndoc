class ItemOrderMailer < ApplicationMailer
  default from: 'staffchatons@gmail.com'


	def confirm_order_email_to_user(itemorder)
		@itemorder = itemorder





		# id de l'objet itemorder
		@itemorder_id = itemorder.id

    # Récupération de l'id de l'order
    @order_id = itemorder.order_id
    # Récupération de l'order correspondant à cet id
    @order = Order.find(@order_id)

    # Récupération de l'id du cart correspondant à cet order
    @cart_id = @order.cart_id
    # Récupération du cart correspondant à cet id
    @cart = Cart.find(@cart_id)

    # Récupération de l'id de l'user correspondant à ce cart
    @user_id = @cart.user_id
    # Récupération de l'user correspondant à cet id
    @user = User.find(@user_id)


		# item lié à l'objet itemorder:
		@item = Item.find(@itemorder.item_id)
		mail(to: @user.email, subject: "Confirmation de votre commande.")
	end

	def confirm_order_email_to_admin(itemorder)
		@itemorder = itemorder



		# id de l'objet itemorder
		@itemorder_id = itemorder.id

    # Récupération de l'id de l'order
    @order_id = itemorder.order_id
    # Récupération de l'order correspondant à cet id
    @order = Order.find(@order_id)

    # Récupération de l'id du cart correspondant à cet order
    @cart_id = @order.cart_id
    # Récupération du cart correspondant à cet id
    @cart = Cart.find(@cart_id)

    # Récupération de l'id de l'user correspondant à ce cart
    @user_id = @cart.user_id
    # Récupération de l'user correspondant à cet id
    @user = User.find(@user_id)


		# item lié à l'objet itemorder:
		@item = Item.find(@itemorder.item_id)
	  mail(to: "staff-chaton@yopmail.com", subject: "Une commande vient d'être passée.")
	end

end
