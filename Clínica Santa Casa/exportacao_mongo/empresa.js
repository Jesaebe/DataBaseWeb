use clinicaSantaClara

db.Empresa.insertMany([
	{
		"_id": "12345678000195",
		"telefone": "1134567890",
		"razaoSocial": "Empresa ABC",
		"email": "contato@empresaabc.com",
		"endereco": {
			"logradouro": "Rua das Flores",
			"complemento": "Apto 101",
			"numero": "123",
			"CEP": "12345-678",
			"cidade": "São Paulo",
			"bairro": "Centro",
			"uf": "SP"
		}
	},
	{
		"_id": "23456789000145",
		"telefone": "3156789012",
		"razaoSocial": "Empresa 123",
		"email": "contato@empresa123.com",
		"endereco": {
			"logradouro": "Rua das Oliveiras",
			"complemento": "Casa",
			"numero": "45",
			"CEP": "54321-678",
			"cidade": "Rio de Janeiro",
			"bairro": "Botafogo",
			"uf": "RJ"
		}
	},
	{
		"_id": "34567890000196",
		"telefone": "3234567890",
		"razaoSocial": "Empresa DEF",
		"email": "contato@empresadef.com",
		"endereco": {
			"logradouro": "Rua das Palmeiras",
			"complemento": "Apto 202",
			"numero": "678",
			"CEP": "67890-123",
			"cidade": "São Paulo",
			"bairro": "Jardim Paulista",
			"uf": "SP"
		}
	},
	{
		"_id": "45678901000197",
		"telefone": "4245678901",
		"razaoSocial": "Empresa GHI",
		"email": "contato@empresaghi.com",
		"endereco": {
			"logradouro": "Avenida Brasil",
			"complemento": "",
			"numero": "654",
			"CEP": "54321-876",
			"cidade": "Rio de Janeiro",
			"bairro": "Laranjeiras",
			"uf": "RJ"
		}
	},
	{
		"_id": "56789012000198",
		"telefone": "5334567890",
		"razaoSocial": "Empresa JKL",
		"email": "contato@empresajkl.com",
		"endereco": {
			"logradouro": "Rua das Acácias",
			"complemento": "Bloco A",
			"numero": "321",
			"CEP": "67890-456",
			"cidade": "São Paulo",
			"bairro": "Vila Mariana",
			"uf": "SP"
		}
	},
	{
		"_id": "67890123000199",
		"telefone": "6445678901",
		"razaoSocial": "Empresa MNO",
		"email": "contato@empresamno.com",
		"endereco": {
			"logradouro": "Avenida Atlântica",
			"complemento": "",
			"numero": "222",
			"CEP": "98765-123",
			"cidade": "Rio de Janeiro",
			"bairro": "Copacabana",
			"uf": "RJ"
		}
	},
	{
		"_id": "78945612000199",
		"telefone": "6445678902",
		"razaoSocial": "Empresa PQR",
		"email": "contato@empresapqr.com",
		"endereco": {
			"logradouro": "Rua das Palmeiras",
			"complemento": "Apto 303",
			"numero": "789",
			"CEP": "67890-321",
			"cidade": "São Paulo",
			"bairro": "Jardim Paulista",
			"uf": "SP"
		}
	},
	{
		"_id": "89012345000156",
		"telefone": "1122335566",
		"razaoSocial": "Empresa VWX",
		"email": "contato@empresavwx.com",
		"endereco": {
			"logradouro": "Rua da Esperança",
			"complemento": "Apto 404",
			"numero": "345",
			"CEP": "12345-789",
			"cidade": "São Paulo",
			"bairro": "Vila Nova",
			"uf": "SP"
		}
	},
	{
		"_id": "89012345000191",
		"telefone": "7556789012",
		"razaoSocial": "Empresa STU",
		"email": "contato@empresastu.com",
		"endereco": {
			"logradouro": "Rua das Andorinhas",
			"complemento": "Casa 12",
			"numero": "456",
			"CEP": "23456-789",
			"cidade": "Rio de Janeiro",
			"bairro": "Ipanema",
			"uf": "RJ"
		}
	},
	{
		"_id": "98765432000182",
		"telefone": "2145678901",
		"razaoSocial": "Empresa XYZ",
		"email": "contato@empresaxyz.com",
		"endereco": {
			"logradouro": "Avenida Paulista",
			"complemento": "",
			"numero": "987",
			"CEP": "98765-432",
			"cidade": "São Paulo",
			"bairro": "Bela Vista",
			"uf": "SP"
		}
	}
]);