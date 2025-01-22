

-- Checking the data 
select * from downtime;
   

-- Count of rows    
select count(*) from downtime;

--  Description for data table
DESCRIBE downtime;

-- =-=================================== CATEGORRICAL DATA =================================================

-- ================= Date ======================

-- First Moment Business Decision
--Mode 

SELECT Date
FROM downtime
GROUP BY Date
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Unique Distinct Values
 
SELECT DISTINCT(Date) as unique_values 
FROM downtime


-- ================= Machine_ID ======================

-- First Moment Business Decision
-- Mode 

SELECT Machine_ID
FROM downtime
GROUP BY Machine_ID
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Unique Distinct Values
 
SELECT DISTINCT(Machine_ID) as unique_values 
FROM downtime


   
-- ================= Line_No ======================

-- First Moment Business Decision
-- Mode 

SELECT Line_No
FROM downtime
GROUP BY Line_No
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Unique Distinct Values
 
SELECT DISTINCT(Line_No) as unique_values 
FROM downtime
   
-- ================= Downtime_Status ======================

-- First Moment Business Decision
-- Mode 

SELECT Downtime_Status
FROM downtime
GROUP BY Downtime_Status
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Unique Distinct Values
 
SELECT DISTINCT(Downtime_Status) as unique_values 
FROM downtime

-- ================= Operational_Time ======================

-- First Moment Business Decision
-- Mode 

SELECT Operational_Time
FROM downtime
GROUP BY Operational_Time
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Unique Distinct Values
 
SELECT DISTINCT(Operational_Time) as unique_values 
FROM downtime



-- =================================== NUMERICAL DATA =================================================

-- ================= Hydraulic_Pressure(MPa) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Hydraulic_Pressure(MPa)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Hydraulic_Pressure(MPa)) AS Median
FROM (
    SELECT Hydraulic_Pressure(MPa)
    FROM downtime
    WHERE Hydraulic_Pressure(MPa) IS NOT NULL
    ORDER BY Hydraulic_Pressure(MPa)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Hydraulic_Pressure(MPa) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Hydraulic_Pressure(MPa) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Hydraulic_Pressure(MPa)) - MIN(Hydraulic_Pressure(MPa)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Hydraulic_Pressure(MPa)) AS Variance_Population,
    STDDEV_POP(Hydraulic_Pressure(MPa)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW((Hydraulic_Pressure(MPa) - (SELECT AVG(Hydraulic_Pressure(MPa)) FROM downtime)) / 
  (SELECT STDDEV(Hydraulic_Pressure(MPa)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW((Hydraulic_Pressure(MPa) - (SELECT AVG(Hydraulic_Pressure(MPa)) FROM downtime)) / 
  (SELECT STDDEV(Hydraulic_Pressure(MPa)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;



-- ================= Coolant_Level(%) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Coolant_Level(%)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Coolant_Level(%)) AS Median
FROM (
    SELECT Coolant_Level(%)
    FROM downtime
    WHERE Coolant_Level(%) IS NOT NULL
    ORDER BY Coolant_Level(%)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Coolant_Level(%) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Coolant_Level(%) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Coolant_Level(%)) - MIN(Coolant_Level(%)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Coolant_Level(%)) AS Variance_Population,
    STDDEV_POP(Coolant_Level(%)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Coolant_Level(%)) - (SELECT AVG(Coolant_Level(%)) FROM downtime)) / 
  (SELECT STDDEV(Coolant_Level(%)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Coolant_Level(%) - (SELECT AVG(Coolant_Level(%)) FROM downtime)) / 
  (SELECT STDDEV(Coolant_Level(%)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


-- ================= Air_Flow_Pressure(MPa) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Air_Flow_Pressure(MPa)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Air_Flow_Pressure(MPa)) AS Median
FROM (
    SELECT Air_Flow_Pressure(MPa)
    FROM downtime
    WHERE Air_Flow_Pressure(MPa) IS NOT NULL
    ORDER BY Air_Flow_Pressure(MPa)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Air_Flow_Pressure(MPa) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Air_Flow_Pressure(MPa) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Air_Flow_Pressure(MPa)) - MIN(Air_Flow_Pressure(MPa)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Air_Flow_Pressure(MPa)) AS Variance_Population,
    STDDEV_POP(Air_Flow_Pressure(MPa)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Air_Flow_Pressure(MPa)) - (SELECT AVG(Air_Flow_Pressure(MPa)) FROM downtime)) / 
  (SELECT STDDEV(Air_Flow_Pressure(MPa)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Air_Flow_Pressure(MPa) - (SELECT AVG(Air_Flow_Pressure(MPa)) FROM downtime)) / 
  (SELECT STDDEV(Air_Flow_Pressure(MPa)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


-- ================= Coolant_Temp(\u00b0C) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Coolant_Temp(\u00b0C)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Coolant_Temp(\u00b0C)) AS Median
FROM (
    SELECT Coolant_Temp(\u00b0C)
    FROM downtime
    WHERE Coolant_Temp(\u00b0C) IS NOT NULL
    ORDER BY Coolant_Temp(\u00b0C)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Coolant_Temp(\u00b0C) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Coolant_Temp(\u00b0C) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Coolant_Temp(\u00b0C)) - MIN(Coolant_Temp(\u00b0C)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Coolant_Temp(\u00b0C)) AS Variance_Population,
    STDDEV_POP(Coolant_Temp(\u00b0C)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Coolant_Temp(\u00b0C)) - (SELECT AVG(Coolant_Temp(\u00b0C)) FROM downtime)) / 
  (SELECT STDDEV(Coolant_Temp(\u00b0C)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Coolant_Temp(\u00b0C) - (SELECT AVG(Coolant_Temp(\u00b0C)) FROM downtime)) / 
  (SELECT STDDEV(Coolant_Temp(\u00b0C)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


-- ================= Oil_Temp(\u00b0C) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Oil_Temp(\u00b0C)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Oil_Temp(\u00b0C)) AS Median
FROM (
    SELECT Oil_Temp(\u00b0C)
    FROM downtime
    WHERE Oil_Temp(\u00b0C) IS NOT NULL
    ORDER BY Oil_Temp(\u00b0C)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Oil_Temp(\u00b0C) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Oil_Temp(\u00b0C) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Oil_Temp(\u00b0C)) - MIN(Oil_Temp(\u00b0C)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Oil_Temp(\u00b0C)) AS Variance_Population,
    STDDEV_POP(Oil_Temp(\u00b0C)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Oil_Temp(\u00b0C)) - (SELECT AVG(Oil_Temp(\u00b0C)) FROM downtime)) / 
  (SELECT STDDEV(Oil_Temp(\u00b0C)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Oil_Temp(\u00b0C) - (SELECT AVG(Oil_Temp(\u00b0C)) FROM downtime)) / 
  (SELECT STDDEV(Oil_Temp(\u00b0C)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;



-- ================= Bearing_Temp(\u00b0C) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Bearing_Temp(\u00b0C)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Bearing_Temp(\u00b0C)) AS Median
FROM (
    SELECT Bearing_Temp(\u00b0C)
    FROM downtime
    WHERE Bearing_Temp(\u00b0C) IS NOT NULL
    ORDER BY Bearing_Temp(\u00b0C)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Bearing_Temp(\u00b0C) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Bearing_Temp(\u00b0C) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Bearing_Temp(\u00b0C)) - MIN(Bearing_Temp(\u00b0C)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Bearing_Temp(\u00b0C)) AS Variance_Population,
    STDDEV_POP(Bearing_Temp(\u00b0C)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Bearing_Temp(\u00b0C)) - (SELECT AVG(Bearing_Temp(\u00b0C)) FROM downtime)) / 
  (SELECT STDDEV(Bearing_Temp(\u00b0C)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Bearing_Temp(\u00b0C) - (SELECT AVG(Bearing_Temp(\u00b0C)) FROM downtime)) / 
  (SELECT STDDEV(Bearing_Temp(\u00b0C)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;



-- ================= Spindle_Shift(\u00b5m) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Spindle_Shift(\u00b5m)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Spindle_Shift(\u00b5m)) AS Median
FROM (
    SELECT Spindle_Shift(\u00b5m)
    FROM downtime
    WHERE Spindle_Shift(\u00b5m) IS NOT NULL
    ORDER BY Spindle_Shift(\u00b5m)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Spindle_Shift(\u00b5m) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Spindle_Shift(\u00b5m) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Spindle_Shift(\u00b5m)) - MIN(Spindle_Shift(\u00b5m)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Spindle_Shift(\u00b5m)) AS Variance_Population,
    STDDEV_POP(Spindle_Shift(\u00b5m)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Spindle_Shift(\u00b5m)) - (SELECT AVG(Spindle_Shift(\u00b5m)) FROM downtime)) / 
  (SELECT STDDEV(Spindle_Shift(\u00b5m)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Spindle_Shift(\u00b5m) - (SELECT AVG(Spindle_Shift(\u00b5m) FROM downtime)) / 
  (SELECT STDDEV(Spindle_Shift(\u00b5m)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


   ,Hydraulic_Pressure(MPa)  7.1
   ,Coolant_Level(%) 69.3
   ,Air_Flow_Pressure(MPa)  0.63
   ,Coolant_Temp(\u00b0C)   26.0
   ,Oil_Temp(\u00b0C)     46.0
   ,Bearing_Temp(\u00b0C)  33.4
   ,Spindle_Shift(\u00b5m)  1.29
   ,Tool_Wear(\u00b5m)    26.49
      
   ,Spindle_Rotation(RPM)  25892.0
   ,Power_Input(kw)       3.35
   ,Torque(Nm)            24.05
   ,Force(kN)             3.58


-- ================= Tool_Wear(\u00b5m) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Tool_Wear(\u00b5m)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Tool_Wear(\u00b5m)) AS Median
FROM (
    SELECT Tool_Wear(\u00b5m)
    FROM downtime
    WHERE Tool_Wear(\u00b5m) IS NOT NULL
    ORDER BY Tool_Wear(\u00b5m)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Tool_Wear(\u00b5m) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Tool_Wear(\u00b5m) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Tool_Wear(\u00b5m)) - MIN(Tool_Wear(\u00b5m)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Tool_Wear(\u00b5m)) AS Variance_Population,
    STDDEV_POP(Tool_Wear(\u00b5m)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Tool_Wear(\u00b5m)) - (SELECT AVG(Tool_Wear(\u00b5m)) FROM downtime)) / 
  (SELECT STDDEV(Tool_Wear(\u00b5m)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Tool_Wear(\u00b5m) - (SELECT AVG(Tool_Wear(\u00b5m) FROM downtime)) / 
  (SELECT STDDEV(Tool_Wear(\u00b5m)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


-- ================= Spindle_Rotation(RPM) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Spindle_Rotation(RPM)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Spindle_Rotation(RPM)) AS Median
FROM (
    SELECT Spindle_Rotation(RPM)
    FROM downtime
    WHERE Spindle_Rotation(RPM) IS NOT NULL
    ORDER BY Spindle_Rotation(RPM)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Spindle_Rotation(RPM) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Spindle_Rotation(RPM) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Spindle_Rotation(RPM)) - MIN(Spindle_Rotation(RPM)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Spindle_Rotation(RPM)) AS Variance_Population,
    STDDEV_POP(Spindle_Rotation(RPM)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Spindle_Rotation(RPM)) - (SELECT AVG(Spindle_Rotation(RPM)) FROM downtime)) / 
  (SELECT STDDEV(Spindle_Rotation(RPM)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Spindle_Rotation(RPM) - (SELECT AVG(Spindle_Rotation(RPM) FROM downtime)) / 
  (SELECT STDDEV(Spindle_Rotation(RPM)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;



-- ================= Power_Input(kw) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Power_Input(kw)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Power_Input(kw)) AS Median
FROM (
    SELECT Power_Input(kw)
    FROM downtime
    WHERE Power_Input(kw) IS NOT NULL
    ORDER BY Power_Input(kw)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Power_Input(kw) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Power_Input(kw) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Power_Input(kw)) - MIN(Power_Input(kw)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Power_Input(kw)) AS Variance_Population,
    STDDEV_POP(Power_Input(kw)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Power_Input(kw)) - (SELECT AVG(Power_Input(kw)) FROM downtime)) / 
  (SELECT STDDEV(Power_Input(kw)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Power_Input(kw) - (SELECT AVG(Power_Input(kw) FROM downtime)) / 
  (SELECT STDDEV(Power_Input(kw)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


-- ================= Torque(Nm) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Torque(Nm)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Torque(Nm)) AS Median
FROM (
    SELECT Torque(Nm)
    FROM downtime
    WHERE Torque(Nm) IS NOT NULL
    ORDER BY Torque(Nm)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Torque(Nm) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Torque(Nm) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Torque(Nm)) - MIN(Torque(Nm)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Torque(Nm)) AS Variance_Population,
    STDDEV_POP(Torque(Nm)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Torque(Nm)) - (SELECT AVG(Torque(Nm)) FROM downtime)) / 
  (SELECT STDDEV(Torque(Nm)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Torque(Nm) - (SELECT AVG(Torque(Nm) FROM downtime)) / 
  (SELECT STDDEV(Torque(Nm)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


-- ================= Force(kN) ======================

-- First Moment Business Decision

-- Mean
SELECT AVG(Force(kN)) AS Mean
FROM downtime;

-- Median
SELECT 
    AVG(Force(kN)) AS Median
FROM (
    SELECT Force(kN)
    FROM downtime
    WHERE Force(kN) IS NOT NULL
    ORDER BY Force(kN)
    LIMIT 2 - (SELECT COUNT(*) % 2 FROM downtime WHERE Force(kN) IS NOT NULL)  -- Adjust for odd/even number of rows
    OFFSET FLOOR((SELECT COUNT(*) FROM downtime WHERE Force(kN) IS NOT NULL) / 2)  -- Get middle index for odd/even rows
) AS subquery;

-- Second Moment Business Decision

-- Range
SELECT 
    MAX(Force(kN)) - MIN(Force(kN)) AS Range 
FROM downtime;

-- Variance and Standard Deviation
SELECT 
    VAR_POP(Force(kN)) AS Variance_Population,
    STDDEV_POP(Force(kN)) AS Std_Dev_Population
FROM downtime;

-- Third Moment Business Decision

-- Skewness Calculation
SELECT 
  (COUNT(*) / ((COUNT(*) - 1) * (COUNT(*) - 2))) * 
  SUM(POW(Force(kN)) - (SELECT AVG(Force(kN)) FROM downtime)) / 
  (SELECT STDDEV(Force(kN)) FROM downtime), 3)) AS Skewness
FROM downtime;

-- Fourth Moment Business Decision

-- Kurtosis Calculation
SELECT 
  (COUNT(*) * (COUNT(*) + 1)) / ((COUNT(*) - 1) * (COUNT(*) - 2) * (COUNT(*) - 3)) * 
  SUM(POW(Force(kN) - (SELECT AVG(Force(kN) FROM downtime)) / 
  (SELECT STDDEV(Force(kN)) FROM downtime), 4)) - 
  (3 * POW(COUNT(*) - 1, 2)) / ((COUNT(*) - 2) * (COUNT(*) - 3)) AS Kurtosis
FROM downtime;


