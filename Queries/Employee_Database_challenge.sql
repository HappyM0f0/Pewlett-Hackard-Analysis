-- drop table for rerun
DROP TABLE title_ri;

-- Titles retiring
SELECT em.emp_no,
    em.first_name,
    em.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO title_ri
FROM employees AS em
    LEFT JOIN titles AS ti
    	ON(em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
-- drop table for rerun
DROP TABLE unique_title;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
    first_name,
    last_name,
    title
INTO unique_title
FROM title_ri
ORDER BY emp_no, to_date DESC;
-- drop title for TS
DROP TABLE retiring_titles;
-- count the number of retiring titles in each dept
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY COUNT(title) DESC;
--drop table for TS
DROP TABLE  mentorship_eligibilty;

-- finding mentorship
SELECT DISTINCT ON(em.emp_no) em.emp_no,
    em.first_name,
    em.last_name,
    em.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees AS em
    LEFT JOIN dept_emp AS de
        ON(em.emp_no = de.emp_no)
	LEFT JOIN titles AS ti
		ON(em.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no;