--Atividades da semana 3
-- Cadastrar o novo colaborador Fulano de Tal no novo projeto BI para exercer o papel de Especialista de Negócios.
--1) Colaborador:
INSERT INTO brh.colaborador (matricula, cpf, nome, salario, departamento, cep, logradouro)
VALUES ('F789', '12312312312', 'Fulano de Tal', 5000.00, 'SEDES', '15000-000', 'Rua Silva Jardim, 123');

--Papel: 
INSERT INTO brh.papel (id, nome) 
VALUES (8, 'Especialista em Tecnlogia da Informação');

--Projeto:
INSERT INTO brh.projeto (id, nome, responsavel, inicio, fim)
VALUES (5, 'BI', 'F789', to_date('2023-11-14', 'yyyy-mm-dd'), to_date('2024-08-25', 'yyyy-mm-dd'));

-- Endereco: 
INSERT INTO brh.endereco (cep, uf, cidade, bairro)
VALUES ('15000-000', 'SP','São José do Rio Preto', 'Centro');

-- Telefone:
INSERT INTO brh.telefone_colaborador (numero, colaborador, tipo)
VALUES ('(61) 99999-9999', 'F789', 'C'),
       ('(61) 3030-4040', 'F789', 'R');

-- E-mail:
INSERT INTO brh.email_colaborador (email, colaborador, tipo)
VALUES ('fulano@email.com', 'F789', 'P'),
       ('fulano.tal@brh.com', 'F789', 'T');

-- Dependentes:
INSERT INTO brh.dependente (cpf, nome, data_nascimento, parentesco, colaborador)
VALUES ('111.111.111-11', 'Beltrana de Tal', to_date('2021-07-01', 'yyyy-mm-dd'), 'Filho(a)', 'F789'),
('222.222.222-22', 'Cicrana de Tal', to_date('1982-11-21', 'yyyy-mm-dd'), 'Filho(a)', 'F789');

-- Atribuicao:
INSERT INTO brh.atribuicao (projeto, colaborador, papel) 
VALUES (5, 'F789', 8);

--2) Relatorio de conjuges
SELECT c.matricula AS matricula_colaborador,
d.nome AS nome_dependente,
d.data_nascimento AS data_nascimento_dependente
FROM brh.colaborador c
JOIN brh.dependente d ON c.matricula = d.colaborador
WHERE PARENTESCO='Conjuge';

--3) Relatorio de contatos telefonicos
SELECT c.matricula AS matricula_colaborador, tc.numero AS telefone, tc.tipo AS tipo
FROM brh.colaborador c
JOIN brh.telefone_colaborador tc  ON c.matricula = tc.colaborador 
WHERE tc.tipo ='M' OR  tc.tipo ='C' ORDER BY c.matricula;

--4) Listar colaborador com maior salario
SELECT c.nome AS nome_colaborador, 
c.salario AS salario_colaborador
FROM brh.colaborador c
WHERE c.salario = (SELECT MAX(salario) FROM brh.colaborador);

