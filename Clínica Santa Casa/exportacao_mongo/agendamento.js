use clinicaSantaClara

db.Agendamento.insertMany([
	{
		"dataSolicitacao" : "2023-11-01",
		"dataAgendamento" : "2023-11-01",
		"dataRealizacao" : "2023-11-02",
		"paciente" : "56789012345",
		"empresa" : "56789012000198",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/56789012345/",
		"medico" : "CRM002",
		"tipoExame" : "admissional",
		"exames": [1]
	},
	{
		"dataSolicitacao" : "2023-11-02",
		"dataAgendamento" : "2023-11-02",
		"dataRealizacao" : "2023-11-03",
		"paciente" : "67890123456",
		"empresa" : "67890123000199",
		"status" : "aguardando_resultados",
		"aso" : null,
		"medico" : "CRM001",
		"tipoExame" : "periodico",
		"exames": [2]
	},
	{
		"dataSolicitacao" : "2024-08-01",
		"dataAgendamento" : "2024-04-01",
		"dataRealizacao" : "2024-08-02",
		"paciente" : "12345678901",
		"empresa" : "12345678000195",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/12345678901/",
		"medico" : "CRM001",
		"tipoExame" : "admissional",
		"exames": [1]
	},
	{
		"dataSolicitacao" : "2024-08-02",
		"dataAgendamento" : "2024-04-02",
		"dataRealizacao" : "2024-08-03",
		"paciente" : "98765432100",
		"empresa" : "12345678000195",
		"status" : "aguardando_parecer_médico",
		"aso" : null,
		"medico" : "CRM001",
		"tipoExame" : "periodico",
		"exames": [2]
	},
	{
		"dataSolicitacao" : "2024-08-03",
		"dataAgendamento" : "2024-08-03",
		"dataRealizacao" : "2024-08-04",
		"paciente" : "23456789012",
		"empresa" : "98765432000182",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/23456789012/",
		"medico" : "CRM002",
		"tipoExame" : "demissional",
		"exames": [2, 3]
	},
	{
		"dataSolicitacao" : "2024-08-05",
		"dataAgendamento" : "2024-08-05",
		"dataRealizacao" : "2024-08-06",
		"paciente" : "34567890123",
		"empresa" : "34567890000196",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/34567890123/",
		"medico" : "CRM001",
		"tipoExame" : "admissional",
		"exames": [4]
	},
	{
		"dataSolicitacao" : "2024-08-06",
		"dataAgendamento" : "2024-08-06",
		"dataRealizacao" : "2024-08-07",
		"paciente" : "45678901234",
		"empresa" : "45678901000197",
		"status" : "aguardando_resultados",
		"aso" : null,
		"medico" : "CRM002",
		"tipoExame" : "periodico",
		"exames": [5]
	},
	{
		"dataSolicitacao" : "2024-08-08",
		"dataAgendamento" : "2024-08-08",
		"dataRealizacao" : "2024-08-09",
		"paciente" : "78945612300",
		"empresa" : "78945612000199",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/78945612300/",
		"medico" : "CRM003",
		"tipoExame" : "admissional",
		"exames": [8]
	},
	{
		"dataSolicitacao" : "2024-08-09",
		"dataAgendamento" : "2024-08-09",
		"dataRealizacao" : "2024-08-10",
		"paciente" : "89012345678",
		"empresa" : "89012345000191",
		"status" : "aguardando_resultados",
		"aso" : null,
		"medico" : "CRM001",
		"tipoExame" : "periodico",
		"exames": [9]
	},
	{
		"dataSolicitacao" : "2024-08-10",
		"dataAgendamento" : "2024-08-10",
		"dataRealizacao" : "2024-08-11",
		"paciente" : "11223344556",
		"empresa" : "56789012000198",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/11223344556/",
		"medico" : "CRM004",
		"tipoExame" : "admissional",
		"exames": [12]
	},
	{
		"dataSolicitacao" : "2024-08-15",
		"dataAgendamento" : "2024-08-15",
		"dataRealizacao" : "2024-08-16",
		"paciente" : "87654321098",
		"empresa" : "89012345000156",
		"status" : "finalizado",
		"aso" : "http://www.aso-online.com.br/87654321098/",
		"medico" : "CRM003",
		"tipoExame" : "admissional"
	},
	{
		"dataSolicitacao" : "2024-08-16",
		"dataAgendamento" : "2024-08-16",
		"dataRealizacao" : "2024-08-17",
		"paciente" : "98712365400",
		"empresa" : "89012345000191",
		"status" : "aguardando_resultados",
		"aso" : null,
		"medico" : "CRM003",
		"tipoExame" : "periodico",
		"exames": [11]
	}
]);