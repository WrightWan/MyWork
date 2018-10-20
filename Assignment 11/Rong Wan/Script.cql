CREATE KEYSPACE cs548 WITH replication = {'class' : 'SimpleStrategy','replication_factor':1};

USE cs548;

CREATE TABLE cs548.patient (id UUID PRIMARY KEY, patient_id int, name text, dob date);

CREATE TABLE cs548.provider (id UUID PRIMARY KEY, npi int, name text, specialization text);

CREATE TYPE cs548.drug (drug text, dosage float);

CREATE TYPE cs548.surgery (form text);

CREATE TYPE cs548.radiology ( dates list<date>);


CREATE TABLE cs548.patient_treatments (id UUID, start_date date, start_year int,
	diagnosis text, patient_id int, patient_name text,
	dtrmt FROZEN<drug>, strmt FROZEN<surgery>, rtrmt FROZEN<radiology>,
	PRIMARY KEY (patient_id,start_date)) WITH CLUSTERING ORDER BY (start_date DESC);
	
CREATE TABLE cs548.provider_treatments (id UUID, start_date date, start_year int,
	diagnosis text,npi int, provider_name text, 
	dtrmt FROZEN<drug>, strmt FROZEN<surgery>, rtrmt FROZEN<radiology>,
	PRIMARY KEY ((npi, start_year),start_date)) WITH CLUSTERING ORDER BY (start_date DESC);
	
INSERT INTO cs548.patient (id, patient_id, name, dob) VALUES (
	uuid(),
	1234,
	'Rong',
	'1993-11-25');
	
INSERT INTO cs548.patient (id, patient_id, name, dob) VALUES (
	uuid(),
	2234,
	'John',
	'1989-12-11');	
	
INSERT INTO cs548.patient (id, patient_id, name, dob) VALUES (
	uuid(),
	3234,
	'Bob',
	'1990-10-13');

INSERT INTO cs548.provider (id, npi, name, specialization) VALUES (
	uuid(),
	1111,
	'BlueCross',
	'Radiology');	

INSERT INTO cs548.provider (id, npi, name, specialization) VALUES (
	uuid(),
	2222,
	'RedCross',
	'Surgeon');	

INSERT INTO cs548.provider (id, npi, name, specialization) VALUES (
	uuid(),
	3333,
	'United',
	'Internist');

INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2015-03-07',
	2015,
	'Headache',
	1234,
	'Rong',
	{drug : 'Asprin', dosage : 2.5},
	null,
	null);
	
INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-03-07',
	2014,
	'StomachPain',
	1234,
	'Rong',
	null,
	{form : 'endoscopy'},
	null);

INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2017-03-07',
	2017,
	'ChestPain',
	1234,
	'Rong',
	null,
	null,
	{dates : ['2017-03-09','2017-04-09']});
	
INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-08-17',
	2014,
	'Toothache',
	2234,
	'John',
	{drug : 'PainKiller', dosage : 1.3},
	null,
	null);
	
INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-10-22',
	2014,
	'WisdomTeeth',
	2234,
	'John',
	null,
	{form : 'extraction'},
	null);

INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2016-04-07',
	2016,
	'AbdominPain',
	2234,
	'John',
	null,
	null,
	{dates : ['2016-06-09','2016-07-19']});	
	
INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2013-08-17',
	2013,
	'Cold',
	3234,
	'Bob',
	{drug : 'Tynold', dosage : 1.6},
	null,
	null);
	
INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-10-22',
	2014,
	'BrokenNose',
	3234,
	'Bob',
	null,
	{form : 'PlasticInplant'},
	null);

INSERT INTO cs548.patient_treatments (id, start_date, start_year, diagnosis, patient_id, patient_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2015-04-07',
	2015,
	'Migrate',
	3234,
	'Bob',
	null,
	null,
	{dates : ['2015-06-09','2016-05-19']});		

INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2015-03-07',
	2015,
	'Headache',
	3333,
	'United',
	{drug : 'Asprin', dosage : 2.5},
	null,
	null);
	
INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-03-07',
	2014,
	'StomachPain',
	2222,
	'RedCross',
	null,
	{form : 'endoscopy'},
	null);

INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2017-03-07',
	2017,
	'ChestPain',
	1111,
	'BlueCross',
	null,
	null,
	{dates : ['2017-03-09','2017-04-09']});
	
INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-08-17',
	2014,
	'Toothache',
	3333,
	'United',
	{drug : 'PainKiller', dosage : 1.3},
	null,
	null);
	

INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2016-04-07',
	2016,
	'AbdominPain',
	1111,
	'BlueCross',
	null,
	null,
	{dates : ['2016-06-09','2016-07-19']});	
	
INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2013-08-17',
	2013,
	'Cold',
	3333,
	'United',
	{drug : 'Tynold', dosage : 1.6},
	null,
	null);
	

INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2015-04-07',
	2015,
	'Migrate',
	1111,
	'BlueCross',
	null,
	null,
	{dates : ['2015-06-09','2016-05-19']});		
	
INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-10-22',
	2014,
	'WisdomTeeth',
	2222,
	'RedCross',
	null,
	{form : 'extraction'},
	null);	
	
INSERT INTO cs548.provider_treatments (id, start_date, start_year, diagnosis, npi, provider_name, dtrmt, strmt, rtrmt) VALUES (
	uuid(),
	'2014-10-15',
	2014,
	'BrokenNose',
	2222,
	'RedCross',
	null,
	{form : 'PlasticInplant'},
	null);	
	
SELECT * FROM patient;
SELECT * FROM provider;
SELECT * FROM patient_treatments;
SELECT * FROM patient_treatments WHERE patient_name = 'Rong' ALLOW FILTERING;
SELECT * FROM provider_treatments;
SELECT * FROM provider_treatments WHERE provider_name = 'RedCross' ALLOW FILTERING;
	