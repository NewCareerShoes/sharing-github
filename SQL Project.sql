--Objectives: 1. find how education level affects yearly income, 2. find how yearly income influences life satisfaction--

-- cleaning beliefs and demos tables --

-- beliefs --

/*initial count - 8660*/
select count(*)
from black_faith_beliefs bfb 

/* Not answered count - 35*/
select count(*)
from black_faith_beliefs bfb 
where satisfpersmod = 'Not answered' 

delete from black_faith_beliefs 
where satisfpersmod = 'Not answered'

/* final count - 8625*/
select count(*)
from black_faith_beliefs bfb 

-- demos --

/* initial count - 8660*/
select count(*)
from black_faith_demos bfd 

/*Not answered count - 421*/
select count(*)
from black_faith_demos bfd 
where  income = 'Not answered' or educcat2 = 'Not answered'

delete from black_faith_demos 
where income = 'Not answered' or educcat2 = 'Not answered'

/*final count - 8239*/
select count(*)
from black_faith_demos bfd 


-- comparing education to income --

--education totals and percentages - 8239--
select educcat2 as education_level, count(educcat2), round((count(educcat2)/8239.0*100),2) as total_percentage
from black_faith_demos
group by educcat2
order by count(educcat2) desc

--income totals and percentages - 8239--
select income, count(income), round((count(income)/8239.0*100),2) as total_percentage
from black_faith_demos
group by income
order by count(income) desc

/* count for education Less than high school - 418*/
select count(*)
from black_faith_demos bfd 
where educcat2 = 'Less than high school'

/* income for education Less than high school*/
select educcat2, income, count(income), round((count (bfd.income)/418.0 * 100),2) as total_percentage
from black_faith_demos bfd 
group by educcat2, income
having educcat2 = 'Less than high school'
order by count(income) desc

/*count for education High school diploma - 1336*/
select count(*)
from black_faith_demos bfd 
where educcat2 = 'High school diploma'

/*income for education High school diploma*/
select educcat2, income, count(income), round((count (bfd.income)/1336.0 * 100),2) as total_percentage
from black_faith_demos bfd 
group by educcat2, income
having educcat2 = 'High school diploma'
order by count(income) desc

/*count for education Some college credit, but no degree - 2083*/
select count(*)
from black_faith_demos bfd 
where educcat2 ='Some college credit, but no degree'

/*income for education Some college credit, but no degre*/
select educcat2, income, count(income), round((count (bfd.income)/2083.0 * 100),2) as total_percentage
from black_faith_demos bfd 
group by educcat2, income
having educcat2 = 'Some college credit, but no degree'
order by count(income) desc

/*count for education Associate''s degree (for example: AA, AS) - 912*/
select count(*)
from black_faith_demos bfd 
WHERE educcat2  = 'Associate''s degree (for example: AA, AS)'

/*income for education Associate's degree (for example: AA, AS)*/
select educcat2, income, count(income), round((count (bfd.income)/912.0 * 100),2) as total_percentage
from black_faith_demos bfd 
group by educcat2, income
having educcat2 = 'Associate''s degree (for example: AA, AS)'
order by count(income) desc

/*count for education Bachelor’s degree (for example: BA, BS) - 1835*/
select count(*)
from black_faith_demos bfd 
where educcat2 = 'Bachelor’s degree (for example: BA, BS)'

/*income for education Bachelor’s degree (for example: BA, BS)*/
select educcat2, income, count(income), round((count (bfd.income)/1835.0 * 100),2) as total_percentage
from black_faith_demos bfd 
group by educcat2, income
having educcat2 = 'Bachelor’s degree (for example: BA, BS)'
order by count(income) desc

/*count for education Post graduate degree - 1655*/
select count(*)
from black_faith_demos bfd 
where educcat2 ='Post graduate degree'

/*income for education Post graduate degree*/
select educcat2, income, count(income), round((count (bfd.income)/1655.0 * 100),2) as total_percentage
from black_faith_demos bfd 
group by educcat2, income
having educcat2 = 'Post graduate degree'
order by count(income) desc

-- income and education totals, organized by count --
select educcat2 as education_level, income, count(income)
from black_faith_demos
group by educcat2, income
order by count(income) desc


-- comparing income to life satisfaction --


--life satisfaction totals - 8625--
select satisfpersmod as life_satisfaction, count(satisfpersmod), round((count(satisfpersmod)/8625.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
group by satisfpersmod 
order by count(satisfpersmod) desc


/* count for income less than $10,000 - 914*/
select count(*)
from black_faith_demos bfd 
where income = 'Less than $10,000'

/* satisfaction for income less than $10,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/914.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = 'Less than $10,000'
order by count(bfd.income) desc

/*count for income $10,000 to less than $20,000 -952*/
select count(*)
from black_faith_demos bfd 
where income = '$10,000 to less than $20,000'

/*satisfaction for income $10,000 to less than $20,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/952.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$10,000 to less than $20,000'
order by count(bfd.income) desc

/*count for income $20,000 to less than $30,000 - 930*/
select count(*)
from black_faith_demos bfd 
where income = '$20,000 to less than $30,000'

/* satisfaction for income $20,000 to less than $30,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/930.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$20,000 to less than $30,000'
order by count(bfd.income) desc

/*count for income $30,000 to less than $40,000 - 864*/
select count(*)
from black_faith_demos bfd 
where income = '$30,000 to less than $40,000'

/* satisfation for income $30,000 to less than $40,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/864.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$30,000 to less than $40,000'
order by count(bfd.income) desc

/*count for income $40,000 to less than $50,000 - 751*/
select count(*)
from black_faith_demos bfd 
where income = '$40,000 to less than $50,000'

/*satisfaction for income 40,000 to less than 50,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/751.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$40,000 to less than $50,000'
order by count(bfd.income) desc

/*count for income $50,000 to less than $75,000 - 1408*/
select count(*)
from black_faith_demos bfd 
where income = '$50,000 to less than $75,000'

/* satisfaction for income $50,000 to less than $75,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/1408.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$50,000 to less than $75,000'
order by count(bfd.income) desc

/*count for income $75,000 to less than $100,000 - 931*/
select count(*)
from black_faith_demos bfd 
where income = '$75,000 to less than $100,000'

/*satisfaction for income $75,000 to less than $100,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/931.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$75,000 to less than $100,000'
order by count(bfd.income) desc

/*count for income $100,000 to less than $150,000 - 878*/
select count(*)
from black_faith_demos bfd 
where income = '$100,000 to less than $150,000'

/*satisfaction for income $100,000 to less than $150,000*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/878.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$100,000 to less than $150,000'
order by count(bfd.income) desc

/*count for income $150,000 or more - 611*/
select count(*)
from black_faith_demos bfd 
where income ='$150,000 or more'

/*satisfaction for income $150,000 or more*/
select bfb.satisfpersmod as satisfaction_rating, bfd.income, count(bfd.income), round((count (bfd.income)/611.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by bfb.satisfpersmod, bfd.income
having income = '$150,000 or more'
order by count(bfd.income) desc


--income, life satisfaction totals, organized by count--
select income, satisfpersmod as life_satisfaction, count(satisfpersmod), round((count(satisfpersmod)/8625.0 * 100),2) as total_percentage
from black_faith_beliefs bfb 
join black_faith_demos bfd 
on bfb.caseid = bfd.caseid 
group by income, satisfpersmod 
order by count(satisfpersmod) desc


