class UserMailer < ApplicationMailer

	# Adresse par défaut
	# 'monsite' à remplacer lorsque nous aurons le nom du site
	default from: 'no-reply@monsite.fr'

	# Méthode permettant d'envoyer un mail de bienvenue au nouvel utilisateur
	def welcome_email(user)
		# Récupération de l'instance user pour pouvoir la passer à la view dans la variable @user
		@user = user

		# Variable contenant l'URL pour se connecter sur notre site
		@url = 'http://boutique_chatons_team_clickndoc.fr/login'

		# Appel à mail(). Permet d'envoyer l'email en définissant le destinataire et le sujet
		mail(to: @user.email, subject: 'Bienvenue chez nous !')
	end

end
