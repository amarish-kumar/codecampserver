/*
Script created by SQL Compare version 5.3.0.44 from Red Gate Software Ltd at 5/13/2008 3:03:02 PM
Run this script on (local)\sqlexpress.CodeCampServer to make it the same as (local)\sqlexpress.CodeCampServer
Please back up your database before running this script
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[Conferences]'
GO
CREATE TABLE [dbo].[Conferences]
(
[Id] [uniqueidentifier] NOT NULL,
[ConferenceKey] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ConferenceName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[SponsorInfo] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaxAttendees] [int] NOT NULL,
[LocationName] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Region] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostalCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Conferences__65570293] on [dbo].[Conferences]'
GO
ALTER TABLE [dbo].[Conferences] ADD CONSTRAINT [PK__Conferences__65570293] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[TimeSlots]'
GO
CREATE TABLE [dbo].[TimeSlots]
(
[Id] [uniqueidentifier] NOT NULL,
[ConferenceId] [uniqueidentifier] NOT NULL,
[StartTime] [datetime] NOT NULL,
[EndTime] [datetime] NOT NULL,
[Purpose] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__TimeSlots__636EBA21] on [dbo].[TimeSlots]'
GO
ALTER TABLE [dbo].[TimeSlots] ADD CONSTRAINT [PK__TimeSlots__636EBA21] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[Tracks]'
GO
CREATE TABLE [dbo].[Tracks]
(
[Id] [uniqueidentifier] NOT NULL,
[ConferenceId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Tracks__6EE06CCD] on [dbo].[Tracks]'
GO
ALTER TABLE [dbo].[Tracks] ADD CONSTRAINT [PK__Tracks__6EE06CCD] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[Sessions]'
GO
CREATE TABLE [dbo].[Sessions]
(
[Id] [uniqueidentifier] NOT NULL,
[ConferenceId] [uniqueidentifier] NOT NULL,
[Title] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Abstract] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsApproved] [bit] NOT NULL,
[SpeakerId] [uniqueidentifier] NOT NULL,
[TrackId] [uniqueidentifier] NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Sessions__6B0FDBE9] on [dbo].[Sessions]'
GO
ALTER TABLE [dbo].[Sessions] ADD CONSTRAINT [PK__Sessions__6B0FDBE9] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[ScheduledSessions]'
GO
CREATE TABLE [dbo].[ScheduledSessions]
(
[TimeSlotId] [uniqueidentifier] NOT NULL,
[SessionId] [uniqueidentifier] NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__ScheduledSession__673F4B05] on [dbo].[ScheduledSessions]'
GO
ALTER TABLE [dbo].[ScheduledSessions] ADD CONSTRAINT [PK__ScheduledSession__673F4B05] PRIMARY KEY CLUSTERED  ([TimeSlotId], [SessionId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[People]'
GO
CREATE TABLE [dbo].[People]
(
[Id] [uniqueidentifier] NOT NULL,
[FirstName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Website] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PasswordSalt] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsAdministrator] [bit] NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__People__71BCD978] on [dbo].[People]'
GO
ALTER TABLE [dbo].[People] ADD CONSTRAINT [PK__People__71BCD978] PRIMARY KEY CLUSTERED  ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[Attendance]'
GO
CREATE TABLE [dbo].[Attendance]
(
[ConferenceId] [uniqueidentifier] NOT NULL,
[PersonId] [uniqueidentifier] NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Attendance__6CF8245B] on [dbo].[Attendance]'
GO
ALTER TABLE [dbo].[Attendance] ADD CONSTRAINT [PK__Attendance__6CF8245B] PRIMARY KEY CLUSTERED  ([ConferenceId], [PersonId])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[Speakers]'
GO
CREATE TABLE [dbo].[Speakers]
(
[ConferenceId] [uniqueidentifier] NOT NULL,
[PersonId] [uniqueidentifier] NULL,
[SpeakerKey] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Bio] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AvatarUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[Sponsors]'
GO
CREATE TABLE [dbo].[Sponsors]
(
[ConferenceId] [uniqueidentifier] NOT NULL,
[Level] [int] NOT NULL,
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogoUrl] [nvarchar] (260) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Website] [nvarchar] (260) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__Sponsors__69279377] on [dbo].[Sponsors]'
GO
ALTER TABLE [dbo].[Sponsors] ADD CONSTRAINT [PK__Sponsors__69279377] PRIMARY KEY CLUSTERED  ([ConferenceId], [Level], [Name], [LogoUrl], [Website], [FirstName], [LastName], [Email])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[Speakers]'
GO
ALTER TABLE [dbo].[Speakers] ADD CONSTRAINT [UQ__Speakers__618671AF] UNIQUE NONCLUSTERED  ([SpeakerKey])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[Tracks]'
GO
ALTER TABLE [dbo].[Tracks] ADD CONSTRAINT [UQ__Tracks__6FD49106] UNIQUE NONCLUSTERED  ([Name])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[Attendance]'
GO
ALTER TABLE [dbo].[Attendance] ADD
CONSTRAINT [FKA570358B8B56D115] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id]),
CONSTRAINT [FKA570358BEC21280C] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[People] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[Sponsors]'
GO
ALTER TABLE [dbo].[Sponsors] ADD
CONSTRAINT [FK4874EE958B56D115] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[Tracks]'
GO
ALTER TABLE [dbo].[Tracks] ADD
CONSTRAINT [FK605DAD408B56D115] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[TimeSlots]'
GO
ALTER TABLE [dbo].[TimeSlots] ADD
CONSTRAINT [FK6CE32DF8B56D115] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[Speakers]'
GO
ALTER TABLE [dbo].[Speakers] ADD
CONSTRAINT [FK73A699738B56D115] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id]),
CONSTRAINT [FK73A69973EC21280C] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[People] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[Sessions]'
GO
ALTER TABLE [dbo].[Sessions] ADD
CONSTRAINT [FK8D5E3E378B56D115] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id]),
CONSTRAINT [FK8D5E3E3760D319BD] FOREIGN KEY ([SpeakerId]) REFERENCES [dbo].[People] ([Id]),
CONSTRAINT [FK8D5E3E372FDEEB9A] FOREIGN KEY ([TrackId]) REFERENCES [dbo].[Tracks] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[ScheduledSessions]'
GO
ALTER TABLE [dbo].[ScheduledSessions] ADD
CONSTRAINT [FK719CACC166A32F9] FOREIGN KEY ([TimeSlotId]) REFERENCES [dbo].[TimeSlots] ([Id]),
CONSTRAINT [FK719CACC1CE1EBE48] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[Sessions] ([Id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
