/*Select * from Puesto;
Select * from Caracteristica;
Select * from Oferente;
Select * from Nivel_Requerido;
Select * from Nivel_Habilidad;
Select * from Empresa;
Select * from Login;
Select * from Administrador;

select * from Nivel_Requerido p inner join Caracteristica e on p.id_caracteristica=e.idCaracteristica where p.porcentaje_r = 70;

SELECT porcentaje_r
FROM Nivel_Requerido INNER JOIN Caracteristica
ON Nivel_Requerido.id_caracteristica=Caracteristica.idCaracteristica;
select * from  Puesto p inner join Nivel_Requerido n on n.id_puesto=p.idPuesto  where  n.mes_registro = '2018-02-01';
/*select * from Oferente n inner join Login l on n.email_Ofe=l.identificacion  where  l.autorizado = 1; 
select * from Empresa n inner join Login l on n.email_Emp=l.identificacion  where  l.autorizado = 0;
SELECT * FROM Puesto where tipo = 1 ORDER BY idPuesto DESC LIMIT 1 ;*/
/*select * from Puesto p inner join Nivel_Requerido n  on n.id_puesto = p.idPuesto inner join
Caracteristica c on n.id_caracteristica = c.idCaracteristica where c.descCaract like '%%php%%' and  p.tipo=0 order by p.idPuesto;*/
/*select count(*) from Puesto;*/
/*select * from Puesto p inner join Empresa e on p.id_Emp = e.idEmpresa where e.localizacion like '%%her%%';*/
/*select *  from Oferente f 
inner join Nivel_Habilidad h on h.id_oferent= f.idOferente 
inner join Caracteristica c on h.id_caract = c.idCaracteristica inner join Nivel_Requerido r
on r.id_caracteristica = c.idCaracteristica inner join Puesto p on r.id_puesto = p.idPuesto 
where c.descCaract like '%%php%%' and h.porcentaje_h >= r.porcentaje_r ;*/

/*select * from Puesto p inner join Empresa e where p.id_Emp = e.idEmpresa and p.tipo = 1 order by idPuesto desc limit  3;*/

/*delete from Oferente where idOferente =111111;
delete from Login where identificacion='carlosa@gmail.com';*/
select * from Login;
select * from Puesto;
select * from Oferente;
select * from Empresa;
/*select * from Login l where l.identificacion='pali@gmail.com' and  l.clave ='P4L1' and l.autorizado=1;
update  Login l set l.autorizado=1 where l.identificacion;*/
/*select * from Caracteristica  where id_CaractPadre is null;*/
/*select * from Caracteristica c1 inner join Caracteristica c2  where c2.idCaracteristica is null;*/
/*select * from Caracteristica c1 inner join Caracteristica c2 on c1.id_CaractPadre=c2.idCaracteristica  where c2.idCaracteristica=2;*/
select * from Puesto p  inner join Nivel_Requerido n on  n.id_puesto = p.idPuesto  inner join Caracteristica c 
on n.id_caracteristica = c.idCaracteristica inner join Empresa e on p.id_Emp=e.idEmpresa where c.idCaracteristica=16 and n.porcentaje_r  <= 60;