/* 1- Quais pacientes (nome, CPF e data de nascimento) foram atendidos no mês X? */
SELECT p.nome, p.CPF, p.dtNasc
FROM Paciente p 
INNER JOIN Agendamento a ON a.fk_CPF = p.CPF 
WHERE MONTH(a.dataRealizacaoExame) = :mes ;

/* 2- Qual o mês de 2024 que teve a maior quantidade de exames realizados? */
db.Agendamento.aggregate([
  {
    $match: { 
      $expr: {
        $eq: [{$year: "$dataRealizacao"}, 2024]
      }      
    }          
  },
  {
    $group: {
      _id: {
	      $month: "$dataRealizacao"
      },
      qtd: {
        $sum: 1
      }            
    }
  }
]);
	
/* 3- Qual foi o exame mais realizado em 2024? */
db.Agendamento.aggregate([
  {
    $lookup: {
      from: "Exames",
      localField: "exames._id",
      foreignField: "_id",
      as: "listaexames"
    }
  },
  {
    $match: {
      $expr: {
        $eq: [{$year: "$dataRealizacao"}, 2024]
      }
    }  
  },
  {
  	$unwind: "$listaexames"
	},
  {
    $group: {
      _id: "$listaexames.especialidade",
      qtd: {
        $push: "$listaexames.especialidade"
      }
    }
  },
  {
    $project: {
      _id: 1,
      total: {
          $size: "$qtd"
      }
    }
  },
  {
    $sort: {
       total: -1   
    }
  },
  {
    $limit: 1
  }
]);

/* 4- Qual foi o médico que mais gerou atestado no ano de 2024? */
SELECT m.nome, COUNT(*) QTD
FROM Medico m 
INNER JOIN Agendamento a ON a.fk_Medico = m.CRM 
WHERE a.status = :status AND YEAR(a.dataRealizacaoExame) = :ano
GROUP BY m.nome 
HAVING QTD = (
	SELECT MAX(QTD)
	FROM (
		SELECT m.nome, COUNT(*) QTD
		FROM Medico m 
		INNER JOIN Agendamento a ON a.fk_Medico = m.CRM 
		WHERE a.status = :status AND YEAR(a.dataRealizacaoExame) = :ano
		GROUP BY m.nome
	) Quantidade
); 

/* 5- Qual o total de pacientes que realizaram exame em 2024? Mostrar o total para cada mês do ano.*/
SELECT MONTHNAME(a.dataRealizacaoExame) Mes, COUNT(*) QTD 
FROM Agendamento a
WHERE YEAR(a.dataRealizacaoExame) = :ano
GROUP BY Mes;

/* 6- Qual a empresa que mais realizou agendamento no mês de junho/2024? */
SELECT e.CNPJ, e.razaoSocial, COUNT(*) QTD 
FROM Empresa e 
INNER JOIN Agendamento a ON a.fk_CNPJ = e.CNPJ
WHERE MONTH(a.dataAgendamento) = :mes AND YEAR(a.dataAgendamento) = :ano 
GROUP BY e.CNPJ, e.razaoSocial
HAVING QTD = (
	SELECT MAX(QTD)
	FROM (
		SELECT e.CNPJ, e.razaoSocial, COUNT(*) QTD 
		FROM Empresa e 
		INNER JOIN Agendamento a ON a.fk_CNPJ = e.CNPJ
		WHERE MONTH(a.dataAgendamento) = :mes AND YEAR(a.dataAgendamento) = :ano 
		GROUP BY e.CNPJ, e.razaoSocial
	) Quantidade
);

/* 7- Quais agendamentos ainda não foram finalizados? Exibir nome e CPF do paciente,
razão social e CNPJ da empresa, status, data de solicitação e o tipo do exame que foi
agendado. */
SELECT p.nome, p.CPF, e.razaoSocial, e.CNPJ, a.status, a.dataSolicitacao, a.tipoExame 
FROM Agendamento a 
INNER JOIN Paciente p ON p.CPF = a.fk_CPF 
INNER JOIN Empresa e ON e.CNPJ = a.fk_CNPJ 
WHERE a.status <> :status;

/* 8- Quantos agendamentos foram marcados para a data X? */
SELECT COUNT(*) QTD
FROM Agendamento a 
WHERE a.dataAgendamento = :data ;

/* 9- Quantos agendamentos da empresa com CNPJ X estão com status de finalizado? */
SELECT COUNT(*) QTD
FROM Empresa e 
INNER JOIN Agendamento a ON a.fk_CNPJ = e.CNPJ 
WHERE e.CNPJ = :cnpj AND a.status = :status;

/* 10- Qual a quantidade de agendamento realizado para cada tipo de exame em X ano? */
SELECT a.tipoExame, COUNT(*)
FROM Agendamento a 
WHERE YEAR(a.dataSolicitacao) = :ano
GROUP BY a.tipoExame;









