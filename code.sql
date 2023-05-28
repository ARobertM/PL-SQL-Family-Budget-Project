

--  ----------------------------  PROIECT SGBD (PL/SQL) ---------------------------------
--  ---------------------------= Alexandru Robert-Mihai =--------------------------------
--                                  FAMILY BUDGET 

-- CREATE TABLES
-- -----------------------------------------------------------------------------------------
-- PL/SQL - EXECUTE IMMEDIATE
SET serveroutput ON
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE Family (
    FamilyID INT PRIMARY KEY,
    FamilyName VARCHAR(100),
    Address VARCHAR(255)
    )';
END;
/

CREATE TABLE FinancialObjective (
    ObjectiveID INT PRIMARY KEY,
    FamilyID INT,
    ObjectiveName VARCHAR(100),
    ObjectiveAmount DECIMAL(10,2),
    ObjectiveDeadline DATE,
    FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FamilyID INT,
    Name VARCHAR(100),
    Age INT,
    Role VARCHAR(50),
    FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID)
);

CREATE TABLE UserFamily (
    UserID INT PRIMARY KEY,
    MemberID INT,
    Username VARCHAR(50),
    Password VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Savings (
    SavingID INT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10,2),
    SavingDate DATE,
    FOREIGN KEY (UserID) REFERENCES UserFamily(UserID)
);

CREATE TABLE Expenditure (
    ExpenditureID INT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10,2),
    ExpenditureDate DATE,
    FOREIGN KEY (UserID) REFERENCES UserFamily(UserID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    ExpenditureID INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(10,2),
    TransactionDate DATE,
    FOREIGN KEY (ExpenditureID) REFERENCES Expenditure(ExpenditureID)
);

CREATE TABLE Investments (
    InvestmentID INT PRIMARY KEY,
    ExpenditureID INT,
    InvestmentType VARCHAR(50),
    Amount DECIMAL(10,2),
    InvestmentDate DATE,
    FOREIGN KEY (ExpenditureID) REFERENCES Expenditure(ExpenditureID)
);

CREATE TABLE PeriodicPayments (
    PaymentID INT PRIMARY KEY,
    ExpenditureID INT,
    PaymentType VARCHAR(50),
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (ExpenditureID) REFERENCES Expenditure(ExpenditureID)
);

CREATE TABLE Income (
    IncomeID INT PRIMARY KEY,
    MemberID INT,
    IncomeSource VARCHAR(100),
    Amount DECIMAL(10,2),
    IncomeDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE BudgetFamily (
    BudgetID INT PRIMARY KEY,
    FamilyID INT,
    TotalIncome DECIMAL(10,2),
    TotalExpenditure DECIMAL(10,2),
    TotalSavings DECIMAL(10,2),
    FOREIGN KEY (FamilyID) REFERENCES Family(FamilyID)
);

-- INSERAREA DATELOR IN TABELE:
INSERT INTO Family (FamilyID, FamilyName, Address)
VALUES (1, 'Familia Popescu', 'Strada Mihai Eminescu, Nr. 10, Bucuresti');

BEGIN
    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (2, 'Familia Ionescu', 'Bulevardul Victoriei, Nr. 15, Cluj-Napoca');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (3, 'Familia Georgescu', 'Aleea Crizantemelor, Nr. 5, Timisoara');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (4, 'Familia Popa', 'Strada Principala, Nr. 20, Iasi');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (5, 'Familia Dumitrescu', 'Piata Unirii, Nr. 7, Brasov');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (6, 'Familia Vasilescu', 'Strada Libertatii, Nr. 12, Constanta');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (7, 'Familia Alexandru', 'Strada Ulmului, Nr. 4, Tulcea');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (8, 'Familia Munteanu', 'Strada Bisericii, Nr. 172, Mizil');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (9, 'Familia Stan', 'Aleea Rozelor, Nr. 6, Bacau');

    INSERT INTO Family (FamilyID, FamilyName, Address)
    VALUES (10, 'Familia Gheorghe', 'Strada Mihail Kogalniceanu, Nr. 9, Sibiu');

    COMMIT;
END;
/
SELECT * FROM Family;

INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
VALUES (1, 1, 'Vacanta in Grecia', 5000, TO_DATE('2024-07-01', 'YYYY-MM-DD'));

BEGIN
    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (2, 2, 'Cumpararea unei masini noi', 25000, TO_DATE('2023-12-31', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (3, 3, 'Renovarea casei', 15000, TO_DATE('2024-06-30', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (4, 4, 'Studii în strainatate', 40000, TO_DATE('2025-09-01', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (5, 5, 'Achizitionarea unei proprietati', 100000, TO_DATE('2024-12-31', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (6, 6, 'Infiintarea unui start-up', 50000, TO_DATE('2023-10-15', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (7, 7, 'Vacanta in Italia', 8000, TO_DATE('2024-08-15', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (8, 8, 'Cumpararea unei case', 120000, TO_DATE('2025-06-30', 'YYYY-MM-DD'));

    INSERT INTO FinancialObjective (ObjectiveID, FamilyID, ObjectiveName, ObjectiveAmount, ObjectiveDeadline)
    VALUES (9, 9, 'Achizitionarea unui autoturism electric', 35000, TO_DATE('2024-05-31', 'YYYY-MM-DD'));

    COMMIT;
END;
/
SELECT * FROM FinancialObjective;

BEGIN
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (1, 1, 'Ion Popescu', 45, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (2, 1, 'Maria Popescu', 43, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (3, 1, 'Mihai Popescu', 18, 'Copil');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (4, 2, 'Adrian Ionescu', 40, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (5, 2, 'Elena Ionescu', 38, 'Mama');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (6, 3, 'Mihai Georgescu', 50, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (7, 3, 'Ana Georgescu', 48, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (8, 4, 'Adrian Popa', 30, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (9, 4, 'Ana Popa', 28, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (10, 5, 'Vasile Dumitrescu', 24, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (11, 5, 'Valentina Dumitrescu', 28, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (12, 6, 'Nicu Vasilescu', 36, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (13, 6, 'Anca Vasilescu', 28, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (14, 7, 'Albert Alexandru', 21, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (15, 7, 'Maria Alexandru', 28, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (16, 8, 'Bogdan Munteanu', 47, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (17, 8, 'Flavia Munteanu', 39, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (18, 9, 'Sabin Stan', 21, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (19, 9, 'Andreea Stan', 28, 'Mama');
    
    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (20, 10, 'George Gheorghe', 36, 'Tata');

    INSERT INTO Members (MemberID, FamilyID, Name, Age, Role)
    VALUES (21, 10, 'Ana Gheorghe', 28, 'Mama');

    COMMIT;
END;
/
SELECT * FROM Members;

BEGIN
    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (1, 1, 'ion.popescu', 'parola_ion');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (2, 2, 'maria.popescu', 'parola_maria');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (3, 3, 'mihai.popescu', 'parola_mihai');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (4, 4, 'adrian.ionescu', 'parola_adrian');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (5, 5, 'elena.ionescu', 'parola_elena');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (6, 6, 'mihai.georgescu', 'parola_mihai');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (7, 7, 'ana.georgescu', 'parola_ana');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (8, 8, 'adrian.popa', 'parola_adrian');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (9, 9, 'ana.popa', 'parola_ana');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (10, 10, 'vasile.dumitrescu', 'parola_vasile');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (11, 11, 'valentina.dumitrescu', 'parola_valentina');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (12, 12, 'nicu.vasilescu', 'parola_nicu');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (13, 13, 'anca.vasilescu', 'parola_anca');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (14, 14, 'albert.alexandru', 'parola_albert');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (15, 15, 'maria.alexandru', 'parola_maria');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (16, 16, 'bogdan.munteanu', 'parola_bogdan');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (17, 17, 'flavia.munteanu', 'parola_flavia');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (18, 18, 'sabin.stan', 'parola_sabin');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (19, 19, 'andreea.stan', 'parola_andreea');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (20, 20, 'george.gheorghe', 'parola_george');

    INSERT INTO UserFamily (UserID, MemberID, Username, Password)
    VALUES (21, 21, 'ana.gheorghe', 'parola_ana');

    COMMIT;
END;
/
SELECT * FROM UserFamily;

BEGIN
    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (1, 1, 2000, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (2, 2, 1500, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (3, 3, 1000, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (4, 4, 2500, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (5, 5, 1800, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (6, 6, 3000, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (7, 7, 2200, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (8, 8, 2800, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (9, 9, 1900, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (10, 10, 3500, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (11, 11, 4000, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (12, 12, 2800, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (13, 13, 2200, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (14, 14, 1500, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (15, 15, 2500, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (16, 16, 1900, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (17, 17, 2100, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (18, 18, 2800, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (19, 19, 1500, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (20, 20, 3200, DATE '2023-05-26');

    INSERT INTO Savings (SavingID, UserID, Amount, SavingDate)
    VALUES (21, 21, 1800, DATE '2023-05-26');

    COMMIT;
END;
/
SELECT * FROM Savings;

BEGIN
    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (1, 1, 500, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (2, 2, 400, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (3, 3, 300, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (4, 4, 600, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (5, 5, 250, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (6, 6, 700, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (7, 7, 350, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (8, 8, 450, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (9, 9, 200, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (10, 10, 550, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (11, 11, 400, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (12, 12, 300, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (13, 13, 600, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (14, 14, 250, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (15, 15, 700, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (16, 16, 350, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (17, 17, 450, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (18, 18, 200, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (19, 19, 550, DATE '2023-05-26');

    INSERT INTO Expenditure (ExpenditureID, UserID, Amount, ExpenditureDate)
    VALUES (20, 20, 400, DATE '2023-05-26');

    COMMIT;
END;
/
SELECT * FROM Expenditure;

BEGIN
    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (1, 1, 'Cumparaturi', 500, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (2, 2, 'Facturi', 400, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (3, 3, 'Masina-Service', 300, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (4, 4, 'Utilitati', 600, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (5, 5, 'Mancare', 250, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (6, 6, 'Cumparaturi', 700, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (7, 7, 'Haine', 350, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (8, 8, 'Apa', 450, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (9, 9, 'Gaz', 200, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (10, 10, 'Facturi', 550, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (11, 11, 'Servicii', 400, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (12, 12, 'Utilitati', 300, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (13, 13, 'Gaz', 600, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (14, 14, 'Cumparaturi', 250, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (15, 15, 'Utilitati', 700, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (16, 16, 'Cumparaturi', 350, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (17, 17, 'Facturi', 450, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (18, 18, 'Haine', 200, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (19, 19, 'Cumparaturi', 550, DATE '2023-05-26');

    INSERT INTO Transactions (TransactionID, ExpenditureID, TransactionType, Amount, TransactionDate)
    VALUES (20, 20, 'Facturi', 400, DATE '2023-05-26');

    COMMIT;
END;
/
SELECT * FROM Transactions;

BEGIN
    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (1, 1, 'Salariu', 5000, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (2, 2, 'Salariu', 4500, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (3, 3, 'Alte venituri', 2000, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (4, 4, 'Salariu', 4000, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (5, 5, 'Salariu', 3500, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (6, 6, 'Alte venituri', 1000, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (7, 7, 'Salariu', 3000, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (8, 8, 'Salariu', 2500, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (9, 9, 'Alte venituri', 1500, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (10, 10, 'Salariu', 2000, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (11, 11, 'Salariu', 1800, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (12, 12, 'Alte venituri', 1200, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (13, 13, 'Salariu', 3500, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (14, 14, 'Salariu', 3200, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (15, 15, 'Alte venituri', 1800, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (16, 16, 'Salariu', 2800, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (17, 17, 'Salariu', 2500, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (18, 18, 'Alte venituri', 900, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (19, 19, 'Salariu', 1800, DATE '2023-05-01');

    INSERT INTO Income (IncomeID, MemberID, IncomeSource, Amount, IncomeDate)
    VALUES (20, 20, 'Salariu', 1500, DATE '2023-05-01');

    COMMIT;
END;
/

SELECT * FROM Income;

BEGIN
    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (1, 1, 9500, 900, 3500);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (2, 2, 9000, 800, 4500);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (3, 3, 8000, 700, 5000);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (4, 4, 7000, 600, 5500);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (5, 5, 6000, 500, 6000);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (6, 6, 5500, 400, 6500);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (7, 7, 5000, 300, 7000);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (8, 8, 4500, 200, 7500);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (9, 9, 4000, 100, 8000);

    INSERT INTO BudgetFamily (BudgetID, FamilyID, TotalIncome, TotalExpenditure, TotalSavings)
    VALUES (10, 10, 3500, 100, 8500);

    COMMIT;
END;
/
SELECT * FROM BudgetFamily;

-- 1. Verificarea vârstei unui membru cu ID-ul 1 din tabela "Members" si afilarea unui mesaj corespunzator în functie de aceasta vârsta.
DECLARE 
    member_age INT;
BEGIN
    SELECT Age INTO member_age FROM Members WHERE MemberID = 1;
        IF member_age < 18 THEN
            DBMS_OUTPUT.PUT_LINE('Membrul este minor.');
        ELSIF member_age BETWEEN 18 AND 65 THEN
            DBMS_OUTPUT.PUT_LINE('Membrul este adult.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Membrul este pensionar.');
        END IF;
END; 
/
-- 2. Majorarea cu 10% pentru fiecare economie existanta din tabela "Savings".
BEGIN
  FOR savings_rec IN (SELECT * FROM Savings) LOOP
    UPDATE Savings
    SET Amount = savings_rec.Amount * 1.1
    WHERE SavingID = savings_rec.SavingID;
    
    DBMS_OUTPUT.PUT_LINE('Economie cu ID-ul ' || savings_rec.SavingID || ': ' || (savings_rec.Amount * 1.1));
  END LOOP;
  COMMIT;
END;
/

--3.  Atribuirea unui rating in functie de valoarea cheltuielilor prin utilizarea structurii CASE: 
DECLARE
  expenditure_amount NUMBER;
  expenditure_rating VARCHAR2(20);
BEGIN
  SELECT Amount INTO expenditure_amount FROM Expenditure WHERE ExpenditureID = 1;

  CASE
    WHEN expenditure_amount < 500 THEN
      expenditure_rating := 'Mic';
    WHEN expenditure_amount BETWEEN 500 AND 1000 THEN
      expenditure_rating := 'Mediu';
    WHEN expenditure_amount > 1000 THEN
      expenditure_rating := 'Mare';
    ELSE
      expenditure_rating := 'Necunoscut';
  END CASE;

  DBMS_OUTPUT.PUT_LINE('Ratingul cheltuielii este: ' || expenditure_rating);
END;
/

-- 4.  Afisarea unui tututor membrilor din familiile inserate mai sus printr-o instructiune while:
DECLARE
    member_name Members.Name%TYPE;
    counter INT := 1;
    max_member_id INT;
BEGIN
    SELECT MAX(MemberID) INTO max_member_id FROM Members;

  WHILE counter <= max_member_id LOOP
    SELECT Name INTO member_name FROM Members WHERE MemberID = counter;
        DBMS_OUTPUT.PUT_LINE('Nume membru: ' || member_name);
        counter := counter + 1;
  END LOOP;
END;
/

-- 5. Tratarea unei excep?ii implicite (NO_DATA_FOUND):
DECLARE 
  total_income DECIMAL(10,2);
BEGIN
  SELECT TotalIncome INTO total_income FROM BudgetFamily WHERE FamilyID = 100;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nu exist? nicio familie cu ID-ul 100.');
END;
/

-- 6.Tratarea unei excep?ii explicite (verificarea vârstei unui membru):
DECLARE 
  member_age INT;
  age_exception EXCEPTION;
BEGIN
  SELECT Age INTO member_age FROM Members WHERE MemberID = 2;
  
  IF member_age < 18 THEN
    RAISE age_exception;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Membrul este trecut de 18 ani !');
  END IF;
EXCEPTION
  WHEN age_exception THEN
    DBMS_OUTPUT.PUT_LINE('Membrul nu este trecut de 18 ani!');
END;
/

-- 7.Tratarea unei excep?ii explicite (verificarea venitului total al unei familii) : 
DECLARE 
  total_income DECIMAL(10,2);
  income_exception EXCEPTION;
BEGIN
  SELECT TotalIncome INTO total_income FROM BudgetFamily WHERE FamilyID = 1;
  
  IF total_income < 5000 THEN
    RAISE income_exception;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Familia are un venit total suficient.');
  END IF;
EXCEPTION
  WHEN income_exception THEN
    DBMS_OUTPUT.PUT_LINE('Familia are un venit total insuficient.');
END;
/

--8.  Tratarea unei exceptii implicite (TOO_MANY_ROWS) la afisarea unui SELECT:
DECLARE 
  member_name VARCHAR(100);
BEGIN
  -- Încerc?m s? recuper?m numele tuturor membrilor într-o singur? variabil?
  SELECT Name INTO member_name FROM Members;
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Interogarea a returnat prea multe rânduri.');
END;
/

-- 9. Utilizarea unui cursor implicit pentru afisarea venitului total al unei familii:
DECLARE 
  total_income DECIMAL(10,2);
BEGIN
  SELECT TotalIncome INTO total_income FROM BudgetFamily WHERE FamilyID = 7;
  DBMS_OUTPUT.PUT_LINE('Venitul total al familiei 7 este: ' || total_income);
END;
/

-- 10. Utilizarea unui cursor implicit pentru a afisa numele membrului cu id-ul respectiv : 
DECLARE 
  member_name VARCHAR(100);
BEGIN
  -- Cursorul implicit este utilizat aici
  SELECT Name INTO member_name FROM Members WHERE MemberID = 10;
  DBMS_OUTPUT.PUT_LINE('Numele membrului cu ID-ul 10 este: ' || member_name);
END;
/
-- 11.  Utilizarea unui cursor explicit cu parametru pentru a itera familiile si afisa membrii familiei respective: 
DECLARE
  CURSOR c_members(p_family_id IN Family.FamilyID%TYPE) IS
    SELECT MemberID, Name, Age
    FROM Members
    WHERE FamilyID = p_family_id;
  v_member_id Members.MemberID%TYPE;
  v_member_name Members.Name%TYPE;
  v_member_age Members.Age%TYPE;
  v_family_id Family.FamilyID%TYPE := 1; 
BEGIN
  OPEN c_members(v_family_id);
  LOOP
    FETCH c_members INTO v_member_id, v_member_name, v_member_age;
    EXIT WHEN c_members%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('MemberID: ' || v_member_id || ', Name: ' || v_member_name || ', Age: ' || v_member_age);
  END LOOP;
  CLOSE c_members;
END;
/

-- 12. Utilizarea unui cursor explicit cu parametru pentru a adauga si rolul membrului din familia gasita : 
DECLARE
  CURSOR c_members(p_family_id IN Family.FamilyID%TYPE) IS
    SELECT Name, Age, Role
    FROM Members
    WHERE FamilyID = p_family_id;

  v_name Members.Name%TYPE;
  v_age Members.Age%TYPE;
  v_role Members.Role%TYPE;
  v_family_id Family.FamilyID%TYPE := 1;

BEGIN
  OPEN c_members(v_family_id);
  LOOP
    FETCH c_members INTO v_name, v_age, v_role;
    EXIT WHEN c_members%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Nume: ' || v_name || ', Vârst?: ' || v_age || ', Rol: ' || v_role);
  END LOOP;
  CLOSE c_members;
END;
/
--13. Afisarea obiectivului financiar pentru fiecare familie: (cursor fara parametrii)
DECLARE 
  CURSOR objective_cursor IS
    SELECT * FROM FinancialObjective;
  objective_record FinancialObjective%ROWTYPE;
BEGIN
  OPEN objective_cursor;
  LOOP
    FETCH objective_cursor INTO objective_record;
    EXIT WHEN objective_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Numele obiectivului financiar este: ' || objective_record.ObjectiveName);
  END LOOP;
  CLOSE objective_cursor;
END;
/

--14. Afisarea ID-ului si numele si suma tranzactiei utilizand un cursor fara parametrii:
DECLARE
  CURSOR c_transactions IS
    SELECT TransactionID, TransactionType, Amount
    FROM Transactions;

  v_transaction_id Transactions.TransactionID%TYPE;
  v_transaction_type Transactions.TransactionType%TYPE;
  v_transaction_amount Transactions.Amount%TYPE;
BEGIN
  OPEN c_transactions;
  LOOP
    FETCH c_transactions INTO v_transaction_id, v_transaction_type, v_transaction_amount;
    EXIT WHEN c_transactions%NOTFOUND;
    -- Procesa?i datele din tabelul Transactions în func?ie de nevoile dumneavoastr?.
    DBMS_OUTPUT.PUT_LINE('ID tranzactie: ' || v_transaction_id || ', Tip tranzactie: ' || v_transaction_type || ', Sum?: ' || v_transaction_amount);
  END LOOP;
  CLOSE c_transactions;
END;
/

--15.  Functie care returneaza numele familiei dupa id-ul acestora:

CREATE OR REPLACE FUNCTION get_family_name (p_family_id IN Family.FamilyID%TYPE) 
RETURN VARCHAR2 IS
  family_name Family.FamilyName%TYPE;
BEGIN
  SELECT FamilyName INTO family_name FROM Family WHERE FamilyID = p_family_id;
  RETURN family_name;
END;
/

SELECT FamilyID, get_family_name(FamilyID) AS FamilyName
FROM Family;

-- 16. Afisarea venitului total in functie de bugetul familiei:

CREATE OR REPLACE FUNCTION get_total_income (p_family_id IN BudgetFamily.FamilyID%TYPE) 
RETURN DECIMAL IS
  total_income BudgetFamily.TotalIncome%TYPE;
BEGIN
  SELECT TotalIncome INTO total_income FROM BudgetFamily WHERE FamilyID = p_family_id;
  RETURN total_income;
END;
/

DECLARE
  v_family_id BudgetFamily.FamilyID%TYPE := 9; 
  v_total_income BudgetFamily.TotalIncome%TYPE;
BEGIN
  v_total_income := get_total_income(v_family_id);
  DBMS_OUTPUT.PUT_LINE('Venitul total al familiei cu ID-ul ' || v_family_id || ' este: ' || v_total_income);
END;
/

-- 17. Realizarea unei functii ce arata de ce suma necesara este nevoie pentru o familie sa ajunga sa-si indeplineasca obiectivul financiar:
CREATE OR REPLACE FUNCTION get_remaining_savings_needed(p_family_id IN BudgetFamily.FamilyID%TYPE)
RETURN DECIMAL IS
    total_savings BudgetFamily.TotalSavings%TYPE;
    total_income BudgetFamily.TotalIncome%TYPE;
    remaining_savings_needed DECIMAL(10,2);
BEGIN
    SELECT TotalSavings INTO total_savings
    FROM BudgetFamily
    WHERE FamilyID = p_family_id;

    SELECT SUM(Amount) INTO total_income
    FROM Income
    WHERE MemberID IN (SELECT MemberID FROM Members WHERE FamilyID = p_family_id);

    remaining_savings_needed := total_savings - total_income;

    RETURN remaining_savings_needed;
END;
/

DECLARE
  family_id BudgetFamily.FamilyID%TYPE := 9;
  remaining_savings DECIMAL(10,2);
BEGIN
  remaining_savings := get_remaining_savings_needed(family_id);
  DBMS_OUTPUT.PUT_LINE('Suma necesar? pentru atingerea obiectivului financiar al familiei ' || family_id || ' este: ' || remaining_savings);
END;
/

-- 18. (Proceduri) Afisearea numelui unei familii pe baza ID-ului:
CREATE OR REPLACE PROCEDURE print_family_name (p_family_id IN Family.FamilyID%TYPE) IS
  family_name Family.FamilyName%TYPE;
BEGIN
  SELECT FamilyName INTO family_name FROM Family WHERE FamilyID = p_family_id;
  DBMS_OUTPUT.PUT_LINE('Numele familiei este: ' || family_name);
END;
/

DECLARE
  family_id Family.FamilyID%TYPE := 1;
BEGIN
  print_family_name(family_id);
END;
/
-- 19. Afisarea unui anumit membru pe baza ID-ului:
CREATE OR REPLACE PROCEDURE print_member_name (p_member_id IN Members.MemberID%TYPE) IS
  member_name Members.Name%TYPE;
BEGIN
  SELECT Name INTO member_name FROM Members WHERE MemberID = p_member_id;
  DBMS_OUTPUT.PUT_LINE('Numele membrului este: ' || member_name);
END;
/

DECLARE
  family_id Family.FamilyID%TYPE := 17;
BEGIN
  print_member_name(family_id);
END;
/

-- 20. Procedura ce afiseaza venitul total al unei familii pe baza ID-ului: 
CREATE OR REPLACE PROCEDURE print_total_income (p_family_id IN BudgetFamily.FamilyID%TYPE) IS
  total_income BudgetFamily.TotalIncome%TYPE;
BEGIN
  SELECT TotalIncome INTO total_income FROM BudgetFamily WHERE FamilyID = p_family_id;
  DBMS_OUTPUT.PUT_LINE('Venitul total al familiei este: ' || total_income);
END;
/

DECLARE
  family_id BudgetFamily.FamilyID%TYPE := 6;
BEGIN
  print_total_income(family_id);
END;
/

-- 21. Afisarea tip tabel a famiilor impreuna cu unul din membrii si venitul total:
CREATE OR REPLACE PROCEDURE display_family_info AS
BEGIN
  FOR rec IN (SELECT f.FamilyName, m.Name AS MemberName, bf.TotalIncome
              FROM Family f
              JOIN Members m ON f.FamilyID = m.FamilyID
              JOIN BudgetFamily bf ON f.FamilyID = bf.FamilyID)
  LOOP
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Nume familie: ' || rec.FamilyName);
    DBMS_OUTPUT.PUT_LINE('Membru: ' || rec.MemberName);
    DBMS_OUTPUT.PUT_LINE('Venit total: ' || rec.TotalIncome);
  END LOOP;
END;
/

BEGIN
  display_family_info;
END;
/

-- 22. Realizarea unui pachet cu toate functiile si procedurile realizate mai sus: 
CREATE OR REPLACE PACKAGE family_management AS
  FUNCTION get_family_name (p_family_id IN Family.FamilyID%TYPE) 
        RETURN VARCHAR2;
  FUNCTION get_total_income (p_family_id IN BudgetFamily.FamilyID%TYPE) 
        RETURN DECIMAL;
  FUNCTION get_remaining_savings_needed(p_family_id IN BudgetFamily.FamilyID%TYPE)
        RETURN DECIMAL;
  PROCEDURE print_family_name (p_family_id IN Family.FamilyID%TYPE);
  PROCEDURE print_member_name (p_member_id IN Members.MemberID%TYPE);
  PROCEDURE print_total_income (p_family_id IN BudgetFamily.FamilyID%TYPE);
  PROCEDURE display_family_info;
END family_management;
/

-- 23. (Trigger)

CREATE OR REPLACE TRIGGER update_budget_savings
    AFTER INSERT OR UPDATE OR DELETE ON Savings
    FOR EACH ROW
DECLARE
    total_savings DECIMAL(10,2);
BEGIN
     SELECT COALESCE(SUM(Amount), 0) INTO total_savings
        FROM Savings
            WHERE UserID = :NEW.UserID;
        UPDATE BudgetFamily
            SET TotalSavings = TotalIncome - TotalExpenditure - total_savings
                WHERE FamilyID = (SELECT FamilyID FROM UserFamily WHERE UserID = :NEW.UserID);
  COMMIT;
END;
/

--24. (Trigger)

CREATE OR REPLACE TRIGGER update_budget_objective
        AFTER INSERT OR UPDATE OR DELETE ON FinancialObjective
            FOR EACH ROW
DECLARE
    total_objective DECIMAL(10,2);
BEGIN
    SELECT COALESCE(SUM(ObjectiveAmount), 0) INTO total_objective
        FROM FinancialObjective
            WHERE FamilyID = :NEW.FamilyID;

  UPDATE BudgetFamily
    SET TotalSavings = TotalIncome - TotalExpenditure - total_objective
        WHERE FamilyID = :NEW.FamilyID;
END;
/

-- 25. Final

BEGIN
  DBMS_OUTPUT.PUT_LINE('Sfarsitul Proiectului! Va multumesc !.');
END;
/
COMMIT;

