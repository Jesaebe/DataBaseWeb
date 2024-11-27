/* 1- Quais os funcionários não possuem nenhuma skill? */
db.funcionario.find({
	$or:[
		{skill: {$exists: false}}, 
		{skill: ""}, 
		{skill: null},
	]
});

/* 2- Quais os funcionários possuem algum hobby? Mostrar o nome e o hobby. */
db.funcionario.find({
	hobbies: {$exists: true, $ne: null}
},{
	_id: 0, 
	nome: 1, 
	hobbies:1,
});

/* 3- Seleciona os funcionários que não é vendedor, não mora em Vitória da Conquista e tem menos de 3 filhos.
Não mostrar os hobbies, as notas e as avaliações. */
db.funcionario.find({
	funcao: {$ne: "VENDEDOR"},
	"endereco.cidade": {$ne: "VITÓRIA DA CONQUISTA"},
	filhos: {$lt: 3}
},{
	hobbies: 0,
	notas: 0,
	avaliacoes: 0,
});

/* 4- Seleciona os funcionários com função de programador e de analista que ganham acima de R$ 2.000,00.
Classificar em ordem crescente pela função e nome do funcionário. Utilizar o operador sort. */
db.funcionario.find({
	funcao: {
		$in: ["PROGRAMADOR", "ANALISTA"]
	},
	salario: {$gt: 2000}
}).sort({
	funcao: 1, 
	nome: 1,
});

/* 5- Quais os funcionários têm como hobby futebol e tênis de mesa? Não mostrar o salário e a data de admissão.
Utilizar o operador $all. */
db.funcionario.find({
	hobbies: {
		$all: ["FUTEBOL", "TÊNIS DE MESA"]
	}
},{
	salario: 0, 
	admissao: 0,
});

/* Quais os funcionários têm 4 hobbies, sendo que pelo menos 1 hobby seja natação? Mostrar o nome e os
hobbies. Utilizar o operador $size. */
db.funcionario.find({
	$and: [
		{
			hobbies: "NATAÇÃO"
		},
		{
			hobbies: {$size: 4}
		},
	]
},{
	_id: 0,
	nome: 1, 
	hobbies: 1, 
});

/* 7- Quantos funcionários moram em Vitória da Conquista e possuem algum hobby? Utilizar a notação ponto. */
db.funcionario.find({
	"endereco.cidade": {$eq: "VITÓRIA DA CONQUISTA"},
	hobbies: {
		$ne: null, 
	}
}).count();

/* 8- Quais os funcionários com notas de produção e convívio acima de 7,5? Mostrar o nome, a função e as
notas. Utilizar a notação ponto. */
db.funcionario.find({
	$and: [
		{
			"notas.0.criterio": "PRODUÇÃO", 
			"notas.0.nota": {$gt: 7.5}
		},
		{
			"notas.1.criterio": "CONVÍVIO", 
			"notas.1.nota": {$gt: 7.5}
		},
	]
},{
	_id: 0,
	nome: 1, 
	funcao: 1, 
	notas: 1, 
});

/* 9- Responder a consulta anterior com o operador $elemMatch. */
db.funcionario.find({
	$and: [
		{notas: {
			$elemMatch: {criterio: "PRODUÇÃO", nota: {$gt: 7.5} }}
		},
		{notas: {
			$elemMatch: {criterio: "CONVÍVIO", nota: {$gt: 7.5} }}
		},
	]
},{
	_id: 0,
	nome: 1, 
	funcao: 1, 
	notas: 1, 
});

/* 10- Qual a primeira opção de hobby dos funcionários? Considerar que o primeiro elemento do array é a
primeira opção. Mostrar somente o nome e o hobby. Utilizar o operador $slice. */
db.funcionario.find({
	hobbies: {
		$exists: true, 
		$not: { $size: 0 } 
	},
	hobbies: {$ne: null }
},{
	_id: 0,
	hobbies: {$slice: 1}, 
	nome: 1, 
});

/* 11- Quais os funcionários têm 3 ou 4 feedbacks? Mostrar o nome e os feedbacks ordenado em ordem
decrescente pelo nome. */
db.funcionario.find({
	$or: [
		{feedbacks: {$size: 3}},
		{feedbacks: {$size: 4}},
	],
	feedbacks: {$exists: true}
},{
	_id: 0,
	nome: 1,
	feedbacks: 1,
}).sort({"nome": -1});

/* 12- Recuperar os funcionários que possuem os três maiores salários, excluindo o funcionário com o maior
salário. Não mostrar os hobbies, as notas, as avaliações, os feedbacks e o endereço. */
db.funcionario.find({},
{
	hobbies: 0,
	notas:0,
	avaliacoes: 0,
	feedbacks: 0,
	endereco: 0
}).sort({"salario": -1})
	.limit(3)
	.skip(1);
	