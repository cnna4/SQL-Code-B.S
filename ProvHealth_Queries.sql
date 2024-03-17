USE providencehealth;

# 1) Find the FullName, Longitude and Latitude, of all patients that made an appointment and showed symptoms.
SELECT CONCAT(p.Patient_First, '', p.Patient_Last) as FullName,
       g.Geo_Latitude,
       g.Geo_Longitude
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        INNER JOIN geolocation g on p.Geo_ID = g.Geo_ID
        WHERE a.Appointment_Symptoms !='N/A';

# 2) Show all the patients above the age of 45 that made an appointment and show symptoms
SELECT CONCAT(p.Patient_First, '', p.Patient_Last) as FullName,
       YEAR(NOW()) - YEAR(p.Patient_DOB) as Age
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        WHERE a.Appointment_Symptoms !='N/A'
        HAVING Age>=45;

# 3) Show all patients below the age of 45 that are asymptomatic and made appointments
SELECT CONCAT(p.Patient_First, '', p.Patient_Last) as FullName,
       YEAR(NOW()) - YEAR(p.Patient_DOB) as Age
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        WHERE a.Appointment_Symptoms='N/A' AND a.Appointment_Diagnosis='Positive'
        HAVING Age<45;

# 4) Which Geographic locations (Top 3) has the most amount of COVID cases?
SELECT g.Geo_ID, g.Geo_Latitude, g.Geo_Longitude, COUNT(Appointment_ID) as PositiveCount
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        INNER JOIN geolocation g on p.Geo_ID = g.Geo_ID
        WHERE a.Appointment_Diagnosis='Positive'
        GROUP BY g.Geo_ID
        ORDER BY PositiveCount DESC
        LIMIT 3;

# 5) Do more men or women show symptoms of COVID?
SELECT p.Patient_Gender, Count(a.Appointment_ID) as PositiveCount
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        WHERE a.Appointment_Symptoms!='N/A'
        GROUP BY p.Patient_Gender
        ORDER BY PositiveCount DESC;

# 6) What insurance do most COVID positive patients have?
SELECT i.Insurance_Desc, Count(a.Appointment_ID) as PositiveCount
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        INNER JOIN insurance i on p.Insurance_Code = i.Insurance_Code
        WHERE a.Appointment_Diagnosis='Positive'
        GROUP BY i.Insurance_Code
        ORDER BY PositiveCount DESC;


# 7) Which facility has the most incoming positive tests?
SELECT f.Facility_Name, Count(a.Appointment_ID) as PositiveCount
    FROM appointment a
        INNER JOIN facility f on a.FacilityID = f.Facility_ID
        WHERE a.Appointment_Diagnosis='Positive'
        GROUP BY f.Facility_ID
        ORDER BY PositiveCount DESC;

# 8) Show the most common symptoms of Covid patients?
SELECT a.Appointment_Symptoms, Count(a.Appointment_ID) as PositiveCount
    FROM appointment a
        INNER JOIN facility f on a.FacilityID = f.Facility_ID
        WHERE a.Appointment_Symptoms!='N/A' and a.Appointment_Diagnosis='Positive'
        GROUP BY a.Appointment_Symptoms
        ORDER BY PositiveCount DESC;

# 9) Show all the people that made an appointment but tested negative
SELECT CONCAT(p.Patient_First, ' ', p.Patient_Last) AS FullName
    FROM appointment a
        INNER JOIN patient p on a.PatientID = p.Patient_ID
        WHERE a.Appointment_Diagnosis='Negative'


# 10) Show number of patients for each treatments
SELECT a.Appointment_Treatment, COUNT(a.Appointment_ID) as PositiveCount
    FROM appointment a
        WHERE a.Appointment_Diagnosis='Positive'
        GROUP BY a.Appointment_Treatment
        ORDER BY PositiveCount DESC;

