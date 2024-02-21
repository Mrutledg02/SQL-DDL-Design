-- Design the schema for a medical center.

-- - A medical center employs several doctors
-- - A doctors can see many patients
-- - A patient can be seen by many doctors
-- - During a visit, a patient may be diagnosed to have one or more diseases.

-- Create the doctors table
CREATE TABLE doctors (
  doctor_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  specialty VARCHAR(255) NOT NULL
);

-- Create the patients table
CREATE TABLE patients (
  patient_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

-- Create the visits table
CREATE TABLE visits (
  visit_id SERIAL PRIMARY KEY,
  doctor_id INT NOT NULL,
  patient_id INT NOT NULL,
  visit_date DATE NOT NULL,
  FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

-- Create the diseases table
CREATE TABLE diseases (
  disease_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

-- Create the diagnosis table to represent the many-to-many relationship between visits and diseases
CREATE TABLE diagnosis (
  diagnosis_id SERIAL PRIMARY KEY,
  visit_id INT NOT NULL,
  disease_id INT NOT NULL,
  FOREIGN KEY (visit_id) REFERENCES visits (visit_id),
  FOREIGN KEY (disease_id) REFERENCES diseases (disease_id)
);
