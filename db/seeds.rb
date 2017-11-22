# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker

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
skills = [
"Adobe after effects",
"Adobe dreamweaver",
"Adobe fireworks",
"Adobe illustrator",
"Adobe indesign",
"Adobe photoshop",
"Adobe premiere",
"Agile",
"Android",
"Anglais",
"Angulasjs",
"Apache",
"Apex",
"API REST",
"Architecture logicielle",
"Asp.net",
"C/C++",
"C#/VB.NET",
"Cisco",
"CMS",
"CSS",
"CSS3",
"SASS",
"Développement iOS",
"Django",
"Python",
"Drupal",
"Eclipse",
"Gestion de projet",
"HTML/HTML5",
"iOS",
"J2ee",
"Java",
"Java ee",
"Java server framework",
"JQuery",
"Javascript",
"Unix/Linux",
"Microsoft .net",
"Microsoft Access",
"Microsoft SQL server",
"Microsoft windows server",
"MVC",
"Mysql",
"Node.js",
"Nosql",
"Oracle",
"Oracle database",
"Oracle ebusiness suite",
"PHP",
"PL/SQL",
"Postgresql",
"Responsive design",
"SAP finance",
"Scrum",
"Spring",
"SQL",
"SQL server",
"UML",
"Visual Basic",
"Vmware"
]

skills.each do |skill|
	Skill.create(title: skill)
end

# Currency
Currency.create(currency_symbol: 'F CFA', iso_code: 'XOF')
Currency.create(currency_symbol: '$', iso_code: 'USD')


# Time Initie
TimeUnity.create(title: 'Heure(s)')
TimeUnity.create(title: 'Jours')
TimeUnity.create(title: 'Mois')










    