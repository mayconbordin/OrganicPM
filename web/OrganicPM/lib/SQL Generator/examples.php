<?php


include_once 'SQLGenerator.class.php';

$sql = new SQL();

/*
$sql
	->select()
		->pro()->codproduto()
		->cli()->codcliente()
		->count()->codcliente()->as()->totalVisits()
		->sum()->pro()->totalproduto()->as()->total()
	->from()
		->produto('pro')
		->cliente('cli')
	->begin()
		->where()
			->codproduto()->btw()->val(10)->and()->val(20)
		->and()
			->eq('(1563245255 - visit_date)')->leq()->val(600)
	->end()
	->or()
	->begin()
			->from_unixtime('visit_date', "'%Y-%d-%m'")->equ()->val('2010-15-05')
		->and()
			->cli()->nomcliente()->like()->val('AD%')
		->and()
			->cli()->codcliente()->notIn()->vals(1, 2, 3, 4)
	->end()
	->groupBy()
		->codproduto()
		->cli()->codcliente()
	->having()
		->begin()
			->sum()->totalproduto()->equ()->val(100)
		->end()
		->or()
		->begin()
			->sum()->totalproduto()->equ()->val(500)
		->end()
	->orderBy()
		->codcliente()->desc()
		->pro()->codproduto()
	->limit(10)
	->offset(5)
	
	->build();
	
	echo $sql->getSql();
	
	*/
	
	
	
	
	
	
	/*
$sql
	->update()
		->produto()
		->set()
			->nomproduto()->equ()->val('cadeira')
			->codproduto()->equ()->val(100)
			->produto_count()->equ()->eq('produto_count + 1')
		->where()
			->codproduto()->equ()->val(100)
		->limit(1)
	
	->build();
	
	echo $sql->getSql();
	*/
	
	/*
	
$sql
	->insert()
		->into()
			->produto()
				->codproduto()
				->nomproduto()
				->qtdproduto()
		->values(10, 'cadeira', 120)
	->build();
	
	echo $sql->getSql();
	
	*/
	/*
$sql
	->delete()
	->from()
		->produto()
	->where()
		->codproduto()->geq()->val(100)
	->and()
		->nomproduto()->like()->val('A%')
	->limit(10)
	->build();
	
	echo $sql->getSql();
	
	
	*/
/*
$sql	
	->select()
		->sum()->quantproduto()->as()->qtd()
		->sum()->totalproduto()->as()->total()
	->from()
		->item_pedido()
	->where()
		->codproduto()->equ()->val(10)
	->and()
		->nropedido()->in()
						->open()
							->select()
								->nropedido()
							->from()
								->pedido()
							->where()
								->datpedido()->geq()->val('10/10/2009')
							->and()
								->datpedido()->leq()->val('20/10/2009')
						->close()
	->and()
		->nomproduto()->equ()->val('cadeira')
->build();
	
	echo $sql->getSql();
	*/

/*
	
$sql
	->update()
		->orders()
	->set()
		->product()->equ()
						->open()
							->select()
								->item_name()
							->from()
								->items()
							->where()
								->item_no()->equ()->val(2401)
						->close()
	->where()
		->order_no()->equ()->val(1002)
		
	->build();
	
	echo $sql->getSql();
	
	*//*
define("TBL_USERS", "usuarios");

$table = TBL_USERS;

class teste {
	public $tbl_users;

	function __construct(){
		$this->tbl_users = TBL_USERS;
	}

	function get(){
	$sql = new SQL();
		$sql
	->select()
	->from()
		->{$this->tbl_users}()
	->build();

	
	echo $sql->getSql();
	}

}

$teste = new teste();
$teste->get();
*/

/*
$sql
	->select()
		->count()->as()->numUsers()
	->from()
		->users()
	->build();
	echo $sql->getSql();

	*/
/*
$vals = array(100, 200, 300);

$sql
	->delete()
	->from()
		->users()
	->where()
		->codproduto()->in()->vals($vals)
	->build();
	echo $sql->getSql();
	
	*/
/*
$tbl_users = "users";
define("TBL_USERS", "users");
$username = "blacknroll";
$date = time();
define("USER_TIMEOUT", 500);

$sql

   					->select()
   						->user_name()
   					->from()
   						->{TBL_USERS}()
   					->where()
   						->user_name()->equ()->{$username}()
   					->and()
   						->eq('('.$date.' - user_last_activity)')->leq()->val(USER_TIMEOUT)
					->and()
						->user_name()->regexp()->val('[[:digit:]]')
->build();
	echo $sql->getSql();
	
	
	*/
	
	
	/*
$sql
	->insert()
		->into()
			->produto()
		->values("null", 'cadeira', 120)
	->build();
	
	echo $sql->getSql();
	
	*/
/*
$sql
					->insert()
						->into()
							->ge_pessoas()
								->nome()
								->data_nasc()
								->cpf()
								->endereco()
								->bairro()
								->email_1()
								->email_2()
								->naturalidade()
								->cidade()
								->cep()
								->pais()
								->uni_fed_cod()
								->numero()
								->complemento()
								->est_civ_cod()
								->sexo()
							->values('Ridley Scott', '10/10/1990', 00506703010, 'Rua das Flores', 'Cruzeiro', 'scott@gmail.com', '', 'brasileiro', 'Sao Paulo', 90000087, 'Brasil', 1, 77, '', 2, 'masculino')
							->build();
	
	echo $sql->getSql();*/
	

	/*
$sql
					->select()
						->count()->as()->numUF()
					->from()
						->ge_unidades_federativas()
					->where()
						->uni_fed_cod()->equ()->val(1)
					->build();
	
	echo $sql->getSql();*/
	


/*

$sql
					->insert()
						->into()
							->ge_pessoas()
								->nome()
								->data_nasc()
								->cpf()
								->endereco()
								->bairro()
								->email_1()
								->email_2()
								->naturalidade()
								->cidade()
								->cep()
								->pais()
								->uni_fed_cod()
								->numero()
								->complemento()
								->est_civ_cod()
								->sexo()
							->val('Ridley Scott')
							->val('10/10/1990')
							->val(00506703010)
							->val('Rua das Flores')
							->val('Cruzeiro')
							->val('scott@gmail.com')
							->val('')
							->val('brasileiro')
							->val('Sao Paulo')
							->val(90000087)
							->val('Brasil')
							->val(1)
							->val(77)
							->val('')
							->val(2)
							->val('masculino')
							->build();
	
	echo $sql->getSql();
	
	
	*/
/*
$seq = "pessoa_cod_seq.currval";
$sql
	->select()
		->$seq()
	->from()
		->dual()
	->build();

	echo $sql->getSql();
	
	*/
	/*
$sql
					->select()
						->count()->as()->num()
					->from()
						->ge_pessoas()
					->where()
						->cpf()->equ()->val(00806802080)
					->build();
	
	echo $sql->getSql();*/
	

$sql
					->insert()
						->into()
							->ge_pessoas()
								->nome()
							->string('Ridley Scott')
							->build();
	
	echo $sql->getSql();