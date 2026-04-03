-- Given three tabels--   salesperson, orders, comoany--     
-- “Mujhe un salespersons ko poori tarah remove karna hai jinhone kabhi bhi RED ko sell kiya ho”

-- 1. Anti-Join Pattern 

-- ✔ NOT IN
where sales_id NOT IN (...)


  select name
from salesperson
where sales_id NOT IN (
    select o.sales_id
    from orders o
    join company c
    on o.com_id = c.com_id
    where c.name = 'RED'
);
  
-- ✔ NOT EXISTS (best practice)
where NOT EXISTS (...)

  
select s.name 
from salesperson as s 
where  not exists (
    select 1 
    from orders as o
    join company as c 
    on c.com_id = o.com_id
    where s.sales_id = o.sales_id
    and c.name = 'RED'
);

  
-- ✔ LEFT JOIN + IS NULL
LEFT JOIN ...
WHERE ... IS NULL


  
select s.name
from salesperson s
left join orders o
  on s.sales_id = o.sales_id
left join company c
  on o.com_id = c.com_id
  and c.name = 'RED'
where c.com_id is null;

--👉 Ye teenon ko bolte hain anti-join techniques

-- Ye anti-join problem hai
-- != se kaam nahi chalega
-- “Exclude entire entity, not just rows”

-- wrong approch
select s.name 
from salesperson as s 
  join (
    select c.name, o.sales_id 
    from orders as o
    join company as c 
    on c.com_id = o.com_id
) as n
on n.sales_id = s.sales_id
where n.name != 'RED' and n.name is not null;

-- 
