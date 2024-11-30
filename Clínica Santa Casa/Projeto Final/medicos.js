use clinicaSantaClara

db.Medico.insertMany([
    {
		"_id" : "CRM001",
		"nome" : "Dr. Carlos Alberto",
		"telefone" : "11987654324",
		"email" : "dr.carlos@example.com"
	},
	{
		"_id": "CRM002",
		"nome" : "Dra. Beatriz Costa",
		"telefone" : "11987654325",
		"email" : "dra.beatriz@example.com"
	},
	{
		"_id": "CRM003",
		"nome" : "Dr. Eduardo Lima",
		"telefone" : "11987654326",
		"email" : "dr.eduardo@example.com"
	},
	{
		"_id": "CRM004",
		"nome" : "Dr. Fernanda Silva",
		"telefone" : "11987654327",
		"email" : "dr.fernanda@example.com"
	}
]); 