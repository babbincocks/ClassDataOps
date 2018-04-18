

USE MASTER
GO

IF EXISTS(SELECT * FROM SYS.databases WHERE name = 'JobSearchPlus_Comeau')
BEGIN
	DROP DATABASE JobSearchPlus_Comeau;
END
GO

CREATE DATABASE JobSearchPlus_Comeau
GO

USE JobSearchPlus_Comeau

CREATE TABLE BusinessTypes
(
	BusinessType varchar(50) NOT NULL,
	CONSTRAINT PK_BusinessTypes PRIMARY KEY (BusinessType)
)

GO


INSERT INTO			BusinessTypes
					(BusinessType)
VALUES				
('Accounting'),
('Advertising/Marketing'),
('Agriculture'),
('Architecture'),
('Arts/Entertainment'),
('Aviation'),
('Beauty/Fitness'),
('Business Services'),
('Communications'),
('Computer/Hardware'),
('Computer/Services'),
('Computer/Software'),
('Computer/Training'),
('Construction'),
('Consulting'),
('Crafts/Hobbies'),
('Education'),
('Electrical'),
('Electronics'),
('Employment'),
('Engineering'),
('Environmental'),
('Fashion'),
('Financial'),
('Food/Beverage'),
('Government'),
('Health/Medicine'),
('Home & Garden'),
('Immigration'),
('Import/Export'),
('Industrial'),
('Industrial Medicine'),
('Information Services'),
('Insurance'),
('Internet'),
('Legal & Law'),
('Logistics'),
('Manufacturing'),
('Mapping/Surveying'),
('Marine/Maritime'),
('Motor Vehicle'),
('Multimedia'),
('Network Marketing'),
('News & Weather'),
('Non-Profit'),
('Petrochemical'),
('Pharmaceutical'),
('Printing/Publishing'),
('Real Estate'),
('Restaurants'),
('Restaurants Services'),
('Service Clubs'),
('Service Industry'),
('Shopping/Retail'),
('Spiritual/Religious'),
('Sports/Recreation'),
('Storage/Warehousing'),
('Technologies'),
('Transportation'),
('Travel'),
('Utilities'),
('Venture Capital'),
('Wholesale')



GO

CREATE TABLE Sources
(
	SourceID int NOT NULL IDENTITY(1,1),
	SourceName varchar(75) NOT NULL,
	SourceType varchar(35),
	SourceLink varchar(255),
	SourceDesc varchar(255),
	CONSTRAINT PK_Sources PRIMARY KEY (SourceID)
)

GO

CREATE INDEX IDX_Sources_SourceName ON Sources(SourceName)
CREATE INDEX IDX_Sources_SourceType ON Sources(SourceType)

GO

INSERT INTO		Sources
				(SourceName, SourceType, SourceLink, SourceDesc)
VALUES			('Monster.com', 'Website', 'http://www.monster.com', 'Online job source.'),
				('Dice.com', 'Website', 'http://www.dice.com', 'Online job source.'),
				('LinkedIn.com', 'Website', 'http://www.linkedin.com', 'Professional Networking site.');

CREATE TABLE Companies
(
	CompanyID int NOT NULL IDENTITY(1,1),
	CompanyName varchar(75) NOT NULL,
	Address1 varchar(75),
	Address2 varchar(75),
	City varchar(50),
	StateAbbrev varchar(2),
	ZIP varchar(10),
	Phone varchar(14),
	FAX varchar(14),
	Email varchar(50),
	Website varchar(255),
	CompanyDesc varchar(1024),
	BusinessType varchar(50),
	Agency bit CONSTRAINT DF_Companies_Agency DEFAULT 0,
	CONSTRAINT PK_Companies PRIMARY KEY (CompanyID)
)

GO

CREATE INDEX IDX_Companies_City ON Companies(City)
CREATE INDEX IDX_Sources_CompanyName ON Companies(CompanyName)
CREATE INDEX IDX_Sources_State ON Companies(StateAbbrev)
CREATE UNIQUE INDEX IDX_Sources_UniqueCompany ON Companies(CompanyName, Address1)
CREATE INDEX IDX_Sources_ZIP ON Companies(ZIP)

GO


insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Youopia', '115 Ridgeview Parkway', 'Salt Lake City', 'UT', '84152', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Leexo', '0629 Annamark Hill', 'Dallas', 'TX', '75358', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Flashpoint', '08 Dottie Way', 'Terre Haute', 'IN', '47805', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Skiptube', '057 Victoria Plaza', 'Washington', 'DC', '20540', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Layo', '4244 Oak Crossing', 'Erie', 'PA', '16550', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Devcast', '95611 Pankratz Hill', 'San Jose', 'CA', '95160', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Realbridge', '49 Veith Center', 'Clearwater', 'FL', '34620', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Realblab', '2181 Eliot Crossing', 'Sacramento', 'CA', '94291', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Browseblab', '0644 Menomonie Junction', 'Buffalo', 'NY', '14269', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Realcube', '9 6th Junction', 'Baton Rouge', 'LA', '70836', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Eire', '81565 Crowley Terrace', 'Spring', 'TX', '77388', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Meevee', '9350 Dennis Junction', 'Albuquerque', 'NM', '87140', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Gabspot', '117 Scoville Terrace', 'Des Moines', 'IA', '50330', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Zooxo', '5846 Meadow Vale Parkway', 'New York City', 'NY', '10099', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Blogtag', '67 Packers Point', 'Waterbury', 'CT', '06705', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Kanoodle', '3098 Warner Court', 'Yakima', 'WA', '98907', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Wikido', '04992 Schlimgen Plaza', 'Toledo', 'OH', '43666', 1);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Buzzshare', '791 Melvin Point', 'Sioux Falls', 'SD', '57198', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Cogidoo', '807 Green Hill', 'Topeka', 'KS', '66642', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Kwinu', '031 Mifflin Junction', 'San Francisco', 'CA', '94154', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Eadel', '4 Service Court', 'Roanoke', 'VA', '24004', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Blogtags', '06141 Old Shore Pass', 'Louisville', 'KY', '40233', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Feednation', '5 Kropf Park', 'Madison', 'WI', '53716', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Brainbox', '82 Scoville Point', 'Dallas', 'TX', '75260', 0);
insert into Companies (CompanyName, Address1, City, StateAbbrev, ZIP, Agency) values ('Fatz', '94546 Corben Drive', 'Flint', 'MI', '48555', 1);
GO

CREATE TABLE Leads
(
	LeadID int NOT NULL IDENTITY(1,1),
	RecordDate datetime NOT NULL
		CONSTRAINT DF_Leads_RecordDate DEFAULT GETDATE(),
	JobTitle varchar(75) NOT NULL,
	LeadDesc varchar(2048),
	EmploymentType varchar(25),
	Location varchar(50),
	Active bit NOT NULL
		CONSTRAINT DF_Leads_Active DEFAULT (-1),
	CompanyID int,
	AgencyID int,
	ContactID int,
	SourceID int,
	ModifiedDate datetime NOT NULL CONSTRAINT DF_Leads_ModifiedDate DEFAULT GETDATE(),
	Selected bit
	CONSTRAINT DF_Leads_Selected DEFAULT (0),
	CONSTRAINT PK_Leads PRIMARY KEY (LeadID),
	CONSTRAINT CK_NoFutureLeads CHECK (RecordDate <= GETDATE())
)

CREATE INDEX IDX_Leads_RecordDate ON Leads(RecordDate)
CREATE INDEX IDX_Leads_JobTitle ON Leads(JobTitle)
CREATE INDEX IDX_Leads_EmploymentType ON Leads(EmploymentType)
CREATE INDEX IDX_Leads_CompanyID ON Leads(CompanyID)
CREATE INDEX IDX_Leads_AgencyID ON Leads(AgencyID)
CREATE INDEX IDX_Leads_ContactID ON Leads(ContactID)
CREATE INDEX IDX_Leads_SourceID ON Leads(SourceID)

GO

insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('2/20/2018', 'Librarian', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Contractor', 0, 1);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/8/2018', 'Structural Engineer', 'Nulla facilisi.', 'Part-Time', 1, 10);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/5/2018', 'Speech Pathologist', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'Part-Time', 0, 9);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/6/2018', 'Software Consultant', 'Vestibulum rutrum rutrum neque.', 'Part-Time', 1, 9);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/11/2018', 'Nurse', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', 'Contractor', 1, 2);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('2/6/2018', 'Chemical Engineer', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'Contractor', 0, 7);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/14/2018', 'Senior Financial Analyst', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Contractor', 0, 15);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('2/22/2018', 'Product Engineer', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'Full-Time', 0, 7);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/6/2018', 'Legal Assistant', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 'Contractor', 0, 11);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/24/2018', 'Developer I', 'In quis justo.', 'Part-Time', 0, 2);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('2/4/2018', 'Project Manager', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'Part-Time', 0, 14);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/17/2018', 'Senior Developer', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Part-Time', 0, 3);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/12/2018', 'Tax Accountant', 'Pellentesque ultrices mattis odio.', 'Part-Time', 1, 1);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/3/2018', 'Software Consultant', 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'Contractor', 0, 5);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('2/9/2018', 'Structural Engineer', 'Praesent blandit. Nam nulla.', 'Full-Time', 0, 4);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/12/2018', 'VP Quality Control', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'Part-Time', 0, 5);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/2/2018', 'Occupational Therapist', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Contractor', 1, 7);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/21/2018', 'Assistant Professor', 'Mauris sit amet eros.', 'Full-Time', 1, 5);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/13/2018', 'Senior Cost Accountant', 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'Contractor', 1, 13);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('2/15/2018', 'Actuary', 'Integer non velit.', 'Contractor', 0, 6);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/22/2018', 'Senior Editor', 'Nulla tellus. In sagittis dui vel nisl.', 'Full-Time', 1, 8);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/20/2018', 'Analyst Programmer', 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'Full-Time', 0, 14);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('1/16/2018', 'VP Marketing', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'Contractor', 1, 2);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/18/2018', 'Engineer I', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'Contractor', 0, 2);
insert into Leads (RecordDate, JobTitle, LeadDesc, EmploymentType, Active, CompanyID) values ('3/21/2018', 'Software Engineer III', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 'Contractor', 1, 7);

CREATE TABLE Activities
(
	ActivityID int NOT NULL IDENTITY(1,1),
	LeadID int NOT NULL,
	ActivityDate datetime NOT NULL
		CONSTRAINT DF_Activities_ActivityDate DEFAULT GETDATE(),
	ActivityType varchar(25) NOT NULL,
	ActivityDetails varchar(255),
	Complete bit
		CONSTRAINT DF_Activities_Complete DEFAULT (0),
	ReferenceLink varchar(255)
	CONSTRAINT PK_Activities PRIMARY KEY (ActivityID)
)

GO

CREATE INDEX IDX_Activities_ActivityDate ON Activities(ActivityDate)
CREATE INDEX IDX_Activities_ActivityID ON Activities(ActivityID)
CREATE INDEX IDX_Activities_ActivityType ON Activities(ActivityType)
CREATE INDEX IDX_Activities_LeadID ON Activities(LeadID)

GO	


CREATE TABLE ActivityTypes
(
	ActivityType varchar(25) NOT NULL,
	CONSTRAINT PK_ActivityTypes PRIMARY KEY (ActivityType)
)

GO

CREATE TABLE Contacts
(
	ContactID int NOT NULL IDENTITY(1,1),
	CompanyID int NOT NULL,
	CourtesyTitle varchar(25),
	ContactFirstName varchar(50) NOT NULL,
	ContactLastName varchar(50) NOT NULL,
	Title varchar(50),
	Phone varchar(14),
	Extension varchar(10),
	Fax varchar(14),
	Email varchar(50),
	Comments varchar(255),
	Active bit CONSTRAINT DF_Contacts_Active DEFAULT (-1),
	CONSTRAINT PK_Contacts PRIMARY KEY (ContactID)
)

GO

CREATE INDEX IDX_Contacts_LastName ON Contacts(ContactLastName)
CREATE INDEX IDX_Contacts_CompanyID ON Contacts(CompanyID)
CREATE INDEX IDX_Contacts_Title ON Contacts(Title)
CREATE UNIQUE INDEX IDX_Contacts_UniqueComp ON Contacts(ContactID, ContactFirstName, ContactLastName, Title)

GO



CREATE TRIGGER TRG_Leads_ModifiedDate
ON Leads
FOR UPDATE
AS
BEGIN

UPDATE		L
SET			L.ModifiedDate = GETDATE()			
FROM		LEADS L
INNER JOIN	inserted i
ON			i.LeadID = L.LeadID

END

GO

CREATE TRIGGER TRG_Activities_ModifyLeadDate
ON Activities
FOR INSERT, UPDATE, DELETE
AS
BEGIN

UPDATE		L
SET			L.ModifiedDate = GETDATE()			
FROM		LEADS L
INNER JOIN	inserted i
ON			i.LeadID = L.LeadID

END

GO

-- Adding foreign keys

ALTER TABLE Activities
	ADD CONSTRAINT FK_Activities_Leads FOREIGN KEY(LeadID) REFERENCES Leads(LeadID)


ALTER TABLE Leads
	ADD 
	CONSTRAINT FK_Leads_Sources FOREIGN KEY(SourceID) REFERENCES Sources(SourceID),
	CONSTRAINT FK_Leads_Companies FOREIGN KEY(CompanyID) REFERENCES Companies(CompanyID),
	CONSTRAINT FK_Leads_Agencies FOREIGN KEY(AgencyID) REFERENCES Companies(CompanyID),
	CONSTRAINT FK_Leads_Contacts FOREIGN KEY(ContactID) REFERENCES Contacts(ContactID)

GO

ALTER TABLE Contacts
	ADD
	CONSTRAINT FK_Contacts_Companies FOREIGN KEY(CompanyID) REFERENCES Companies(CompanyID)

ALTER TABLE Companies
	ADD
	CONSTRAINT FK_Companies_BusinessTypes FOREIGN KEY(BusinessType) REFERENCES BusinessTypes(BusinessType)

ALTER TABLE Activities
	ADD
	CONSTRAINT FK_Activities_ActivityTypes FOREIGN KEY(ActivityType) REFERENCES ActivityTypes(ActivityType)

	select * from BusinessTypes

GO

CREATE PROCEDURE spGetAgencies
AS

SELECT		CompanyName, City, StateAbbrev, Website
FROM		Companies
WHERE		Agency <> 0;

GO

CREATE PROCEDURE spInsertSource
(
	@SourceName VARCHAR(75),
	@SourceType VARCHAR(35) = '',
	@SourceLink VARCHAR(255) = '',
	@SourceDesc VARCHAR(255) = '',
	@SourceID INT OUTPUT
)
AS

INSERT INTO		Sources
				(SourceName, SourceType, SourceLink, SourceDesc)
VALUES			(@SourceName, @SourceType, @SourceLink, @SourceDesc)

SET @SourceID = SCOPE_IDENTITY()

RETURN

GO


CREATE PROCEDURE spUpdateSource
(
	@SourceID INT,
	@SourceName VARCHAR(75),
	@SourceType VARCHAR(35) = '',
	@SourceLink VARCHAR(255) = '',
	@SourceDesc VARCHAR(255) = ''
	
)
AS

UPDATE		Sources
SET			SourceName = @SourceName, SourceType = @SourceType, SourceLink = @SourceLink, SourceDesc = @SourceDesc
WHERE		SourceID = @SourceID



GO