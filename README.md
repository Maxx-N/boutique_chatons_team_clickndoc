Kitty Pics App on Ruby on Rails


**How to run the app (locally) :**

1- IN THE CONSOLE, ENTER THE FOLLOWING COMMANDS :

    - git clone https://github.com/Maxx-N/boutique_chatons_team_clickndoc.git

    - cd boutique_chatons_team_clickndoc

    - bundle install

    - rails db:create db:migrate db:seed

2- CREATE A FILE ".env" AND PUT YOUR API KEYS : 

    - PUBLISHABLE_KEY=your_stripe_api_key
    - SECRET_KEY=your_stripe_secret_key
    - AMAZON_ACCESS_KEY_ID=your_amazon_api_key
    - AMAZON_SECRET_ACCESS_KEY=your_amazon_secret_key
    - GMAIL_LOGIN=your_gmail_login
    - GMAIL_PWD=your_gmail_password

3- IN THE CONSOLE :

    - rails server

4- IN THE NAVIGATOR : 

    - http://localhost:3000/

**What a user can do with this app :**

    - Log in/Sign in
    - Browse for his/her favorite kitty pictures on the home page and add them to the cart
    - Look for kitty pictures thanks to tags
    - Watch the kitty pictures in details in a show page
    - See his/her cart, delete an item, delete all the items
    - Place an order
    - Pay via Stripe
    - Go to his/her profile page where the user can see all the former orders and change his/her information.
    - Log out
As soon as an order is placed, an email is send to the user containing his/her items. An email is also send to the administrator advising him/her that an order has been placed.

**What a visitor can do :**

    - consult the items index

**This app was made by Maxime Norval, Christophe Bonnefoy, Claire Tardy and Lucas Jégo**
>>>>>>> master
