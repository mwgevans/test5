CREATE TABLE [dbo].[Orders]
(
  [Id] INT NOT NULL PRIMARY KEY,
  [Date] DATETIME DEFAULT CURRENT_TIMESTAMP,
  [Created] DATETIME,
  [Updated] DATETIME
);
GO

CREATE TRIGGER trg_Order_Updated
ON [dbo].[Orders]
 AFTER UPDATE
AS

UPDATE [dbo].[Orders] set [Updated] = GETDATE()
FROM [dbo].[Orders]
JOIN inserted i
ON i.Id = [dbo].[Orders].[Id] -- where ID is your primary key
GO

CREATE TRIGGER trg_Order_Inserted
ON [dbo].[Orders]
 AFTER INSERT
AS

UPDATE [dbo].[Orders] set [Created] = GETDATE()
FROM [dbo].[Orders]
JOIN inserted i
ON i.Id = [dbo].[Orders].[Id] -- where ID is your primary key
GO