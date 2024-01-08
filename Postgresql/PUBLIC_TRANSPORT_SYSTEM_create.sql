-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-01-04 13:23:13.001

-- tables
-- Table: District
CREATE TABLE District (
    d_district_ID int  NOT NULL,
    d_district_name VARCHAR(45)  NOT NULL,
    CONSTRAINT District_pk PRIMARY KEY (d_district_ID)
);

-- Table: District_has_Transportline
CREATE TABLE District_has_Transportline (
    d_district_ID int  NOT NULL,
    tl_transportline_ID int  NOT NULL,
    CONSTRAINT District_has_Transportline_pk PRIMARY KEY (d_district_ID,tl_transportline_ID)
);

-- Table: Employee
CREATE TABLE Employee (
    e_empoyee_ID int  NOT NULL,
    e_firstname varchar(45)  NOT NULL,
    e_lastname varchar(45)  NOT NULL,
    e_salary int  NOT NULL,
    e_start_Date Date  NOT NULL,
    e_job varchar(45)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (e_empoyee_ID)
);

-- Table: Station
CREATE TABLE Station (
    st_station int  NOT NULL,
    st_name varchar(45)  NOT NULL,
    CONSTRAINT Station_pk PRIMARY KEY (st_station)
);

-- Table: Transportline
CREATE TABLE Transportline (
    tl_transportline_ID int  NOT NULL,
    tl_transportline_name varchar(45)  NOT NULL,
    e_empoyee_ID int  NOT NULL,
    CONSTRAINT Transportline_pk PRIMARY KEY (tl_transportline_ID)
);

-- Table: Transportline_has_Station
CREATE TABLE Transportline_has_Station (
    tl_transportline_ID int  NOT NULL,
    st_station int  NOT NULL,
    CONSTRAINT Transportline_has_Station_pk PRIMARY KEY (tl_transportline_ID,st_station)
);

-- foreign keys
-- Reference: District_has_Transportline_District (table: District_has_Transportline)
ALTER TABLE District_has_Transportline ADD CONSTRAINT District_has_Transportline_District
    FOREIGN KEY (d_district_ID)
    REFERENCES District (d_district_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: District_has_Transportline_Transportline (table: District_has_Transportline)
ALTER TABLE District_has_Transportline ADD CONSTRAINT District_has_Transportline_Transportline
    FOREIGN KEY (tl_transportline_ID)
    REFERENCES Transportline (tl_transportline_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transportline_Employee (table: Transportline)
ALTER TABLE Transportline ADD CONSTRAINT Transportline_Employee
    FOREIGN KEY (e_empoyee_ID)
    REFERENCES Employee (e_empoyee_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transportline_has_Station_Station (table: Transportline_has_Station)
ALTER TABLE Transportline_has_Station ADD CONSTRAINT Transportline_has_Station_Station
    FOREIGN KEY (st_station)
    REFERENCES Station (st_station)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transportline_has_Station_Transportline (table: Transportline_has_Station)
ALTER TABLE Transportline_has_Station ADD CONSTRAINT Transportline_has_Station_Transportline
    FOREIGN KEY (tl_transportline_ID)
    REFERENCES Transportline (tl_transportline_ID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

