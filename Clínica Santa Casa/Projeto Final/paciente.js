use clinicaSantaClara

db.Paciente.insertMany([
    {
        "CPF": "11223344556",
        "nome": "Fernanda Lima",
        "telefone": "11987654335",
        "dataNascimento": "1982-06-17",
        "endereco": {
            "logradouro": "Rua do Sol",
            "complemento": "Casa",
            "numero": "100",
            "CEP": "11222-333",
            "cidade": "São Paulo",
            "bairro": "Moema",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Assistente Administrativo",
            "riscosOperacionais": [
                "Trabalho Noturno"
            ],
            "empresa": "56789012000198"
        }
    },
    {
        "CPF": "12345678901",
        "nome": "Maria Silva",
        "telefone": "11987654321",
        "dataNascimento": "1980-05-10",
        "endereco": {
            "logradouro": "Rua das Flores",
            "complemento": "Apto 101",
            "numero": "123",
            "CEP": "12345-678",
            "cidade": "São Paulo",
            "bairro": "Centro",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Enfermeiro",
            "riscosOperacionais": [
                "Ruído"
            ],
            "empresa": "12345678000195"
        }
    },
    {
        "CPF": "22334455667",
        "nome": "Roberto Costa",
        "telefone": "11987654336",
        "dataNascimento": "1979-04-22",
        "endereco": {
            "logradouro": "Rua da Lua",
            "complemento": "Apto 505",
            "numero": "111",
            "CEP": "44556-789",
            "cidade": "Rio de Janeiro",
            "bairro": "Barra",
            "uf": "RJ"
        },
        "cargo": {
            "nome": "Consultor de TI",
            "riscosOperacionais": [
                "Pressão Alta"
            ],
            "empresa": "67890123000199"
        }
    },
    {
        "CPF": "23456789012",
        "nome": "Ana Oliveira",
        "telefone": "11987654323",
        "dataNascimento": "1990-02-15",
        "endereco": {
            "logradouro": "Rua das Oliveiras",
            "complemento": "Casa",
            "numero": "45",
            "CEP": "54321-678",
            "cidade": "Rio de Janeiro",
            "bairro": "Botafogo",
            "uf": "RJ"
        },
        "cargo": {
            "nome": "Administrador",
            "riscosOperacionais": [
                "Ergonomia"
            ],
            "empresa": "23456789000145"
        }
    },
    {
        "CPF": "34567890123",
        "nome": "Pedro Almeida",
        "telefone": "11987654327",
        "dataNascimento": "1985-03-10",
        "endereco": {
            "logradouro": "Rua das Palmeiras",
            "complemento": "Apto 202",
            "numero": "678",
            "CEP": "67890-123",
            "cidade": "São Paulo",
            "bairro": "Jardim Paulista",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Técnico de Enfermagem",
            "riscosOperacionais": [
                "Radiação"
            ],
            "empresa": "34567890000196"
        }
    },
    {
        "CPF": "45678901234",
        "nome": "Laura Costa",
        "telefone": "11987654328",
        "dataNascimento": "1992-07-25",
        "endereco": {
            "logradouro": "Avenida Brasil",
            "complemento": "",
            "numero": "654",
            "CEP": "54321-876",
            "cidade": "Rio de Janeiro",
            "bairro": "Laranjeiras",
            "uf": "RJ"
        },
        "cargo": {
            "nome": "Auxiliar Administrativo",
            "riscosOperacionais": [
                "Máquinas Pesadas"
            ],
            "empresa": "45678901000197"
        }
    },
    {
        "CPF": "56789012345",
        "nome": "Cláudia Rodrigues",
        "telefone": "11987654329",
        "dataNascimento": "1988-09-15",
        "endereco": {
            "logradouro": "Rua das Acácias",
            "complemento": "Bloco A",
            "numero": "321",
            "CEP": "67890-456",
            "cidade": "São Paulo",
            "bairro": "Vila Mariana",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Técnico de Laboratório",
            "riscosOperacionais": [
                "Queda de Altura"
            ],
            "empresa": "56789012000198"
        }
    },
    {
        "CPF": "67890123456",
        "nome": "Juliana Silva",
        "telefone": "11987654330",
        "dataNascimento": "1984-12-05",
        "endereco": {
            "logradouro": "Avenida Atlântica",
            "complemento": "",
            "numero": "222",
            "CEP": "98765-123",
            "cidade": "Rio de Janeiro",
            "bairro": "Copacabana",
            "uf": "RJ"
        },
        "cargo": {
            "nome": "Gerente de Projetos",
            "riscosOperacionais": [
                "Incêndio"
            ],
            "empresa": "67890123000199"
        }
    },
    {
        "CPF": "78945612300",
        "nome": "Carlos Santos",
        "telefone": "11987654331",
        "dataNascimento": "1978-01-20",
        "endereco": {
            "logradouro": "Rua das Palmeiras",
            "complemento": "Apto 303",
            "numero": "789",
            "CEP": "67890-321",
            "cidade": "São Paulo",
            "bairro": "Jardim Paulista",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Coordenador de Saúde",
            "riscosOperacionais": [
                "Exposição ao Calor"
            ],
            "empresa": "78945612000199"
        }
    },
    {
        "CPF": "87654321098",
        "nome": "Gustavo Pereira",
        "telefone": "11987654333",
        "dataNascimento": "1989-04-20",
        "endereco": {
            "logradouro": "Rua da Esperança",
            "complemento": "Apto 404",
            "numero": "345",
            "CEP": "12345-789",
            "cidade": "São Paulo",
            "bairro": "Vila Nova",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Especialista em TI",
            "riscosOperacionais": [
                "Exposição a Ruído"
            ],
            "empresa": "89012345000156"
        }
    },
    {
        "CPF": "89012345678",
        "nome": "Luciana Martins",
        "telefone": "11987654332",
        "dataNascimento": "1985-04-12",
        "endereco": {
            "logradouro": "Rua das Andorinhas",
            "complemento": "Casa 12",
            "numero": "456",
            "CEP": "23456-789",
            "cidade": "Rio de Janeiro",
            "bairro": "Ipanema",
            "uf": "RJ"
        },
        "cargo": {
            "nome": "Analista de Segurança",
            "riscosOperacionais": [
                "Vibrações"
            ],
            "empresa": "89012345000191"
        }
    },
    {
        "CPF": "98712365400",
        "nome": "Juliana Costa",
        "telefone": "11987654334",
        "dataNascimento": "1994-12-30",
        "endereco": {
            "logradouro": "Avenida Liberdade",
            "complemento": "Bloco B",
            "numero": "567",
            "CEP": "98765-678",
            "cidade": "São Paulo",
            "bairro": "Liberdade",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Supervisor de Produção",
            "riscosOperacionais": [
                "Radiação Ionizante"
            ],
            "empresa": "23456789000145"
        }
    },
    {
        "CPF": "98765432100",
        "nome": "João Souza",
        "telefone": "11987654322",
        "dataNascimento": "1975-11-22",
        "endereco": {
            "logradouro": "Avenida Paulista",
            "complemento": "",
            "numero": "987",
            "CEP": "98765-432",
            "cidade": "São Paulo",
            "bairro": "Bela Vista",
            "uf": "SP"
        },
        "cargo": {
            "nome": "Técnico de Segurança",
            "riscosOperacionais": [
                "Produtos Químicos"
            ],
            "empresa": "98765432000182"
        }
    }
]);