SELECT E.*, RATA_RATA_gaji FROM tSQL.dbo.EMPLOYEES E
JOIN (
select EMPLOYEE_ID, AVG(SALARY_REAL) RATA_RATA_GAJI
from FINANCES.dbo.PAYROLL P
GROUP BY EMPLOYEE_ID
) RATA_RATA
ON E.EMPLOYEE_ID=RATA_RATA.EMPLOYEE_ID












SELECT E.*, RATA_RATA_gaji FROM tSQL.dbo.EMPLOYEES E
CROSS APPLY (
select EMPLOYEE_ID, AVG(SALARY_REAL) RATA_RATA_GAJI
from FINANCES.dbo.PAYROLL P
WHERE P.EMPLOYEE_ID=E.EMPLOYEE_ID
) RATA_RATA