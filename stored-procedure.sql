CREATE DEFINER=`root`@`localhost` PROCEDURE `suppliers`()
BEGIN
select s.SUPP_ID, s.SUPP_NAME, avg(r.RAT_RATSTARS) as rating, case 
when avg(r.RAT_RATSTARS)=5 then 'Excellent Service'
when avg(r.RAT_RATSTARS)>4 then 'Good Service'
when avg(r.RAT_RATSTARS)>2 then 'Average Service'
else 'Poor Service' end as Type_of_Service from supplier as s
inner join supplier_pricing as sp on s.SUPP_ID=sp.SUPP_ID
inner join `order` as o on o.PRICING_ID=sp.PRICING_ID
inner join rating as r on o.ORD_ID=r.ORD_ID
group by s.SUPP_ID;
END