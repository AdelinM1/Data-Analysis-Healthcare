-- 1. What is the average billing amount by medical condition?
SELECT Medical_Condition, AVG(Billing_Amount) AS Avg_Billing_Amount
FROM health
GROUP BY Medical_Condition
ORDER BY Avg_Billing_Amount DESC;

-- 2. What is the top 5 hospitals by patients?
SELECT Hospital, COUNT(*) AS Total_Patients
FROM health
GROUP BY Hospital
ORDER BY Total_Patients DESC
LIMIT 5;

-- 3. What is the number of mounthly addmission?
SELECT DATE_FORMAT(Date_of_Admission, '%Y-%m') AS Admission_Month, COUNT(*) AS Total_Admissions
FROM health
GROUP BY Admission_Month
ORDER BY Admission_Month;

-- 4. What is the average age by medical condition?
SELECT Medical_Condition, AVG(Age) AS Avg_Age
FROM health
GROUP BY Medical_Condition
ORDER BY Avg_Age DESC;

-- 5. What is the total number of patients by blood type?
SELECT Blood_Type, COUNT(*) AS Total_Patients
FROM health
GROUP BY Blood_Type
ORDER BY Total_Patients DESC;

-- 6. What is the billing distribution by insurance provider?
SELECT Insurance_Provider, SUM(Billing_Amount) AS Total_Billing
FROM health
GROUP BY Insurance_Provider
ORDER BY Total_Billing DESC;

-- 7. What are the most common medical conditions by age group?
SELECT CASE 
           WHEN Age < 18 THEN 'Child'
           WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult'
           WHEN Age BETWEEN 36 AND 60 THEN 'Adult'
           ELSE 'Senior'
       END AS Age_Group, 
       Medical_Condition, 
       COUNT(*) AS Condition_Count
FROM health
GROUP BY Age_Group, Medical_Condition
ORDER BY Age_Group, Condition_Count DESC;

-- 8. How affective are the hospital rooms being utilized?
SELECT Room_Number, 
       COUNT(*) AS Total_Admissions, 
       SUM(DATEDIFF(Discharge_Date, Date_of_Admission)) AS Total_Days_Occupied,
       AVG(DATEDIFF(Discharge_Date, Date_of_Admission)) AS Avg_Stay_Per_Admission
FROM health
GROUP BY Room_Number
ORDER BY Total_Days_Occupied DESC;