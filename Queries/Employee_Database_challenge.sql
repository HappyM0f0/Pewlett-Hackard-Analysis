--challenege code
Select e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
into title_ri
from employees as e
    inner join titles as t
    	on(e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
    first_name,
    last_name,
    title
INTO unique_title
FROM title_ri
ORDER BY emp_no, to_date DESC;

-- count the number of retiring titles in each dept
SELECT count(title), title
into retiring_titles
from unique_title
group by title
order by count desc

-- finding mentorship
SELECT DISTINCT ON(e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date
    t.title
-- INTO
SELECT DISTINCT ON(e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
    join dept_emp as de
        on(e.emp_no = de.emp_no)
	join titles as t
		on(e.emp_no = t.emp_no)
where (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
ORDER BY e.emp_no;