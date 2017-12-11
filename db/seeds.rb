# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker

#Users

#2.times do
	#User.create do |user|
		#user.user_name = Faker::Name.name
		#user.company_name = Faker::Company.name
		#user.login = Faker::Internet.user_name
		#user.profile_type = "Freelance"
		#user.email = Faker::Internet.email
		#user.password = "AMOSXZIBITDE88"
		#user.password_confirmation = "AMOSXZIBITDE88"
		#user.email = Faker::Internet.email
		
	#end
#end

User.create(login: "KERNEL", 
	profile_type: "Freelance", 
	email: "salut.amos@gmail.com",
	 password: "AMOSXZIBITDE88",
	  password_confirmation: "AMOSXZIBITDE88")


# Domains
Domain.create([
	{ title: 'Audiovisuel, Cinéma & Multimedia' }, 
	{ title: 'Batiments et Travaux Publics' }, 
	{ title: "Décoration et Organisation d'évènements" }, 
	{ title: "Développement Web et Application" }, 
	{ title: "Graphismes et Infographismes" }, 
	{ title: "Informatique et Télécommunication" },
	{ title: "Presse" },
	{ title: "Traducteurs et Rédacteurs" }, 
	{ title: "Web Marketing, Marketing et Community Managers" }
	
])

# Profession 'Audiovisuel, Cinéma & Multimedia'
Profession.create(title: 'Concepteur multimédia', domain_id: 1)
Profession.create(title: 'Monteur Vidéo', domain_id: 1)
Profession.create(title: 'Roughman', domain_id: 1)

# Profession 'Batiments et Travaux Publics'
Profession.create(title: 'Architecte', domain_id: 2)
Profession.create(title: "Chargé d'affaires dans le BTP", domain_id: 2)
Profession.create(title: 'Chef de chantier', domain_id: 2)
Profession.create(title: "Conducteur d'engins de chantier", domain_id: 2)
Profession.create(title: 'Dessinateur-projeteur en bâtiment', domain_id: 2)
Profession.create(title: 'Électricien du BTP', domain_id: 2)
Profession.create(title: 'Géomètre', domain_id: 2)
Profession.create(title: 'Ingénieur études de prix', domain_id: 2)
Profession.create(title: 'Maçon', domain_id: 2)
Profession.create(title: 'Ouvrier qualifié', domain_id: 2)
Profession.create(title: 'Ouvrier routier', domain_id: 2)
Profession.create(title: 'Peintre décorateur', domain_id: 2)

# Profession 'Décoration et Organisation d'évènements'
Profession.create(title: 'Décorateur (trice)', domain_id: 3)

# Profession 'Développement Web et Application'
Profession.create(title: 'Analyste programmeur', domain_id: 4)
Profession.create(title: "Concepteur Web", domain_id: 4)
Profession.create(title: 'Développeur', domain_id: 4)
Profession.create(title: "Développeurs d'application Mobile", domain_id: 4)
Profession.create(title: 'Intégrateur technique', domain_id: 4)
Profession.create(title: 'Webdesigner', domain_id: 4)
Profession.create(title: 'Géomètre', domain_id: 4)
Profession.create(title: 'Ingénieur études de prix', domain_id: 4)
Profession.create(title: 'Webmaster', domain_id: 4)

# Profession 'Graphismes et Infographismes'
Profession.create(title: 'Designer textile', domain_id: 5)
Profession.create(title: "Dessinateur (trice)", domain_id: 5)
Profession.create(title: 'Graphiste', domain_id: 5)
Profession.create(title: "Illustrateur", domain_id: 5)
Profession.create(title: 'Infographiste', domain_id: 5)
Profession.create(title: 'Maquettiste PAO/DAO', domain_id: 5)

# Profession 'Informatique et Télécommunication'
Profession.create(title: 'Administrateur BD', domain_id: 6)
Profession.create(title: "Administrateur Réseaux", domain_id: 6)
Profession.create(title: 'Administrateur Système', domain_id: 6)
Profession.create(title: "Architecte de système d'information", domain_id: 6)
Profession.create(title: 'Architecte réseaux', domain_id: 6)
Profession.create(title: 'Chef de projet informatique', domain_id: 6)
Profession.create(title: 'Concepteur BD', domain_id: 6)
Profession.create(title: 'Directeur informatique', domain_id: 6)
Profession.create(title: 'Ingénieur système et réseau', domain_id: 6)
Profession.create(title: 'Ingénieur Télécom', domain_id: 6)
Profession.create(title: 'Mainteneur Informatique', domain_id: 6)
Profession.create(title: 'Technicien en informatique industrielle', domain_id: 6)
Profession.create(title: 'Technicien en télécommunications', domain_id: 6)
Profession.create(title: 'Technicien micro / Réseaux', domain_id: 6)

# Profession 'Presse'
Profession.create(title: 'Agencier', domain_id: 7)
Profession.create(title: "Attaché de presse", domain_id: 7)
Profession.create(title: 'Caricaturiste', domain_id: 7)
Profession.create(title: "Journalisme blogueur", domain_id: 7)
Profession.create(title: 'Journaliste Chroniqueur', domain_id: 7)
Profession.create(title: "Journaliste radio", domain_id: 7)
Profession.create(title: "Journaliste reporter d'images", domain_id: 7)
Profession.create(title: 'Journaliste sportif', domain_id: 7)
Profession.create(title: 'Journaliste web', domain_id: 7)
Profession.create(title: 'Maquettiste de presse', domain_id: 7)
Profession.create(title: 'Photographe de presse', domain_id: 7)
Profession.create(title: 'Rédacteur en chef', domain_id: 7)
Profession.create(title: 'Rédacteur en presse écrite', domain_id: 7)
Profession.create(title: 'Secrétaire de rédaction', domain_id: 7)

# Profession 'Traducteurs et Rédacteurs'
Profession.create(title: 'Assistant trilingue', domain_id: 8)
Profession.create(title: "Assistant bilingue", domain_id: 8)
Profession.create(title: 'Concepteur-rédacteur', domain_id: 8)
Profession.create(title: "Guide-interprète", domain_id: 8)
Profession.create(title: 'Interprète', domain_id: 8)
Profession.create(title: "Rédacteur dans les assurances", domain_id: 8)
Profession.create(title: "Rédacteur technique", domain_id: 8)
Profession.create(title: 'Terminologue', domain_id: 8)
Profession.create(title: 'Traducteur', domain_id: 8)
Profession.create(title: 'Traducteur audiovisuel', domain_id: 8)
Profession.create(title: 'Traducteur littéraire', domain_id: 8)
Profession.create(title: 'Traducteur technique', domain_id: 8)

# Profession 'Web Marketing, Marketing et Community Managers'
Profession.create(title: 'Chargé de webmarketing', domain_id: 9)
Profession.create(title: "Référenceur", domain_id: 9)
Profession.create(title: 'Web Marketeur', domain_id: 9)
Profession.create(title: "Marketeur", domain_id: 9)
Profession.create(title: 'Commercial(e)', domain_id: 9)
Profession.create(title: "Community Manager", domain_id: 9)

# Skills
Skill.create(title: "Adobe after effects")
Skill.create(title: "Adobe dreamweaver")
Skill.create(title: "Adobe fireworks")
Skill.create(title: "Adobe illustrator")
Skill.create(title: "Adobe indesign")
Skill.create(title: "Adobe photoshop")
Skill.create(title: "Adobe premiere")
Skill.create(title: "Agile")
Skill.create(title: "Android")
Skill.create(title: "Anglais")
Skill.create(title: "Angulasjs")
Skill.create(title: "Apache")
Skill.create(title: "Apex")
Skill.create(title: "API REST")
Skill.create(title: "Architecture logicielle")
Skill.create(title: "Asp.net")
Skill.create(title: "C/C++")
Skill.create(title: "C#/VB.NET")
Skill.create(title: "Cisco")
Skill.create(title: "CMS")
Skill.create(title: "CSS")
Skill.create(title: "CSS3")
Skill.create(title: "SASS")
Skill.create(title: "Développement iOS")
Skill.create(title: "Django")
Skill.create(title: "Python")
Skill.create(title: "Drupal")
Skill.create(title: "Eclipse")
Skill.create(title: "Gestion de projet")
Skill.create(title: "HTML/HTML5")
Skill.create(title: "iOS")
Skill.create(title: "J2ee")
Skill.create(title: "Java")
Skill.create(title: "Java ee")
Skill.create(title: "Java server framework")
Skill.create(title: "JQuery")
Skill.create(title: "Javascript")
Skill.create(title: "Unix/Linux")
Skill.create(title: "Microsoft .net")
Skill.create(title: "Microsoft Access")
Skill.create(title: "Microsoft SQL server")
Skill.create(title: "Microsoft windows server")
Skill.create(title: "MVC")
Skill.create(title: "Mysql")
Skill.create(title: "Node.js")
Skill.create(title: "Nosql")
Skill.create(title: "Oracle")
Skill.create(title: "Oracle database")
Skill.create(title: "Oracle ebusiness suite")
Skill.create(title: "PHP")
Skill.create(title: "PL/SQL")
Skill.create(title: "Postgresql")
Skill.create(title: "Responsive design")
Skill.create(title: "SAP finance")
Skill.create(title: "Scrum")
Skill.create(title: "Spring")
Skill.create(title: "SQL")
Skill.create(title: "SQL server")
Skill.create(title: "UML")
Skill.create(title: "Visual Basic")
Skill.create(title: "Vmware")


# Currency
Currency.create(currency_symbol: 'F CFA', iso_code: 'XOF')
Currency.create(currency_symbol: '$', iso_code: 'USD')


# Time Initie
TimeUnity.create(title: 'Heure(s)')
TimeUnity.create(title: 'Jours')
TimeUnity.create(title: 'Mois')

Budget.create(title: "Moins de 5 000")
Budget.create(title: "15 000 - 30 000")
Budget.create(title: "35 000 - 45 000")
Budget.create(title: "50 000 - 75 000")
Budget.create(title: "75 000 - 100 000")
Budget.create(title: "100 000 - 200 000")
Budget.create(title: "200 000 - 250 000")
Budget.create(title: "300 000 - 500 000")
Budget.create(title: "600 000 - 800 000")
Budget.create(title: "1 000 000 - 1 500 000")
Budget.create(title: "2 000 000 - 4 000 000")
Budget.create(title: "Plus de 5 000 000")










    