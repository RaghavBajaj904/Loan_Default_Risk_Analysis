USE loan_default_risk;

-- OVERALL DEFAULT RATE
SELECT FORMAT(COUNT(*),0) as total_applications, FORMAT(SUM(default_flag),0) as defaulted_applications, ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned;

-- CUSTOMER SEGMENTATION ANALYSIS
-- Income Category
SELECT CASE
        WHEN annual_inc < 40000 THEN '<$40K'
        WHEN annual_inc < 65001 THEN '$40–65K'
        WHEN annual_inc < 100001 THEN '$65–100K'
        WHEN annual_inc < 150001 THEN '$100–150K'
        WHEN annual_inc < 250001 THEN '$150–250K'
        ELSE '$250K+'
    END AS income_range,	
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications,
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY income_range
ORDER BY default_rate DESC;

-- FICO Score
SELECT CASE
	WHEN fico_score < 580 THEN '< 580'
    WHEN fico_score < 670 THEN '612-669'
    WHEN fico_score < 740 THEN '670-739'
    WHEN fico_score < 800 THEN '740-799'
    ELSE '800+' END as fico_category,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY fico_category
ORDER BY default_rate DESC;

-- DTI
SELECT CASE
	WHEN dti < 20 THEN '<20%'
    WHEN dti < 36 THEN '20–35%'
    WHEN dti < 44 THEN '36–43%'
    WHEN dti < 51 THEN '44–50%'
    ELSE '50+' END as dti_range,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY dti_range
ORDER BY default_rate DESC;

-- Grade
SELECT grade,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY grade
ORDER BY default_rate DESC;

-- Sub grade
SELECT sub_grade,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY sub_grade
ORDER BY default_rate DESC;

-- Emp length
SELECT emp_length,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY emp_length
ORDER BY default_rate DESC;

-- home_ownership
SELECT home_ownership,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY home_ownership
ORDER BY default_rate DESC;

-- Verification status
SELECT verification_status,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY verification_status
ORDER BY default_rate DESC;

-- Purpose
SELECT purpose,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY purpose
ORDER BY default_rate DESC;

-- term
SELECT term,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY term
ORDER BY default_rate DESC;


-- Interest rate
SELECT CASE 
	WHEN int_rate < 10 THEN '<10%'
    WHEN int_rate <= 15 THEN '10–15%'
    WHEN int_rate <= 20 THEN '16–20%'
    ELSE '20%+' END as int_rate_category,    
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY int_rate_category
ORDER BY default_rate DESC;


-- Loan amount
SELECT CASE
    WHEN loan_amnt < 10000 THEN '$0–10K'
    WHEN loan_amnt < 20000 THEN '$10–20K'
    WHEN loan_amnt < 30000 THEN '$20–30K'
    ELSE '$30–40K'
END as loan_amnt_category,
FORMAT(COUNT(*),0) as total_applications,
FORMAT(SUM(default_flag),0) as defaulted_applications, 
ROUND((SUM(default_flag) / COUNT(*)) * 100, 2) as default_rate
FROM loan_data_cleaned
GROUP BY loan_amnt_category
ORDER BY default_rate DESC;