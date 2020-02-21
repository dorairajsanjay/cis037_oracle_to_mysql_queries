
-- PURPOSE: CREATE THE ORACLE TABLES FOR THE EXAMPLES AND STUDENT EXERCISES
-- IN THE BOOK "SQL FUNDAMENTALS - 3RD EDITION".

-- THIS SHOULD ONLY BE RUN ONCE.

-- WRITTEN BY: JOHN PATRICK
-- DATE: JULY 2008
-- COPYRIGHT: JOHN PATRICK

-- This script is intended to be run from SQL SCRIPTS page
-- Which can be accessed from the Oracle Home Page interface

-- Within SQL Scripts, use the Upload button to load this file

-- ************************************************************
-- LOAD THE LUNCHES DATABASE TABLES:
--              L_EMPLOYEES
--              L_FOODS
--              L_DEPARTMENTS
--              L_LUNCHES
--              L_LUNCH_ITEMS
--              L_SUPPLIERS
--              L_CONSTANTS
-- ************************************************************

-- CLEAN UP EXISTING DB AND CREATE A NEW ONE
DROP DATABASE IF EXISTS sqllunch;
CREATE DATABASE sqllunch;
USE sqllunch;


-- CREATE THE L_EMPLOYEES TABLE
CREATE TABLE L_EMPLOYEES
(EMPLOYEE_ID    INT(3) NOT NULL UNIQUE AUTO_INCREMENT,
FIRST_NAME      VARCHAR(10),
LAST_NAME       VARCHAR(20),
DEPT_CODE       VARCHAR(3),
HIRE_DATE       DATE,
CREDIT_LIMIT    INT(4),
PHONE_INT    VARCHAR(4),
MANAGER_ID      INT(3));

ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT PK_L_EMPLOYEES
PRIMARY KEY (EMPLOYEE_ID);


INSERT INTO L_EMPLOYEES VALUES
  (201, 'SUSAN', 'BROWN', 'EXE', str_to_date('01-Jun-1998','%d-%M-%Y'), 30, '3484', NULL);
INSERT INTO L_EMPLOYEES VALUES
  (202, 'JIM', 'KERN', 'SAL', str_to_date('16-AUG-1999','%d-%M-%Y'), 25, '8722', 201);
INSERT INTO L_EMPLOYEES VALUES
  (203, 'MARTHA', 'WOODS', 'SHP', str_to_date('02-FEB-2009','%d-%M-%Y'), 25, '7591', 201);
INSERT INTO L_EMPLOYEES VALUES
  (204, 'ELLEN', 'OWENS', 'SAL', str_to_date('01-JUL-2008','%d-%M-%Y'), 15, '6830', 202);
INSERT INTO L_EMPLOYEES VALUES
  (205, 'HENRY', 'PERKINS', 'SAL', str_to_date('01-MAR-2006','%d-%M-%Y'), 25, '5286', 202);
INSERT INTO L_EMPLOYEES VALUES
  (206, 'CAROL', 'ROSE', 'ACT', NULL, NULL, NULL, NULL);
INSERT INTO L_EMPLOYEES VALUES
  (207, 'DAN', 'SMITH', 'SHP', str_to_date('01-DEC-2008','%d-%M-%Y'), 25, '2259', 203);
INSERT INTO L_EMPLOYEES VALUES
  (208, 'FRED', 'CAMPBELL', 'SHP', str_to_date('01-APR-2008','%d-%M-%Y'), 25, '1752', 203);
INSERT INTO L_EMPLOYEES VALUES
  (209, 'PAULA', 'JACOBS', 'MKT', str_to_date('17-MAR-1999','%d-%M-%Y'), 15, '3357', 201);
INSERT INTO L_EMPLOYEES VALUES
  (210, 'NANCY', 'HOFFMAN', 'SAL', str_to_date('16-FEB-2007','%d-%M-%Y'), 25, '2974', 203);
COMMIT;

ANALYZE TABLE L_EMPLOYEES;




-- CREATE THE L_FOODS TABLE
CREATE TABLE L_FOODS
(SUPPLIER_ID    VARCHAR(3),
PRODUCT_CODE    VARCHAR(2),
MENU_ITEM       INT(2) NOT NULL UNIQUE AUTO_INCREMENT,
DESCRIPTION     VARCHAR(20),
PRICE           INT(4),
PRICE_INCREASE  DECIMAL(4,2));


ALTER TABLE L_FOODS
ADD CONSTRAINT PK_L_FOODS
PRIMARY KEY (SUPPLIER_ID, PRODUCT_CODE);


INSERT INTO L_FOODS VALUES ('ASP', 'FS', 1, 'FRESH SALAD', 2, 0.25);
INSERT INTO L_FOODS VALUES ('ASP', 'SP', 2, 'SOUP OF THE DAY', 1.5, NULL);
INSERT INTO L_FOODS VALUES ('ASP', 'SW', 3, 'SANDWICH', 3.5, 0.4);
INSERT INTO L_FOODS VALUES ('CBC', 'GS', 4, 'GRILLED STEAK', 6, 0.7);
INSERT INTO L_FOODS VALUES ('CBC', 'SW', 5, 'HAMBURGER', 2.5, 0.3);
INSERT INTO L_FOODS VALUES ('FRV', 'BR', 6, 'BROCCOLI', 1, 0.05);
INSERT INTO L_FOODS VALUES ('FRV', 'FF', 7, 'FRENCH FRIES', 1.5, NULL);
INSERT INTO L_FOODS VALUES ('JBR', 'AS', 8, 'SODA', 1.25, 0.25);
INSERT INTO L_FOODS VALUES ('JBR', 'VR', 9, 'COFFEE', 0.85, 0.15);
INSERT INTO L_FOODS VALUES ('VSB', 'AS', 10, 'DESSERT', 3, 0.5);
COMMIT;

ANALYZE TABLE L_FOODS;



-- CREATE THE L_DEPARTMENTS TABLE
CREATE TABLE L_DEPARTMENTS
(DEPT_CODE           VARCHAR(3),
DEPARTMENT_NAME     VARCHAR(30));


ALTER TABLE L_DEPARTMENTS
ADD CONSTRAINT PK_L_DEPARTMENTS
PRIMARY KEY (DEPT_CODE);


INSERT INTO L_DEPARTMENTS VALUES ('ACT', 'ACCOUNTING');
INSERT INTO L_DEPARTMENTS VALUES ('EXE', 'EXECUTIVE');
INSERT INTO L_DEPARTMENTS VALUES ('MKT', 'MARKETING');
INSERT INTO L_DEPARTMENTS VALUES ('PER', 'PERSONNEL');
INSERT INTO L_DEPARTMENTS VALUES ('SAL', 'SALES');
INSERT INTO L_DEPARTMENTS VALUES ('SHP', 'SHIPPING');
COMMIT;

ANALYZE TABLE L_DEPARTMENTS;


-- CREATE THE L_LUNCHES TABLE.
CREATE TABLE L_LUNCHES
(LUNCH_ID     INT(3),
LUNCH_DATE    DATE,
EMPLOYEE_ID   INT(3),
DATE_ENTERED  DATE);


ALTER TABLE L_LUNCHES
ADD CONSTRAINT PK_L_LUNCHES
PRIMARY KEY (LUNCH_ID);



INSERT INTO L_LUNCHES VALUES (1,  str_to_date('16-NOV-2011','%d-%M-%Y'), 201, STR_TO_DATE('13-OCT-2011 10:35:24', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (2,  str_to_date('16-NOV-2011','%d-%M-%Y'), 207, STR_TO_DATE('13-OCT-2011 10:35:39', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (3,  str_to_date('16-NOV-2011','%d-%M-%Y'), 203, STR_TO_DATE('13-OCT-2011 10:35:45', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (4,  str_to_date('16-NOV-2011','%d-%M-%Y'), 204, STR_TO_DATE('13-OCT-2011 10:35:58', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (6,  str_to_date('16-NOV-2011','%d-%M-%Y'), 202, STR_TO_DATE('13-OCT-2011 10:36:41', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (7,  str_to_date('16-NOV-2011','%d-%M-%Y'), 210, STR_TO_DATE('13-OCT-2011 10:38:52', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (8,  str_to_date('25-NOV-2011','%d-%M-%Y'), 201, STR_TO_DATE('14-OCT-2011 11:15:37', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (9,  str_to_date('25-NOV-2011','%d-%M-%Y'), 208, STR_TO_DATE('14-OCT-2011 14:23:36', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (12, str_to_date('25-NOV-2011','%d-%M-%Y'), 204, STR_TO_DATE('14-OCT-2011 15:02:53', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (13, str_to_date('25-NOV-2011','%d-%M-%Y'), 207, STR_TO_DATE('18-OCT-2011 08:42:11', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (15, str_to_date('25-NOV-2011','%d-%M-%Y'), 205, STR_TO_DATE('21-OCT-2011 16:23:50', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (16, str_to_date('05-DEC-2011','%d-%M-%Y'), 201, STR_TO_DATE('21-OCT-2011 16:23:59', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (17, str_to_date('05-DEC-2011','%d-%M-%Y'), 210, STR_TO_DATE('21-OCT-2011 16:35:26', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (20, str_to_date('05-DEC-2011','%d-%M-%Y'), 205, STR_TO_DATE('24-OCT-2011 09:55:27', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (21, str_to_date('05-DEC-2011','%d-%M-%Y'), 203, STR_TO_DATE('24-OCT-2011 11:43:13', '%d-%M-%Y %H:%i:%s'));
INSERT INTO L_LUNCHES VALUES (22, str_to_date('05-DEC-2011','%d-%M-%Y'), 208, STR_TO_DATE('24-OCT-2011 14:37:32', '%d-%M-%Y %H:%i:%s'));
COMMIT;

ANALYZE TABLE L_LUNCHES;

-- CREATE THE L_LUNCH_ITEMS TABLE.
CREATE TABLE L_LUNCH_ITEMS
(LUNCH_ID       INT(3),
ITEM_INT     INT(2),
SUPPLIER_ID     VARCHAR(3),
PRODUCT_CODE    VARCHAR(2),
QUANTITY        INT(1));

ALTER TABLE L_LUNCH_ITEMS
ADD CONSTRAINT PK_L_LUNCH_ITEMS
PRIMARY KEY (LUNCH_ID, ITEM_INT);

INSERT INTO L_LUNCH_ITEMS VALUES (1, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (1, 2, 'ASP', 'SW', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (1, 3, 'JBR', 'VR', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (2, 1, 'ASP', 'SW', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (2, 2, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (2, 3, 'JBR', 'VR', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (2, 4, 'VSB', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (3, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (3, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (3, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (3, 4, 'JBR', 'VR', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (3, 5, 'JBR', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (4, 1, 'ASP', 'SP', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (4, 2, 'CBC', 'SW', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (4, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (4, 4, 'JBR', 'AS', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (6, 1, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (6, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (6, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (6, 4, 'JBR', 'VR', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (6, 5, 'VSB', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (7, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (7, 2, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (7, 3, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (7, 4, 'JBR', 'VR', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (7, 5, 'VSB', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (8, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (8, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (8, 3, 'JBR', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (9, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (9, 2, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (9, 3, 'CBC', 'SW', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (9, 4, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (9, 5, 'JBR', 'VR', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (9, 6, 'JBR', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (12, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (12, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (12, 3, 'JBR', 'VR', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (12, 4, 'VSB', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (13, 1, 'ASP', 'SP', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (13, 2, 'ASP', 'SW', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (13, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (13, 4, 'JBR', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (15, 1, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (15, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (15, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (15, 4, 'JBR', 'AS', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (16, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (16, 2, 'ASP', 'SW', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (16, 3, 'CBC', 'SW', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (16, 4, 'JBR', 'VR', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (16, 5, 'JBR', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (17, 1, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (17, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (17, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (17, 4, 'JBR', 'VR', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (17, 5, 'VSB', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (20, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (20, 2, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (20, 3, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (20, 4, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (20, 5, 'JBR', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (21, 1, 'ASP', 'SP', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (21, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (21, 3, 'JBR', 'VR', 2);
INSERT INTO L_LUNCH_ITEMS VALUES (21, 4, 'VSB', 'AS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (22, 1, 'ASP', 'FS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (22, 2, 'CBC', 'GS', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (22, 3, 'FRV', 'FF', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (22, 4, 'JBR', 'VR', 1);
INSERT INTO L_LUNCH_ITEMS VALUES (22, 5, 'JBR', 'AS', 1);
COMMIT;

ANALYZE TABLE L_LUNCH_ITEMS;

-- CREATE THE L_SUPPLIERS TABLE
CREATE TABLE L_SUPPLIERS
(SUPPLIER_ID     VARCHAR(3),
SUPPLIER_NAME    VARCHAR(30));

ALTER TABLE L_SUPPLIERS
ADD CONSTRAINT PK_L_SUPPLIERS
PRIMARY KEY (SUPPLIER_ID);

INSERT INTO L_SUPPLIERS VALUES ('ARR', 'ALICE & RAY''S RESTAURANT');
INSERT INTO L_SUPPLIERS VALUES ('ASP', 'A SOUP PLACE');
INSERT INTO L_SUPPLIERS VALUES ('CBC', 'CERTIFIED BEEF COMPANY');
INSERT INTO L_SUPPLIERS VALUES ('FRV', 'FRANK REED''S VEGETABLES');
INSERT INTO L_SUPPLIERS VALUES ('FSN', 'FRANK & SONS');
INSERT INTO L_SUPPLIERS VALUES ('JBR', 'JUST BEVERAGES');
INSERT INTO L_SUPPLIERS VALUES ('JPS', 'JIM PARKER''S SHOP');
INSERT INTO L_SUPPLIERS VALUES ('VSB', 'VIRGINIA STREET BAKERY');
COMMIT;

ANALYZE TABLE L_SUPPLIERS;

-- CREATE THE L_CONSTANTS TABLE
CREATE TABLE L_CONSTANTS
(BUSINESS_NAME         VARCHAR(30),
BUSINESS_START_DATE    DATE,
LUNCH_BUDGET           DECIMAL(5,2),
OWNER_NAME             VARCHAR(30));

INSERT INTO L_CONSTANTS VALUES ('CITYWIDE UNIFORMS', STR_TO_DATE('01-JUN-1998', '%d-%M-%Y'), 200, 'SUSAN BROWN');
COMMIT;

ANALYZE TABLE L_CONSTANTS;


-- Create Referential Integrity Constraints for the Lunches Database
ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT FK_L_EMPLOYEES_DEPT_CODE
FOREIGN KEY (DEPT_CODE)
   REFERENCES L_DEPARTMENTS (DEPT_CODE);


ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT FK_L_EMPLOYEES_MANAGER_ID
FOREIGN KEY (MANAGER_ID)
   REFERENCES L_EMPLOYEES (EMPLOYEE_ID);


ALTER TABLE L_LUNCHES
ADD CONSTRAINT FK_L_LUNCHES_EMPLOYEES
FOREIGN KEY (EMPLOYEE_ID)
   REFERENCES L_EMPLOYEES (EMPLOYEE_ID);


ALTER TABLE L_LUNCH_ITEMS
ADD CONSTRAINT FK_L_LUNCH_ITEMS_LUNCHES
FOREIGN KEY (LUNCH_ID)
   REFERENCES L_LUNCHES (LUNCH_ID);


ALTER TABLE L_LUNCH_ITEMS
ADD CONSTRAINT FK_L_LUNCH_ITEMS_FOODS
FOREIGN KEY (SUPPLIER_ID, PRODUCT_CODE)
   REFERENCES L_FOODS (SUPPLIER_ID, PRODUCT_CODE);


ALTER TABLE L_FOODS
ADD CONSTRAINT FK_L_FOODS_SUPPLIERS
FOREIGN KEY (SUPPLIER_ID)
   REFERENCES L_SUPPLIERS (SUPPLIER_ID)
   ON DELETE CASCADE;



-- Create NOT NULL constraints - Make a required field
ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT NN_L_EMPLOYEES_FIRST_NAME
   CHECK (FIRST_NAME IS NOT NULL);


ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT NN_L_EMPLOYEES_LAST_NAME
   CHECK (LAST_NAME IS NOT NULL);

 
ALTER TABLE L_LUNCHES
ADD CONSTRAINT NN_L_LUNCHES_EMPLOYEE_ID
CHECK (EMPLOYEE_ID IS NOT NULL);


-- Create UNIQUENESS constraints
ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT UNIQUE_L_EMPLOYEES_FULL_NAME
   UNIQUE (FIRST_NAME, LAST_NAME);


ALTER TABLE L_EMPLOYEES
ADD CONSTRAINT UNIQUE_L_EMPPLOYEES_PHONE_NUM
   UNIQUE (PHONE_INT);


-- Create CHECK constraints
ALTER TABLE L_FOODS
ADD CONSTRAINT CHECK_L_FOODS_PRICE_MAX_PRICE
CHECK (PRICE < 10.00);


-- ***************************************************
-- END OF LOADING THE LUNCHES DATABASE
