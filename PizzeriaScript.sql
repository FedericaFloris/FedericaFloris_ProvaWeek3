create database Pizzeria

create table Pizza(
CodicePizza int identity(1,1) not null,
Nome nvarchar(30) not null,
Prezzo decimal(6,2) not null check (Prezzo >0),
constraint PK_Pizza primary key (CodicePizza)
)

create table Ingrediente(
CodiceIngrediente int identity(1,1) not null,
Nome varchar(30) not null,
Costo decimal(6,2) not null check (Costo >0),
ScorteMagazzino int not null check (ScorteMagazzino >=0),
constraint PK_Ingrediente primary key (CodiceIngrediente)
)

create table PizzaIngrediente(
CodicePizza int not null constraint FK_CodicePizza foreign key references Pizza(CodicePizza),
CodiceIngrediente int not null constraint FK_CodiceIngrediente foreign key references Ingrediente(CodiceIngrediente),
constraint PK_PizzaIngrediente primary key (CodicePizza,CodiceIngrediente)
)

--insert into Pizza values('Margherita',5)
--insert into Pizza values('Bufala',7)
--insert into Pizza values('Diavola',6)
--insert into Pizza values('Quattro Stagioni',6.50)
--insert into Pizza values('Porcini',7)
--insert into Pizza values('Dionisio',8)
--insert into Pizza values('Ortolana',8)
--insert into Pizza values('Patate e Salsiccia',6)
--insert into Pizza values('Pomodorini',6)
--insert into Pizza values('Quattro Formaggi',7.50)
--insert into Pizza values('Caprese',7.50)
--insert into Pizza values('Zeus',7.50)


insert into Ingrediente values('Pomodoro',0.50,100)
insert into Ingrediente values('Mozzarella',1,80)
insert into Ingrediente values('Mozzarella di bufala',3,30)
insert into Ingrediente values('Spianata piccante',0.30,60)
insert into Ingrediente values('Fungi',0.10,200)
insert into Ingrediente values('Carciofi',0.50,110)
insert into Ingrediente values('Prosciutto cotto',0.50,100)
insert into Ingrediente values('Olive',0.10,300)
insert into Ingrediente values('Funghi porcini',1,100)
insert into Ingrediente values('Stracchino',0.80,20)
insert into Ingrediente values('Speck',0.50,100)
insert into Ingrediente values('Rucola',0.60,400)
insert into Ingrediente values('Grana',0.50,100)
insert into Ingrediente values('Verdure di stagione',0.50,200)
insert into Ingrediente values('Patate',0.50,500)
insert into Ingrediente values('Salsiccia',2.50,100)
insert into Ingrediente values('Pomodorini',0.50,600)
insert into Ingrediente values('Ricotta',3,100)
insert into Ingrediente values('Provola',1.50,200)
insert into Ingrediente values('Gorgonzola',1.50,100)
insert into Ingrediente values('Pomodoro fresco',0.50,300)
insert into Ingrediente values('Basilico',0.30,100)
insert into Ingrediente values('Bresaola',1.50,100)

--procedura inserimento Pizza
create procedure InserisciPizza
@Nome nvarchar(30),
@Prezzo decimal(6,2)
as
insert into Pizza values (@Nome,@Prezzo)
go


execute InserisciPizza'Margherita',5
execute InserisciPizza'Bufala',7
execute InserisciPizza'Diavola',6
execute InserisciPizza 'Quattro Stagioni',6.50
execute InserisciPizza 'Porcini',7
execute InserisciPizza 'Dionisio',8
execute InserisciPizza 'Ortolana',8
execute InserisciPizza 'Patate e Salsiccia',6
execute InserisciPizza 'Pomodorini',6
execute InserisciPizza 'Quattro Formaggi',7.50
execute InserisciPizza 'Caprese',7.50
execute InserisciPizza 'Zeus',7.50

create procedure InserisciPizzaIngrediente
@nomePizza nvarchar(30),
@nomeIngrediente nvarchar(30)
as
declare @CodiceIngrediente int
select @CodiceIngrediente = i.CodiceIngrediente
from Ingrediente i
where i.Nome=@nomeIngrediente

declare @CodicePizza int
select @CodicePizza = p.CodicePizza
from Pizza p
where p.Nome=@nomePizza

insert into PizzaIngrediente values(@CodicePizza,@CodiceIngrediente)
go

execute InserisciPizzaIngrediente 'Margherita','Pomodoro'
execute InserisciPizzaIngrediente 'Margherita','Mozzarella'
execute InserisciPizzaIngrediente 'Bufala','Pomodoro'
execute InserisciPizzaIngrediente 'Bufala','Mozzarella di Bufala'
execute InserisciPizzaIngrediente 'Diavola','Pomodoro'
execute InserisciPizzaIngrediente 'Diavola','Mozzarella'
execute InserisciPizzaIngrediente 'Diavola','Spianata Piccante'
execute InserisciPizzaIngrediente 'Quattro Stagioni','Pomodoro'
execute InserisciPizzaIngrediente 'Quattro Stagioni','Mozzarella'
execute InserisciPizzaIngrediente 'Quattro Stagioni','Funghi'
execute InserisciPizzaIngrediente 'Quattro Stagioni','Carciofi'
execute InserisciPizzaIngrediente 'Quattro Stagioni','Prosciutto Cotto'
execute InserisciPizzaIngrediente 'Quattro Stagioni','Olive'
execute InserisciPizzaIngrediente 'Porcini','Pomodoro'
execute InserisciPizzaIngrediente 'Porcini','Mozzarella'
execute InserisciPizzaIngrediente 'Porcini','Funghi Porcini'
execute InserisciPizzaIngrediente 'Porcini','Pomodoro'
execute InserisciPizzaIngrediente 'Dioniso','Pomodoro'
execute InserisciPizzaIngrediente 'Dioniso','Mozzarella'
execute InserisciPizzaIngrediente 'Dioniso','Stracchino'
execute InserisciPizzaIngrediente 'Dioniso','Speck'
execute InserisciPizzaIngrediente 'Dioniso','Rucola'
execute InserisciPizzaIngrediente 'Dioniso','Grana'
execute InserisciPizzaIngrediente 'Ortolana','Pomodoro'
execute InserisciPizzaIngrediente 'Ortolana','Mozzarella'
execute InserisciPizzaIngrediente 'Ortolana','Verdure di Stagione'
execute InserisciPizzaIngrediente 'Patate e Salsiccia','Mozzarella'
execute InserisciPizzaIngrediente 'Patate e Salsiccia','Patate'
execute InserisciPizzaIngrediente 'Patate e Salsiccia','Salsiccia'
execute InserisciPizzaIngrediente 'Pomodorini','Mozzarella'
execute InserisciPizzaIngrediente 'Pomodorini','Pomodorini'
execute InserisciPizzaIngrediente 'Ricotta','Pomodorini'
execute InserisciPizzaIngrediente 'Quattro Formaggi','Mozzarella'
execute InserisciPizzaIngrediente 'Quattro Formaggi','Provola'
execute InserisciPizzaIngrediente 'Quattro Formaggi','Gorgonzola'
execute InserisciPizzaIngrediente 'Quattro Formaggi','Grana'
execute InserisciPizzaIngrediente 'Caprese','Mozzarella'
execute InserisciPizzaIngrediente 'Caprese','Pomodoro Fresco'
execute InserisciPizzaIngrediente 'Caprese','Basilico'
execute InserisciPizzaIngrediente 'Zeus','Mozzarella'
execute InserisciPizzaIngrediente 'Zeus','Bresaola'
execute InserisciPizzaIngrediente 'Zeus','Rucola'

--Query
--1 Estrarre tutte le pizze con prezzo superiore a 6 euro
select *
from Pizza
where Prezzo > 6
--2 Estrarre la pizza/le pizze più costosa/e
select Pizza.Nome
from Pizza 
where Prezzo = (select Max(Prezzo)
                from Pizza p)
				
--3 Estrarre le pizze bianche
select p.Nome
from Pizza p 
where p.CodicePizza not in(select p.CodicePizza
                           from Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
                           join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
						   where i.Nome = 'pomodoro')
--4 Estrarre le pizze che contengono funghi(di qualsiasi tipo)
select p.Nome
from Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
     join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
where i.nome like 'Funghi%'

--Procedure
--3 Aggiornamento del prezzo di una pizza
create procedure AggiornamentoPrezzo
@NomePizza nvarchar(30),
@PrezzoPizza decimal(6,2)
as
begin 
update Pizza set Prezzo=@PrezzoPizza where Nome=@NomePizza
end
go

--prova
select*from Pizza
execute AggiornamentoPrezzo 'Margherita',4.00

--4 Eliminazione di un ingrediente da una pizza
create procedure EliminazioneIngrediente
@nomePizza varchar(30),
@nomeIngrediente varchar(30)

as
declare @CodicePizza int
select @CodicePizza= CodicePizza
from Pizza
where Nome = @nomePizza

declare @CodiceIngrediente int
select @CodiceIngrediente = CodiceIngrediente
from Ingrediente
where Nome=@nomeIngrediente

delete from PizzaIngrediente where CodicePizza = @CodicePizza and @CodiceIngrediente=CodiceIngrediente
go

--prova
select*from PizzaIngrediente
select*from Pizza
select*from Ingrediente

execute EliminazioneIngrediente 'Pomodorini','Pomodorini'

--5 Incremento del 10% del prezzo delle pizze contenenti un ingrediente
create procedure IncrementoPrezzo
@nomeIngrediente nvarchar(30)

as
declare @CodiceIngrediente int
select @CodiceIngrediente = CodiceIngrediente
from Ingrediente
where Nome = @nomeIngrediente


Update Pizza set Prezzo= Prezzo + (Prezzo * 0.1) where CodicePizza in (select CodicePizza from PizzaIngrediente where CodiceIngrediente=@CodiceIngrediente)

go
--prova
select*from Pizza
execute IncrementoPrezzo 'Gorgonzola'

--FUNZIONI
--1 Tabella Listino pizze (nome,prezzo) (parametri:nessuno)
create function ListinoPizze()
returns table
as
return
select Nome,Prezzo
from Pizza
--richiamo la funzione
select * from dbo.ListinoPizze()

--2 Tabella listino pizze (nome,prezzo) contenenti un ingrediente (parametri:nome ingrediente)
create function ListinoPizze1Ingrediente(@nomeIngrediente nvarchar(30))
returns table
as
return
select p.Nome,p.Prezzo
from Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
     join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
where i.Nome=@nomeIngrediente

--richiamo la funzione
select * from dbo.ListinoPizze1Ingrediente('Pomodoro')

--3 Tabella listino pizze (nome,prezzo) che non contengono un certo ingrediente (parametri:nome ingrediente)
create function ListinoPizzeCheNonHannoIngrediente(@nomeIngrediente nvarchar(30))
returns table
as

return
select p.Nome,p.Prezzo
from Pizza p 
where p.CodicePizza not in (select p.CodicePizza
                                  from  Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
                                  join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
								  where i.Nome = @nomeIngrediente)

--richiamo la funzione
select * from dbo.ListinoPizzeCheNonHannoIngrediente('Mozzarella di Bufala')

--4 Calcolo numero pizze contenenti un ingrediente (parametri:nome ingrediente)
create function NumeroPizze(@nomeIngrediente varchar(30))
returns int
as
begin 
declare @numeroPizzeConIngrediente int
select @numeroPizzeConIngrediente = Count(p.Nome)
from Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
     join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
where i.Nome = @nomeIngrediente

return @NumeroPizzeConIngrediente
end
go

--richiamo la funzione
select*from Ingrediente
select*from Pizza

select dbo.NumeroPizze('Mozzarella')



--5 Calcolo numero pizze che non contengono un ingrediente (parametri:codice ingrediente)

create function NumeroPizzeCheNonHannoIngrediente(@codiceIngrediente int)
returns int
as

begin 
declare @numeroPizzeSenzaIngrediente int
select @numeroPizzeSenzaIngrediente = Count(*)
from Pizza p 
where p.CodicePizza not in (select p.CodicePizza
                                  from  Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
                                  join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
								  where i.CodiceIngrediente= @codiceIngrediente)

return @numeroPizzeSenzaIngrediente
end
go

select dbo.NumeroPizzeCheNonHannoIngrediente(6)
select*from Ingrediente
--6 Calcolo numero ingredienti contenuti in una pizza (parametri: nome pizza)
create function NumeroIngredientiPizza(@nomePizza nvarchar(30))
returns int
as
begin

declare @ingredienti int
select @ingredienti=Count(*)
from Pizza p join PizzaIngrediente pi on p.CodicePizza=pi.CodicePizza
                                  join Ingrediente i on pi.CodiceIngrediente=i.CodiceIngrediente
where p.nome = @nomePizza

return @ingredienti
end
go

--richiamo la funzione
select dbo.NumeroIngredientiPizza('Margherita')







































