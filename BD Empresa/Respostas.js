1- db.funcionario.find({
	$or:[
		{skill: {$exists: false}}, 
		{skill: ""}, 
		{skill: null},
	]
});

2- db.funcionario.find({
	hobbies: {$exists: true, $ne: null}
},{
	_id: 0, 
	nome: 1, 
	hobbies:1,
});

3- db.funcionario.find({
	funcao: {$ne: "VENDEDOR"},
	"endereco.cidade": {$ne: "VITÓRIA DA CONQUISTA"},
	filhos: {$lt: 3}
},{
	hobbies: 0,
	notas: 0,
	avaliacoes: 0,
});

4- db.funcionario.find({
	funcao: {
		$in: ["PROGRAMADOR", "ANALISTA"]
	},
	salario: {$gt: 2000}
}).sort({
	funcao: 1, 
	nome: 1,
});

5- db.funcionario.find({
	hobbies: {
		$all: ["FUTEBOL", "TÊNIS DE MESA"]
	}
},{
	salario: 0, 
	admissao: 0,
});

6- db.funcionario.find({
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

7- db.funcionario.find({
	"endereco.cidade": {$eq: "VITÓRIA DA CONQUISTA"},
	hobbies: {
		$ne: null, 
	}
}).count();

8- db.funcionario.find({
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

9- db.funcionario.find({
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

10- db.funcionario.find({
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

11- db.funcionario.find({
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

12- db.funcionario.find({},
{
	hobbies: 0,
	notas:0,
	avaliacoes: 0,
	feedbacks: 0,
	endereco: 0
}).sort({"salario": -1})
	.limit(3)
	.skip(1);
	