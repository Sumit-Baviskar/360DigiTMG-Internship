
describe cars;

select count(*) from cars;



select * from cars;


use cars;
select * FROM cars;

DESCRIBE cars;

# ===================================== CATEGORRICAL DATA =================================================

# ---------------------------------------- MACHINE_ID -----------------------------------------------------

# MODE 

SELECT COUNT(MACHINE_ID) AS MACHINE_ID_Mode
FROM cars
WHERE MACHINE_ID IS NOT NULL
GROUP BY MACHINE_ID
ORDER BY COUNT(*) DESC
limit 1;

# UNIQUE DISTINCT VALUE  

SELECT 
   MACHINE_ID, COUNT(MACHINE_ID) AS MACHINE_ID_Unique_Categories
from cars
GROUP BY MACHINE_ID ;


# ------------------------------------ Assembly_Line_No ---------------------------------------------------

# MODE 

SELECT COUNT(Assembly_Line_No) AS Assembly_Line_No_Mode
FROM cars
WHERE Assembly_Line_No IS NOT NULL
GROUP BY Assembly_Line_No
ORDER BY COUNT(*) DESC
limit 1;

# UNIQUE DISTINCT VALUE  

SELECT 
   Assembly_Line_No, COUNT(Assembly_Line_No) AS Assembly_Line_No_Unique_Categories
from cars
GROUP BY Assembly_Line_No ;


# ===================================== NUMERICAL DATA =====================================================

# ------------------------------------ Hydraulic_Pressure ---------------------------------------------------

#MEAN 

SELECT AVG(Hydraulic_Pressure) AS Mean
FROM cars;

# MEDAIN 
SELECT AVG(Hydraulic_Pressure) AS Median
FROM (
    SELECT Hydraulic_Pressure
    FROM cars
    WHERE Hydraulic_Pressure IS NOT NULL
    ORDER BY Hydraulic_Pressure
    LIMIT 2 OFFSET 
        (SELECT FLOOR(COUNT(*) / 2) - 1)
         FROM cars 
         WHERE Hydraulic_Pressure IS NOT NULL)
) AS subquery;

#Range 
SELECT MAX(Hydraulic_Pressure) - MIN(Hydraulic_Pressure) AS Hydraulic_Pressure_Range 
FROM cars
WHERE Hydraulic_Pressure IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Hydraulic_Pressure) AS Variance_Population,
    STDDEV_POP(Hydraulic_Pressure) AS Std_Dev_Population,
    MAX(Hydraulic_Pressure) - MIN(Hydraulic_Pressure) as range_1
FROM cars
WHERE Hydraulic_Pressure IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Hydraulic_Pressure - (SELECT AVG(Hydraulic_Pressure) FROM cars)) / 
  (SELECT STDDEV(Hydraulic_Pressure) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Hydraulic_Pressure - (SELECT AVG(Hydraulic_Pressure) FROM cars)) / 
  (SELECT STDDEV(Hydraulic_Pressure) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;



# ------------------------------------ Coolant_Pressure ---------------------------------------------------

SELECT AVG(Coolant_Pressure) AS Mean
FROM cars;

#Range 
SELECT MAX(Coolant_Pressure) - MIN(Coolant_Pressure) AS Coolant_Pressure_Range 
FROM cars
WHERE Coolant_Pressure IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Coolant_Pressure) AS Variance_Population,
    STDDEV_POP(Coolant_Pressure) AS Std_Dev_Population,
    MAX(Coolant_Pressure) - MIN(Coolant_Pressure) as range_1
FROM cars
WHERE Coolant_Pressure IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Coolant_Pressure - (SELECT AVG(Coolant_Pressure) FROM cars)) / 
  (SELECT STDDEV(Coolant_Pressure) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Coolant_Pressure - (SELECT AVG(Coolant_Pressure) FROM cars)) / 
  (SELECT STDDEV(Coolant_Pressure) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;


# ------------------------------------ Air_System_Pressure ---------------------------------------------------

SELECT AVG(Air_System_Pressure) AS Mean
FROM cars;

#Range 
SELECT MAX(Air_System_Pressure) - MIN(Air_System_Pressure) AS Air_System_Pressure_Range 
FROM cars
WHERE Air_System_Pressure IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Air_System_Pressure) AS Variance_Population,
    STDDEV_POP(Air_System_Pressure) AS Std_Dev_Population,
    MAX(Air_System_Pressure) - MIN(Air_System_Pressure) as range_1
FROM cars
WHERE Air_System_Pressure IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Air_System_Pressure - (SELECT AVG(Air_System_Pressure) FROM cars)) / 
  (SELECT STDDEV(Air_System_Pressure) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Air_System_Pressure - (SELECT AVG(Air_System_Pressure) FROM cars)) / 
  (SELECT STDDEV(Air_System_Pressure) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;

# ------------------------------------ Coolant_Temperature ---------------------------------------------------

SELECT AVG(Coolant_Temperature) AS Mean
FROM cars;

#Range 
SELECT MAX(Coolant_Temperature) - MIN(Coolant_Temperature) AS Coolant_Temperature_Range 
FROM cars
WHERE Coolant_Temperature IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Coolant_Temperature) AS Variance_Population,
    STDDEV_POP(Coolant_Temperature) AS Std_Dev_Population,
    MAX(Coolant_Temperature) - MIN(Coolant_Temperature) as range_1
FROM cars
WHERE Coolant_Temperature IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM cars)) / 
  (SELECT STDDEV(Coolant_Temperature) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM cars)) / 
  (SELECT STDDEV(Coolant_Temperature) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;

# ------------------------------------ Hydraulic_Oil_Temperature ---------------------------------------------------

SELECT AVG(Hydraulic_Oil_Temperature) AS Mean
FROM cars;

#Range 
SELECT MAX(Hydraulic_Oil_Temperature) - MIN(Hydraulic_Oil_Temperature) AS Hydraulic_Oil_Temperature_Range 
FROM cars
WHERE Hydraulic_Oil_Temperature IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Hydraulic_Oil_Temperature) AS Variance_Population,
    STDDEV_POP(Hydraulic_Oil_Temperature) AS Std_Dev_Population,
    MAX(Hydraulic_Oil_Temperature) - MIN(Hydraulic_Oil_Temperature) as range_1
FROM cars
WHERE Hydraulic_Oil_Temperature IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Hydraulic_Oil_Temperature - (SELECT AVG(Hydraulic_Oil_Temperature) FROM cars)) / 
  (SELECT STDDEV(Hydraulic_Oil_Temperature) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Hydraulic_Oil_Temperature - (SELECT AVG(Hydraulic_Oil_Temperature) FROM cars)) / 
  (SELECT STDDEV(Hydraulic_Oil_Temperature) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;


# ------------------------------------ Spindle_Bearing_Temperature ---------------------------------------------------

SELECT AVG(Spindle_Bearing_Temperature) AS Mean
FROM cars;

#Range 
SELECT MAX(Spindle_Bearing_Temperature) - MIN(Spindle_Bearing_Temperature) AS Spindle_Bearing_Temperature_Range 
FROM cars
WHERE Spindle_Bearing_Temperature IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Spindle_Bearing_Temperature) AS Variance_Population,
    STDDEV_POP(Spindle_Bearing_Temperature) AS Std_Dev_Population,
    MAX(Spindle_Bearing_Temperature) - MIN(Spindle_Bearing_Temperature) as range_1
FROM cars
WHERE Spindle_Bearing_Temperature IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Spindle_Bearing_Temperature - (SELECT AVG(Spindle_Bearing_Temperature) FROM cars)) / 
  (SELECT STDDEV(Spindle_Bearing_Temperature) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Spindle_Bearing_Temperature - (SELECT AVG(Spindle_Bearing_Temperature) FROM cars)) / 
  (SELECT STDDEV(Spindle_Bearing_Temperature) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;


# ------------------------------------ Spindle_Vibration ---------------------------------------------------

SELECT AVG(Spindle_Vibration) AS Mean
FROM cars;

#Range 
SELECT MAX(Spindle_Vibration) - MIN(Spindle_Vibration) AS Coolant_Pressure_Range 
FROM cars
WHERE Spindle_Vibration IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Spindle_Vibration) AS Variance_Population,
    STDDEV_POP(Spindle_Vibration) AS Std_Dev_Population,
    MAX(Spindle_Vibration) - MIN(Spindle_Vibration) as range_1
FROM cars
WHERE Spindle_Vibration IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Spindle_Vibration - (SELECT AVG(Spindle_Vibration) FROM cars)) / 
  (SELECT STDDEV(Spindle_Vibration) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Spindle_Vibration - (SELECT AVG(Spindle_Vibration) FROM cars)) / 
  (SELECT STDDEV(Spindle_Vibration) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;


# ------------------------------------ Coolant_Temperature ---------------------------------------------------

SELECT AVG(Coolant_Temperature) AS Mean
FROM cars;

#Range 
SELECT MAX(Coolant_Temperature) - MIN(Coolant_Temperature) AS Coolant_Temperature_Range 
FROM cars
WHERE Coolant_Temperature IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Coolant_Temperature) AS Variance_Population,
    STDDEV_POP(Coolant_Temperature) AS Std_Dev_Population,
    MAX(Coolant_Temperature) - MIN(Coolant_Temperature) as range_1
FROM cars
WHERE Coolant_Temperature IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM cars)) / 
  (SELECT STDDEV(Coolant_Temperature) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM cars)) / 
  (SELECT STDDEV(Coolant_Temperature) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;

# ------------------------------------ Tool_Vibration ---------------------------------------------------

SELECT AVG(Tool_Vibration) AS Mean
FROM cars;

#Range 
SELECT MAX(Tool_Vibration) - MIN(Tool_Vibration) AS Coolant_Pressure_Range 
FROM cars
WHERE Tool_Vibration IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Tool_Vibration) AS Variance_Population,
    STDDEV_POP(Tool_Vibration) AS Std_Dev_Population,
    MAX(Tool_Vibration) - MIN(Tool_Vibration) as range_1
FROM cars
WHERE Tool_Vibration IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Tool_Vibration - (SELECT AVG(Tool_Vibration) FROM cars)) / 
  (SELECT STDDEV(Tool_Vibration) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Tool_Vibration - (SELECT AVG(Tool_Vibration) FROM cars)) / 
  (SELECT STDDEV(Tool_Vibration) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;

# ------------------------------------ Spindle_Speed ---------------------------------------------------

SELECT AVG(Spindle_Speed) AS Mean
FROM cars;

#Range 
SELECT MAX(Spindle_Speed) - MIN(Spindle_Speed) AS Spindle_Speed_Range 
FROM cars
WHERE Spindle_Speed IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Spindle_Speed) AS Variance_Population,
    STDDEV_POP(Spindle_Speed) AS Std_Dev_Population,
    MAX(Spindle_Speed) - MIN(Spindle_Speed) as range_1
FROM cars
WHERE Spindle_Speed IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Spindle_Speed - (SELECT AVG(Spindle_Speed) FROM cars)) / 
  (SELECT STDDEV(Spindle_Speed) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Spindle_Speed - (SELECT AVG(Spindle_Speed) FROM cars)) / 
  (SELECT STDDEV(Spindle_Speed) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;

# ------------------------------------ Voltage ---------------------------------------------------

SELECT AVG(Voltage) AS Mean
FROM cars;

#Range 
SELECT MAX(Voltage) - MIN(Voltage) AS Voltage_Range 
FROM cars
WHERE Voltage IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Voltage) AS Variance_Population,
    STDDEV_POP(Voltage) AS Std_Dev_Population,
    MAX(Voltage) - MIN(Voltage) as range_1
FROM cars
WHERE Voltage IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Voltage - (SELECT AVG(Voltage) FROM cars)) / 
  (SELECT STDDEV(Voltage) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Voltage - (SELECT AVG(Voltage) FROM cars)) / 
  (SELECT STDDEV(Voltage) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;

# ------------------------------------ Torque ---------------------------------------------------

SELECT AVG(Torque) AS Mean
FROM cars;

#Range 
SELECT MAX(Torque) - MIN(Torque) AS Torque_Range 
FROM cars
WHERE Torque IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Torque) AS Variance_Population,
    STDDEV_POP(Torque) AS Std_Dev_Population,
    MAX(Torque) - MIN(Torque) as range_1
FROM cars
WHERE Torque IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Torque - (SELECT AVG(Torque) FROM cars)) / 
  (SELECT STDDEV(Torque) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Torque - (SELECT AVG(Torque) FROM cars)) / 
  (SELECT STDDEV(Torque) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;


# ------------------------------------ Cutting ---------------------------------------------------

SELECT AVG(Cutting) AS Mean
FROM cars;

#Range 
SELECT MAX(Cutting) - MIN(Cutting) AS Cutting_Range 
FROM cars
WHERE Cutting IS NOT NULL;
 
 # Variance
SELECT 
    VAR_POP(Cutting) AS Variance_Population,
    STDDEV_POP(Cutting) AS Std_Dev_Population,
    MAX(Cutting) - MIN(Cutting) as range_1
FROM cars
WHERE Cutting IS NOT NULL;

# Third Moment Business Decision
-- Skewness Calculation (using above values)
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Cutting - (SELECT AVG(Cutting) FROM cars)) / 
  (SELECT STDDEV(Cutting) FROM cars), 3)) AS skewness
FROM cars;

#Fourth Moment Business Decision
-- Kurtosis Calculation (using above values)

SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Cutting - (SELECT AVG(Cutting) FROM cars)) / 
  (SELECT STDDEV(Cutting) FROM cars), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS kurtosis
FROM cars;
