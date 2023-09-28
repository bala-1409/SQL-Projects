use batch74

use Projects


select Count (*) from [dbo].[account]

select Count (*) from [dbo].[card]

select Count (*) from [dbo].[client]

select Count (*) from [dbo].[disp]

select Count (*) from [dbo].[district]

select Count (*) from [dbo].[loan]

select Count (*) from [dbo].[order]

select Count (*) from [dbo].[transaction_data]


select  * into  loan_trans  from 
(select td.*,ln.loan_id,ln.date as loan_date,ln.amount as loan_amount,
ln.duration as loan_duration,ln.payments as loan_payments,ln.status as loan_status from loan ln 
join transaction_data td on ln.account_id=td.account_id)A;

select * from loan_trans

select * into acc_ord from 
(select o.*,acc.date as account_date,acc.district_id as account_district_id,acc.frequency from account 
acc left join [order] o on acc.account_id=o.account_id)B; 

select * into  card_disp from 
(select card .*,disp.account_id,disp.client_id as disposition_client_id,
disp.type as disposition_type from card card 
join disp disp on card .disp_id=disp.disp_id)C;


select  * into  card_disp_clent from 
(select * from card_disp cd join client c on cd.disposition_client_id=c.client_id)D;

select * into card_disp_client_dist from 
(select * from card_disp_clent cdc join district dist on cdc.district_id=dist.A1)E;


select * into acc_ord_card_disp_client_dist  from 
(select cdcd.*,ao.order_id,ao.bank_to,ao.account_to,
ao.amount,ao.k_symbol,ao.account_date,ao.account_district_id,
ao.frequency from acc_ord ao left join card_disp_client_dist cdcd on ao.account_id=cdcd.account_id)F;

select * from acc_ord_card_disp_client_dist aocdcd
join loan_trans lt on lt.account_id= aocdcd.account_id 

select count(*) from acc_ord_card_disp_client_dist aocdcd