

--  ----------------------------  PROIECT SGBD (PL/SQL) ---------------------------------
--  ---------------------------= Alexandru Robert-Mihai =--------------------------------
--                                                 FAMILY BUDGET 

-- CREATE TABLES
-- -----------------------------------------------------------------------------------------
CREATE TABLE family (
    family_id NUMBER(2) PRIMARY KEY,
    family_name VARCHAR2(20),
    family_city VARCHAR2(10),
    family_adress VARCHAR2(30),
    family_state VARCHAR2(20),
    family_zipCode NUMBER(6)
);
-- PL/SQL - EXECUTE IMMEDIATE
SET serveroutput ON
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE FamilyMembers (
    familyMember_id NUMBER(2) NOT NULL,
    family_id NUMBER(2) NOT NULL,
    familyMember_name VARCHAR2(20),
    familyMember_relationship VARCHAR2(15),
    familyMember_dataNasterii DATE,
    PRIMARY KEY(familyMember_id),
    CONSTRAINT fk_familyMember_family FOREIGN KEY(family_id)
        REFERENCES family(family_id)
    )';
END;
/

