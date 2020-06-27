create database dbinfox;
use dbinfox;

create table tblusuarios
(
	iduser int primary key,
    usuario varchar(50) not null,
    fone varchar(15),
    login varchar(15) not null unique,
    senha varchar(15) not null
);
describe tblusuarios;

-- create
insert into tblusuarios(iduser,usuario,fone,login,senha) values (1, 'Matheus Fernandes Rodrigues', '1234-5678','matheusfr','123456');
insert into tblusuarios(iduser,usuario,fone,login,senha) values (2, 'Administrador', '2345-6789','admin','admin');
insert into tblusuarios(iduser,usuario,fone,login,senha) values (3, 'Adminissdtrador', '2345-6789','asdf','admiasdan');
-- read
select * from tblusuarios;
-- update
update tblusuarios set fone = '9876-5432' where iduser = 2; 
-- delete
delete from tblusuarios where iduser = 3;

create table tblclientes
(
	idcli int primary key auto_increment,
    nomecli varchar(50) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);
describe tblclientes;
select * from tblclientes;
insert into tblclientes (nomecli, endcli, fonecli, emailcli) values ('Jimbo', 'Rua teste', '(13)1234-5678', 'jimbo@neutron.com');

create table tblos 
(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
    defeito varchar(150) not null,
    servico varchar(150),
    tecnico varchar(30),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references tblclientes(idcli)
);
describe tblos;
select * from tblos;
insert into tblos (equipamento , defeito ,  servico ,  tecnico , valor, idcli) values ('Notebook', 'Não liga', 'Troca de fonte', 'Zé',50.50, 1);

select o.os, equipamento, defeito, servico, valor, c.nomecli,fonecli from tblos o inner join tblclientes c on o.idcli = c.idcli;