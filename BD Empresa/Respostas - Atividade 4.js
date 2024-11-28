/* 1- Quais os funcionários do departamento 2 recebem salário entre R$ 2.000,00 e R$ 3.000,00? Mostrar o nome,
o departamento e o salário do funcionário. */
db.funcionario.aggregate([
  {
    $match: {
      $and: [
        {depto: 2},
        {salario: {$gte: 2000}},
        {salario: {$lte: 3000}},
      ]
    }
  },
  {
    $project: {
      _id: 0,
      nome: 1,
      depto: 1,
      salario: 1,
    }
  }
]);

/* 2- Quais funcionários foram admitidos no primeiro semestre depois de 2008? Mostrar o nome e o ano da data
de admissão do funcionário. Classificar os funcionários por data de admissão em ordem decrescente. Utilize
os operadores de expressão $year e $month para saber, respectivamente, o ano e o mês da data de
admissão. */

db.funcionario.aggregate([
  {
    $match: {
      $expr: {
        $and: [
          {$gt: [{$year: "$admissao"}, 2008]},
          {$lte: [{$month: "$admissao"}, 6]},
        ]
      }
    }
  },
  {
    $project: {
      _id: 0,
      nome: 1,
      admissao: 1,      
    }
  },
  {
    $sort: {admissao: -1}
  }
]);

/* 3- Quais os nomes dos funcionários por função? Mostrar somente os funcionários cuja função seja programador
e analista. Utilizar o operador $push.*/
db.funcionario.aggregate([
	{
		$match: {
			$or: [
				{funcao: "PROGRAMADOR"},
				{funcao: "ANALISTA"},
			]
		}
	},
	{
		$group: {
			_id: "$funcao",
			funcionarios: {
				$push: "$nome"
			}
		}
	}
]);

/* 4- Quais os nomes dos funcionários alocados por cidade? Utilizar a notação ponto para acessar a cidade e o
operador $push. */

db.funcionario.aggregate([
	{
		$group: {
			_id: "$endereco.cidade",
			funcionarios: {
				$push: "$nome"
			}
		}
	}
]);

/* 5- Qual a quantidade de funções por cada departamento? Contar as funções repetidas no departamento. Utilizar
os operadores $push e $size (ou $sum). */

db.funcionario.aggregate([
	{
		$group: {
			_id: "$depto",
			funcoes: {
				$push: "$funcao"
			}
		}
	},
	{
		$project: {
			_id: 1,
			total: {
				$size: "$funcoes"
			}
		}
	}
]);

db.funcionario.aggregate([
	{
		$group: {
			_id: "$depto",
			total: {
				$sum: 1
			}
		}
	}
]);

/* 6- Qual a quantidade de funções por cada departamento? Não contar as funções repetidas no departamento.
Utilizar os operadores $addToSet e $size. */
db.funcionario.aggregate([
	{
		$group: {
			_id: "$depto",
			funcoes: {
				$addToSet: "$funcao"
			}
		}
	},
	{
		$project: {
			_id: 1,
			total: {
				$size: "$funcoes"
			}
		}
	}
]);

/* 7- Qual o total de feedbacks por funcionário? Mostrar o nome do funcionário e o total de feedbacks dos 5
funcionários com maiores feedbacks. Utilizar os operadores $exists, $size, $sort e $limit. */
db.funcionario.aggregate([
	{
		$match: {
			feedbacks: {
				$exists: true,
				$ne: null
			}
		}
	},	
	{
		$project: {
			_id: "$nome",
			total: {
				$size: "$feedbacks"
			} 
		}
	},
	{
		$sort: {
			total: -1
		}
	},
	{
		$limit: 5
	}
]);

/* 8- Qual a data de admissão do funcionário mais antigo e o mais recente, cuja função é supervisor? */
db.funcionario.aggregate([
	{
		$match: {
			funcao: "SUPERVISOR"
		}
	},
	{		
		$group: {
			_id: null,
			menor: {
				$min: "$admissao"
			},
			maior: {
				$max: "$admissao"
			}
		}
	},
	{
		$project: {
			_id: 0,
			menor: 1,
			maior: 1,
		}
	}
]);

/* 9- Qual a média de filhos dos funcionários da empresa por função? Utilizar o operador $exists. */
db.funcionario.aggregate([
	{
		$match: {
			filhos: {
				$exists: true
			}
		}
	},
	{
		$group: {
			_id: "$funcao",
			media: {
				$avg: "$filhos"
			}			
		}
	}
]);

/* 10- Qual o valor total de salário pago aos funcionários que recebem salário entre R$ 2.000,00 e R$ 3.000,00 de
acordo com a função? Utilizar o operador $and. */

db.funcionario.aggregate([
  {
    $match: {
      $and: [
        {salario: {$gte: 2000}},
        {salario: {$lte: 3000}},
      ]
    }
  },
	{
		$group: {
			_id: "$funcao",
			total: {
				$sum: "$salario"
			}
		}
	},
]);

/* 11- Qual o valor total de salário pago aos funcionários de acordo com a função? Mostrar somente as funções as
quais possuem o total de salário entre R$ 2.000,00 e R$ 3.000,00. Utilizar o operador $and. */
db.funcionario.aggregate([
	{
		$group: {
			_id: "$funcao",
			total: {
				$sum: "$salario"
			}
		}
	},
  {
    $match: {
      $and: [
        {total: {$gte: 2000}},
        {total: {$lte: 3000}},
      ]
    }
  },
]);

/* 12- Qual a quantidade de ocorrência de cada hobby? Ordenar em ordem decrescente pela quantidade com o
operador $sort. Utilizar o operador $unwind para desmembrar o array. Mostrar somente os 3 primeiros
documentos com o operador $limit. */
db.funcionario.aggregate([
	{
		$unwind: "$hobbies"
	},
	{
		$group: {
			_id: "$hobbies",
			total: {
				$push: "$hobbies"
			}
		}
	}, 
	{
		$project: {
			_id: 1,
			qtd: {
				$size: "$total"
			},
		}
	},
	{
		$sort: {
			qtd: -1
		}
	},
	{
		$limit: 3
	}
]);