
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require'pry'

#fonction pour lancer la recherche d'un email si on a l'url de la mairie en question

	page = Nokogiri::HTML(open('https://www.presse-citron.net/startups-directory'))
	final = Hash.new
	tab_nom = []
	tab_email = []

	email = page.css("div.sabai-directory-contact-email") #position de l'email trouvée grâce à l'inspecteur

	email.map do |email|
		tab_email << email.text
	end

	nom = page.css('div.sabai-directory-title')

	nom.map do |nom|
		tab_nom << nom.text
	end

#constitution du hash final
	for i in(0..20)
		final[tab_nom[i]] = tab_email[i]
	end

	puts "========================================================"
	puts "Liste des incubateurs gentillement fournie par Presse citron"
	puts "========================================================"
	puts final
