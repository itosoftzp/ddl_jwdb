-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: jwdb_smm
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SHKActivities`
--
create database jwdb;
use jwdb;
DROP TABLE IF EXISTS `SHKActivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKActivities` (
  `Id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivitySetDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Process` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) DEFAULT NULL,
  `PDefName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessId` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ResourceId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `BlockActivityId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Performer` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsPerformerAsynchronous` smallint DEFAULT NULL,
  `Priority` int DEFAULT NULL,
  `Name` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Activated` bigint NOT NULL,
  `ActivatedTZO` bigint NOT NULL,
  `Accepted` bigint DEFAULT NULL,
  `AcceptedTZO` bigint DEFAULT NULL,
  `LastStateTime` bigint NOT NULL,
  `LastStateTimeTZO` bigint NOT NULL,
  `LimitTime` bigint NOT NULL,
  `LimitTimeTZO` bigint NOT NULL,
  `Description` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivities` (`Id`),
  KEY `SHKActivities_TheResource` (`TheResource`),
  KEY `SHKActivities_State` (`State`),
  KEY `I2_SHKActivities` (`Process`,`ActivitySetDefinitionId`,`ActivityDefinitionId`),
  KEY `I3_SHKActivities` (`Process`,`State`),
  KEY `ActivitySetDefinitionId_ProcessId_ResourceId` (`ActivitySetDefinitionId`,`ProcessId`,`ResourceId`),
  KEY `ProcessId_oid` (`ProcessId`,`oid`),
  CONSTRAINT `SHKActivities_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`),
  CONSTRAINT `SHKActivities_State` FOREIGN KEY (`State`) REFERENCES `SHKActivityStates` (`oid`),
  CONSTRAINT `SHKActivities_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKActivityData`
--

DROP TABLE IF EXISTS `SHKActivityData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKActivityData` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `IsResult` smallint NOT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityData` (`CNT`),
  UNIQUE KEY `I2_SHKActivityData` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityData_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKActivityDataBLOBs`
--

DROP TABLE IF EXISTS `SHKActivityDataBLOBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKActivityDataBLOBs` (
  `ActivityDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataBLOBs` (`ActivityDataWOB`,`OrdNo`),
  CONSTRAINT `SHKActivityDataBLOBs_ActivityDataWOB` FOREIGN KEY (`ActivityDataWOB`) REFERENCES `SHKActivityDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKActivityDataWOB`
--

DROP TABLE IF EXISTS `SHKActivityDataWOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKActivityDataWOB` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `IsResult` smallint NOT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKActivityDataWOB` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityDataWOB_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKActivityStateEventAudits`
--

DROP TABLE IF EXISTS `SHKActivityStateEventAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKActivityStateEventAudits` (
  `KeyValue` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKActivityStates`
--

DROP TABLE IF EXISTS `SHKActivityStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKActivityStates` (
  `KeyValue` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKAndJoinTable`
--

DROP TABLE IF EXISTS `SHKAndJoinTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKAndJoinTable` (
  `Process` decimal(19,0) NOT NULL,
  `BlockActivity` decimal(19,0) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAndJoinTable` (`CNT`),
  KEY `SHKAndJoinTable_BlockActivity` (`BlockActivity`),
  KEY `I2_SHKAndJoinTable` (`Process`,`BlockActivity`,`ActivityDefinitionId`),
  KEY `I3_SHKAndJoinTable` (`Activity`),
  CONSTRAINT `SHKAndJoinTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_BlockActivity` FOREIGN KEY (`BlockActivity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKAssignmentEventAudits`
--

DROP TABLE IF EXISTS `SHKAssignmentEventAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKAssignmentEventAudits` (
  `RecordedTime` bigint NOT NULL,
  `RecordedTimeTZO` bigint NOT NULL,
  `TheUsername` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityDefinitionType` int NOT NULL,
  `ProcessDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `OldResourceUsername` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `OldResourceName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `NewResourceUsername` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `NewResourceName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `IsAccepted` smallint NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentEventAudits` (`CNT`),
  KEY `SHKAssignmentEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKAssignmentEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKAssignmentsTable`
--

DROP TABLE IF EXISTS `SHKAssignmentsTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKAssignmentsTable` (
  `Activity` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityProcessDefName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ResourceId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `IsAccepted` smallint NOT NULL,
  `IsValid` smallint NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentsTable` (`CNT`),
  UNIQUE KEY `I2_SHKAssignmentsTable` (`Activity`,`TheResource`),
  KEY `I3_SHKAssignmentsTable` (`TheResource`,`IsValid`),
  KEY `I4_SHKAssignmentsTable` (`ActivityId`),
  KEY `I5_SHKAssignmentsTable` (`ResourceId`),
  KEY `FK_rnb6mhntls567xpifcfvygkuu` (`ActivityProcessId`),
  CONSTRAINT `FK_183e6adufsi558hl5p4dqkqsx` FOREIGN KEY (`ActivityId`) REFERENCES `SHKActivities` (`Id`),
  CONSTRAINT `FK_rnb6mhntls567xpifcfvygkuu` FOREIGN KEY (`ActivityProcessId`) REFERENCES `SHKProcesses` (`Id`),
  CONSTRAINT `SHKAssignmentsTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAssignmentsTable_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKCounters`
--

DROP TABLE IF EXISTS `SHKCounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKCounters` (
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `the_number` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCounters` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKCreateProcessEventAudits`
--

DROP TABLE IF EXISTS `SHKCreateProcessEventAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKCreateProcessEventAudits` (
  `RecordedTime` bigint NOT NULL,
  `RecordedTimeTZO` bigint NOT NULL,
  `TheUsername` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PActivityId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PProcessName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PProcessFactoryName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PProcessFactoryVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PActivityDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PActivityDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PProcessDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PProcessDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PPackageId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCreateProcessEventAudits` (`CNT`),
  KEY `SHKCreateProcessEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKCreateProcessEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKDataEventAudits`
--

DROP TABLE IF EXISTS `SHKDataEventAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKDataEventAudits` (
  `RecordedTime` bigint NOT NULL,
  `RecordedTimeTZO` bigint NOT NULL,
  `TheUsername` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityDefinitionType` int DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDataEventAudits` (`CNT`),
  KEY `SHKDataEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKDataEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKDeadlines`
--

DROP TABLE IF EXISTS `SHKDeadlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKDeadlines` (
  `Process` decimal(19,0) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `TimeLimit` bigint NOT NULL,
  `TimeLimitTZO` bigint NOT NULL,
  `ExceptionName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `IsSynchronous` smallint NOT NULL,
  `IsExecuted` smallint NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDeadlines` (`CNT`),
  KEY `I2_SHKDeadlines` (`Process`,`TimeLimit`),
  KEY `I3_SHKDeadlines` (`Activity`,`TimeLimit`),
  CONSTRAINT `SHKDeadlines_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKDeadlines_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKEventTypes`
--

DROP TABLE IF EXISTS `SHKEventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKEventTypes` (
  `KeyValue` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKEventTypes` (`KeyValue`),
  UNIQUE KEY `I2_SHKEventTypes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKGroupGroupTable`
--

DROP TABLE IF EXISTS `SHKGroupGroupTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKGroupGroupTable` (
  `sub_gid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupGroupTable` (`sub_gid`,`groupid`),
  KEY `I2_SHKGroupGroupTable` (`groupid`),
  CONSTRAINT `SHKGroupGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKGroupGroupTable_sub_gid` FOREIGN KEY (`sub_gid`) REFERENCES `SHKGroupTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKGroupTable`
--

DROP TABLE IF EXISTS `SHKGroupTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKGroupTable` (
  `groupid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupTable` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKGroupUser`
--

DROP TABLE IF EXISTS `SHKGroupUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKGroupUser` (
  `USERNAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKGroupUserPackLevelPart`
--

DROP TABLE IF EXISTS `SHKGroupUserPackLevelPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKGroupUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKGroupUserProcLevelPart`
--

DROP TABLE IF EXISTS `SHKGroupUserProcLevelPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKGroupUserProcLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserProcLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserProcLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserProcLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserProcLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKNewEventAuditData`
--

DROP TABLE IF EXISTS `SHKNewEventAuditData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKNewEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKNewEventAuditDataBLOBs`
--

DROP TABLE IF EXISTS `SHKNewEventAuditDataBLOBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKNewEventAuditDataBLOBs` (
  `NewEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataBLOBs` (`NewEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataBLOBs_NewEventAuditDataWOB` FOREIGN KEY (`NewEventAuditDataWOB`) REFERENCES `SHKNewEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKNewEventAuditDataWOB`
--

DROP TABLE IF EXISTS `SHKNewEventAuditDataWOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKNewEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKNextXPDLVersions`
--

DROP TABLE IF EXISTS `SHKNextXPDLVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKNextXPDLVersions` (
  `XPDLId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `NextVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNextXPDLVersions` (`XPDLId`,`NextVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKNormalUser`
--

DROP TABLE IF EXISTS `SHKNormalUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKNormalUser` (
  `USERNAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNormalUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKOldEventAuditData`
--

DROP TABLE IF EXISTS `SHKOldEventAuditData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKOldEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKOldEventAuditDataBLOBs`
--

DROP TABLE IF EXISTS `SHKOldEventAuditDataBLOBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKOldEventAuditDataBLOBs` (
  `OldEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataBLOBs` (`OldEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataBLOBs_OldEventAuditDataWOB` FOREIGN KEY (`OldEventAuditDataWOB`) REFERENCES `SHKOldEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKOldEventAuditDataWOB`
--

DROP TABLE IF EXISTS `SHKOldEventAuditDataWOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKOldEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKPackLevelParticipant`
--

DROP TABLE IF EXISTS `SHKPackLevelParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKPackLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelParticipant` (`PARTICIPANT_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelParticipant_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelParticipant_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKPackLevelXPDLApp`
--

DROP TABLE IF EXISTS `SHKPackLevelXPDLApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKPackLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLApp` (`APPLICATION_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelXPDLApp_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelXPDLApp_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppDetUsr`
--

DROP TABLE IF EXISTS `SHKPackLevelXPDLAppTAAppDetUsr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppDetail`
--

DROP TABLE IF EXISTS `SHKPackLevelXPDLAppTAAppDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppUser`
--

DROP TABLE IF EXISTS `SHKPackLevelXPDLAppTAAppUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKPackLevelXPDLAppToolAgntApp`
--

DROP TABLE IF EXISTS `SHKPackLevelXPDLAppToolAgntApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKPackLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcLevelParticipant`
--

DROP TABLE IF EXISTS `SHKProcLevelParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelParticipant` (`PARTICIPANT_ID`,`PROCESSOID`),
  KEY `SHKProcLevelParticipant_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelParticipant_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLParticipantProcess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcLevelXPDLApp`
--

DROP TABLE IF EXISTS `SHKProcLevelXPDLApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLApp` (`APPLICATION_ID`,`PROCESSOID`),
  KEY `SHKProcLevelXPDLApp_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelXPDLApp_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLApplicationProcess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppDetUsr`
--

DROP TABLE IF EXISTS `SHKProcLevelXPDLAppTAAppDetUsr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppDetail`
--

DROP TABLE IF EXISTS `SHKProcLevelXPDLAppTAAppDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppUser`
--

DROP TABLE IF EXISTS `SHKProcLevelXPDLAppTAAppUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcLevelXPDLAppToolAgntApp`
--

DROP TABLE IF EXISTS `SHKProcLevelXPDLAppToolAgntApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessData`
--

DROP TABLE IF EXISTS `SHKProcessData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessData` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessData` (`CNT`),
  UNIQUE KEY `I2_SHKProcessData` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessData_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessDataBLOBs`
--

DROP TABLE IF EXISTS `SHKProcessDataBLOBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessDataBLOBs` (
  `ProcessDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataBLOBs` (`ProcessDataWOB`,`OrdNo`),
  CONSTRAINT `SHKProcessDataBLOBs_ProcessDataWOB` FOREIGN KEY (`ProcessDataWOB`) REFERENCES `SHKProcessDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessDataWOB`
--

DROP TABLE IF EXISTS `SHKProcessDataWOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessDataWOB` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VariableType` int NOT NULL,
  `VariableValueXML` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `VariableValueVCHAR` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint DEFAULT NULL,
  `OrdNo` int NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKProcessDataWOB` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessDataWOB_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessDefinitions`
--

DROP TABLE IF EXISTS `SHKProcessDefinitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessDefinitions` (
  `Name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PackageId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionCreated` bigint NOT NULL,
  `ProcessDefinitionVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `State` int NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDefinitions` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessRequesters`
--

DROP TABLE IF EXISTS `SHKProcessRequesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessRequesters` (
  `Id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityRequester` decimal(19,0) DEFAULT NULL,
  `ResourceRequester` decimal(19,0) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessRequesters` (`Id`),
  KEY `I2_SHKProcessRequesters` (`ActivityRequester`),
  KEY `I3_SHKProcessRequesters` (`ResourceRequester`),
  CONSTRAINT `SHKProcessRequesters_ActivityRequester` FOREIGN KEY (`ActivityRequester`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKProcessRequesters_ResourceRequester` FOREIGN KEY (`ResourceRequester`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessStateEventAudits`
--

DROP TABLE IF EXISTS `SHKProcessStateEventAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessStateEventAudits` (
  `KeyValue` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcessStates`
--

DROP TABLE IF EXISTS `SHKProcessStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcessStates` (
  `KeyValue` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKProcesses`
--

DROP TABLE IF EXISTS `SHKProcesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKProcesses` (
  `SyncVersion` bigint NOT NULL,
  `Id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinition` decimal(19,0) NOT NULL,
  `PDefName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityRequesterId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityRequesterProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ResourceRequesterId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ExternalRequesterClassName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `Priority` int DEFAULT NULL,
  `Name` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Created` bigint NOT NULL,
  `CreatedTZO` bigint NOT NULL,
  `Started` bigint DEFAULT NULL,
  `StartedTZO` bigint DEFAULT NULL,
  `LastStateTime` bigint NOT NULL,
  `LastStateTimeTZO` bigint NOT NULL,
  `LimitTime` bigint NOT NULL,
  `LimitTimeTZO` bigint NOT NULL,
  `Description` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcesses` (`Id`),
  KEY `I2_SHKProcesses` (`ProcessDefinition`),
  KEY `I3_SHKProcesses` (`State`),
  KEY `I4_SHKProcesses` (`ActivityRequesterId`),
  KEY `I5_SHKProcesses` (`ResourceRequesterId`),
  CONSTRAINT `SHKProcesses_ProcessDefinition` FOREIGN KEY (`ProcessDefinition`) REFERENCES `SHKProcessDefinitions` (`oid`),
  CONSTRAINT `SHKProcesses_State` FOREIGN KEY (`State`) REFERENCES `SHKProcessStates` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKResourcesTable`
--

DROP TABLE IF EXISTS `SHKResourcesTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKResourcesTable` (
  `Username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKResourcesTable` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKStateEventAudits`
--

DROP TABLE IF EXISTS `SHKStateEventAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKStateEventAudits` (
  `RecordedTime` bigint NOT NULL,
  `RecordedTimeTZO` bigint NOT NULL,
  `TheUsername` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessName` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ActivityDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ActivityDefinitionType` int DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `OldProcessState` decimal(19,0) DEFAULT NULL,
  `NewProcessState` decimal(19,0) DEFAULT NULL,
  `OldActivityState` decimal(19,0) DEFAULT NULL,
  `NewActivityState` decimal(19,0) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKStateEventAudits` (`CNT`),
  KEY `SHKStateEventAudits_TheType` (`TheType`),
  KEY `SHKStateEventAudits_OldProcessState` (`OldProcessState`),
  KEY `SHKStateEventAudits_NewProcessState` (`NewProcessState`),
  KEY `SHKStateEventAudits_OldActivityState` (`OldActivityState`),
  KEY `SHKStateEventAudits_NewActivityState` (`NewActivityState`),
  CONSTRAINT `SHKStateEventAudits_NewActivityState` FOREIGN KEY (`NewActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_NewProcessState` FOREIGN KEY (`NewProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldActivityState` FOREIGN KEY (`OldActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldProcessState` FOREIGN KEY (`OldProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKToolAgentApp`
--

DROP TABLE IF EXISTS `SHKToolAgentApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKToolAgentApp` (
  `TOOL_AGENT_NAME` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `APP_NAME` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentApp` (`TOOL_AGENT_NAME`,`APP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKToolAgentAppDetail`
--

DROP TABLE IF EXISTS `SHKToolAgentAppDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKToolAgentAppDetail` (
  `APP_MODE` decimal(10,0) NOT NULL,
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetail` (`APP_MODE`,`TOOLAGENT_APPOID`),
  KEY `SHKToolAgentAppDetail_TOOLAGENT_APPOID` (`TOOLAGENT_APPOID`),
  CONSTRAINT `SHKToolAgentAppDetail_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKToolAgentAppDetailUser`
--

DROP TABLE IF EXISTS `SHKToolAgentAppDetailUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKToolAgentAppDetailUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetailUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppDetailUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppDetailUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKToolAgentAppDetailUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKToolAgentAppUser`
--

DROP TABLE IF EXISTS `SHKToolAgentAppUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKToolAgentAppUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKToolAgentAppUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKToolAgentUser`
--

DROP TABLE IF EXISTS `SHKToolAgentUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKToolAgentUser` (
  `USERNAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PWD` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKUserGroupTable`
--

DROP TABLE IF EXISTS `SHKUserGroupTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKUserGroupTable` (
  `userid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserGroupTable` (`userid`,`groupid`),
  KEY `SHKUserGroupTable_groupid` (`groupid`),
  CONSTRAINT `SHKUserGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKUserGroupTable_userid` FOREIGN KEY (`userid`) REFERENCES `SHKUserTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKUserPackLevelPart`
--

DROP TABLE IF EXISTS `SHKUserPackLevelPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKUserProcLevelParticipant`
--

DROP TABLE IF EXISTS `SHKUserProcLevelParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKUserProcLevelParticipant` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserProcLevelParticipant` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserProcLevelParticipant_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserProcLevelParticipant_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserProcLevelParticipant_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKUserTable`
--

DROP TABLE IF EXISTS `SHKUserTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKUserTable` (
  `userid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `passwd` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserTable` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLApplicationPackage`
--

DROP TABLE IF EXISTS `SHKXPDLApplicationPackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLApplicationPackage` (
  `PACKAGE_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLApplicationProcess`
--

DROP TABLE IF EXISTS `SHKXPDLApplicationProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLApplicationProcess` (
  `PROCESS_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLApplicationProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLApplicationProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLData`
--

DROP TABLE IF EXISTS `SHKXPDLData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLData` (
  `XPDLContent` longblob,
  `XPDLClassContent` longblob,
  `XPDL` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLData` (`CNT`),
  UNIQUE KEY `I2_SHKXPDLData` (`XPDL`),
  CONSTRAINT `SHKXPDLData_XPDL` FOREIGN KEY (`XPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLHistory`
--

DROP TABLE IF EXISTS `SHKXPDLHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLHistory` (
  `XPDLId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `XPDLVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `XPDLClassVersion` bigint NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `XPDLHistoryUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistory` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLHistoryData`
--

DROP TABLE IF EXISTS `SHKXPDLHistoryData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLHistoryData` (
  `XPDLContent` mediumblob NOT NULL,
  `XPDLClassContent` mediumblob NOT NULL,
  `XPDLHistory` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistoryData` (`CNT`),
  KEY `SHKXPDLHistoryData_XPDLHistory` (`XPDLHistory`),
  CONSTRAINT `SHKXPDLHistoryData_XPDLHistory` FOREIGN KEY (`XPDLHistory`) REFERENCES `SHKXPDLHistory` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLParticipantPackage`
--

DROP TABLE IF EXISTS `SHKXPDLParticipantPackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLParticipantPackage` (
  `PACKAGE_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLParticipantProcess`
--

DROP TABLE IF EXISTS `SHKXPDLParticipantProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLParticipantProcess` (
  `PROCESS_ID` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLParticipantProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLParticipantProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLReferences`
--

DROP TABLE IF EXISTS `SHKXPDLReferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLReferences` (
  `ReferredXPDLId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ReferringXPDL` decimal(19,0) NOT NULL,
  `ReferredXPDLNumber` int NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLReferences` (`ReferredXPDLId`,`ReferringXPDL`),
  KEY `SHKXPDLReferences_ReferringXPDL` (`ReferringXPDL`),
  CONSTRAINT `SHKXPDLReferences_ReferringXPDL` FOREIGN KEY (`ReferringXPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHKXPDLS`
--

DROP TABLE IF EXISTS `SHKXPDLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHKXPDLS` (
  `XPDLId` varchar(90) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `XPDLVersion` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `XPDLClassVersion` bigint NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLS` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_app`
--

DROP TABLE IF EXISTS `app_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_app` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `license` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `meta` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_builder`
--

DROP TABLE IF EXISTS `app_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_builder` (
  `appId` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime(6) DEFAULT NULL,
  `dateModified` datetime(6) DEFAULT NULL,
  `json` longtext COLLATE utf8mb3_unicode_ci,
  `description` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `idx_name` (`name`),
  KEY `idx_type` (`type`),
  CONSTRAINT `FK60c6xtsjhv0e4178vyb0dqe0s` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_datalist`
--

DROP TABLE IF EXISTS `app_datalist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_datalist` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `json` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK5E9247A6462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK5E9247A6462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_env_variable`
--

DROP TABLE IF EXISTS `app_env_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_env_variable` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `remarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK740A62EC462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK740A62EC462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd`
--

DROP TABLE IF EXISTS `app_fd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_appcenter`
--

DROP TABLE IF EXISTS `app_fd_appcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_appcenter` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_assignmentForm`
--

DROP TABLE IF EXISTS `app_fd_assignmentForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_assignmentForm` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_aboutPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_currentCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_recommendation` longtext COLLATE utf8mb3_unicode_ci,
  `c_nomorTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover4PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver4PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverPAAdmin` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_nomorTemp2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver5PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_buPKWTTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover2PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover5PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_emailStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCodeSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseChoice` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_buGroupSeq` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_10` longtext COLLATE utf8mb3_unicode_ci,
  `c_cLevelRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_11` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCC` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver4` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_reasonFARPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_wendContractDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnWorkingSchedule` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnik` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverHRBPCorp` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver9` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverHRStrategic` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver8` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver7` longtext COLLATE utf8mb3_unicode_ci,
  `c_movementType` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver6` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver5` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_18` longtext COLLATE utf8mb3_unicode_ci,
  `c_menuId` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_19` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_16` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_17` longtext COLLATE utf8mb3_unicode_ci,
  `c_smmaCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_14` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_15` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_12` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_13` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionExchangeStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_wage` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverComBen` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_17` longtext COLLATE utf8mb3_unicode_ci,
  `c_requester` longtext COLLATE utf8mb3_unicode_ci,
  `c_vacantPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnPersArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_18` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_15` longtext COLLATE utf8mb3_unicode_ci,
  `c_period` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_16` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_13` longtext COLLATE utf8mb3_unicode_ci,
  `c_wpat1` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_14` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_11` longtext COLLATE utf8mb3_unicode_ci,
  `c_yearSendSKToFiori` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_12` longtext COLLATE utf8mb3_unicode_ci,
  `c_wpat2` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_10` longtext COLLATE utf8mb3_unicode_ci,
  `c_wmovementCategory` longtext COLLATE utf8mb3_unicode_ci,
  `c_checkVacant` longtext COLLATE utf8mb3_unicode_ci,
  `c_sameHRBP` longtext COLLATE utf8mb3_unicode_ci,
  `c_mpp` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  `c_wreason` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnPOH` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover11` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover12` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_19` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionExchange` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver12` longtext COLLATE utf8mb3_unicode_ci,
  `c_inter3BUCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver10` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver11` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcPersArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDateContinue` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_monthSendSKToFiori` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_wjoinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_processId` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcOthers` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_emailConcat` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifURL` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_20` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_empNumber` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcPOH` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifOpening` longtext COLLATE utf8mb3_unicode_ci,
  `c_weffectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifCC` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_nLevelRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverHRSI` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifDear` longtext COLLATE utf8mb3_unicode_ci,
  `c_compCodeStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_costCenterMovement` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_urlAccess` longtext COLLATE utf8mb3_unicode_ci,
  `c_divStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcHOFName` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnHOFName` longtext COLLATE utf8mb3_unicode_ci,
  `c_adminPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifApproverId` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifTitle` longtext COLLATE utf8mb3_unicode_ci,
  `c_wmajor` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverHRBPCorp` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcWorkingSchedule` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnPayrollArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_wempStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_osStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_wpatYear2` longtext COLLATE utf8mb3_unicode_ci,
  `c_wpatYear1` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_20` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnHOFEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_wempName` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_iteration` longtext COLLATE utf8mb3_unicode_ci,
  `c_internalBUCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_blockingCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_wuniversity` longtext COLLATE utf8mb3_unicode_ci,
  `c_weducation` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnOthers` longtext COLLATE utf8mb3_unicode_ci,
  `c_messageResponseSendSKToFiori` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcHOFEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_9` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_8` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_3` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_2` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_1` longtext COLLATE utf8mb3_unicode_ci,
  `c_notifWANumber` longtext COLLATE utf8mb3_unicode_ci,
  `c_typeResponseSendSKToFiori` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_7` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_6` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_9` longtext COLLATE utf8mb3_unicode_ci,
  `c_wcSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_5` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_8` longtext COLLATE utf8mb3_unicode_ci,
  `c_empMassID_4` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_7` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_6` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_5` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverComBen` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_4` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_3` longtext COLLATE utf8mb3_unicode_ci,
  `c_wnSpvEmail` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_employee`
--

DROP TABLE IF EXISTS `app_fd_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_employee` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_div` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_email_personal` longtext COLLATE utf8mb3_unicode_ci,
  `c_phone` longtext COLLATE utf8mb3_unicode_ci,
  `c_sect` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_position_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_dept` longtext COLLATE utf8mb3_unicode_ci,
  `c_email_office` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_general_approval`
--

DROP TABLE IF EXISTS `app_fd_general_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_general_approval` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver4` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver9` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver8` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver7` longtext COLLATE utf8mb3_unicode_ci,
  `c_document10` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver6` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver5` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_document8` longtext COLLATE utf8mb3_unicode_ci,
  `c_document7` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver10` longtext COLLATE utf8mb3_unicode_ci,
  `c_document9` longtext COLLATE utf8mb3_unicode_ci,
  `c_document4` longtext COLLATE utf8mb3_unicode_ci,
  `c_document3` longtext COLLATE utf8mb3_unicode_ci,
  `c_document6` longtext COLLATE utf8mb3_unicode_ci,
  `c_document5` longtext COLLATE utf8mb3_unicode_ci,
  `c_document0` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_document2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_document1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_general_approvalsign`
--

DROP TABLE IF EXISTS `app_fd_general_approvalsign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_general_approvalsign` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_sign_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_id` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_internalMemo`
--

DROP TABLE IF EXISTS `app_fd_internalMemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_internalMemo` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_crm_account`
--

DROP TABLE IF EXISTS `app_fd_j_crm_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_crm_account` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_country` longtext COLLATE utf8mb3_unicode_ci,
  `c_address` longtext COLLATE utf8mb3_unicode_ci,
  `c_attachment` longtext COLLATE utf8mb3_unicode_ci,
  `c_accountName` longtext COLLATE utf8mb3_unicode_ci,
  `c_city` longtext COLLATE utf8mb3_unicode_ci,
  `c_office` longtext COLLATE utf8mb3_unicode_ci,
  `c_state` longtext COLLATE utf8mb3_unicode_ci,
  `c_fax` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_crm_contact`
--

DROP TABLE IF EXISTS `app_fd_j_crm_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_crm_contact` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_lastName` longtext COLLATE utf8mb3_unicode_ci,
  `c_country` longtext COLLATE utf8mb3_unicode_ci,
  `c_address` longtext COLLATE utf8mb3_unicode_ci,
  `c_city` longtext COLLATE utf8mb3_unicode_ci,
  `c_mobile` longtext COLLATE utf8mb3_unicode_ci,
  `c_photo` longtext COLLATE utf8mb3_unicode_ci,
  `c_office` longtext COLLATE utf8mb3_unicode_ci,
  `c_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_addressAvailable` longtext COLLATE utf8mb3_unicode_ci,
  `c_firstName` longtext COLLATE utf8mb3_unicode_ci,
  `c_attachment` longtext COLLATE utf8mb3_unicode_ci,
  `c_state` longtext COLLATE utf8mb3_unicode_ci,
  `c_account` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_crm_opportunity`
--

DROP TABLE IF EXISTS `app_fd_j_crm_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_crm_opportunity` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_amount` longtext COLLATE utf8mb3_unicode_ci,
  `c_stage` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_source` longtext COLLATE utf8mb3_unicode_ci,
  `c_newAccount` longtext COLLATE utf8mb3_unicode_ci,
  `c_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_account` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_crm_proposal`
--

DROP TABLE IF EXISTS `app_fd_j_crm_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_crm_proposal` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver` longtext COLLATE utf8mb3_unicode_ci,
  `c_refNo` longtext COLLATE utf8mb3_unicode_ci,
  `c_comments` longtext COLLATE utf8mb3_unicode_ci,
  `c_notes` longtext COLLATE utf8mb3_unicode_ci,
  `c_proposer` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_selectApprover` longtext COLLATE utf8mb3_unicode_ci,
  `c_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_attachment` longtext COLLATE utf8mb3_unicode_ci,
  `c_dateProposed` longtext COLLATE utf8mb3_unicode_ci,
  `c_dateApproved` longtext COLLATE utf8mb3_unicode_ci,
  `c_account` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_env_var`
--

DROP TABLE IF EXISTS `app_fd_j_env_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_env_var` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_lastName` longtext COLLATE utf8mb3_unicode_ci,
  `c_reportTo` longtext COLLATE utf8mb3_unicode_ci,
  `c_endDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobTitle` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_isHod` longtext COLLATE utf8mb3_unicode_ci,
  `c_employeeCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_organizationId` longtext COLLATE utf8mb3_unicode_ci,
  `c_password` longtext COLLATE utf8mb3_unicode_ci,
  `c_gradeDesc` longtext COLLATE utf8mb3_unicode_ci,
  `c_department` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  `c_gradeName` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupDesc` longtext COLLATE utf8mb3_unicode_ci,
  `c_active` longtext COLLATE utf8mb3_unicode_ci,
  `c_timeZone` longtext COLLATE utf8mb3_unicode_ci,
  `c_groups` longtext COLLATE utf8mb3_unicode_ci,
  `c_parentId` longtext COLLATE utf8mb3_unicode_ci,
  `c_firstName` longtext COLLATE utf8mb3_unicode_ci,
  `c_userRoles` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupName` longtext COLLATE utf8mb3_unicode_ci,
  `c_organization` longtext COLLATE utf8mb3_unicode_ci,
  `c_grade` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_hod` longtext COLLATE utf8mb3_unicode_ci,
  `c_startDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_username` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_expense_approval`
--

DROP TABLE IF EXISTS `app_fd_j_expense_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_expense_approval` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver` longtext COLLATE utf8mb3_unicode_ci,
  `c_ApprovedDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_ApprovedBy` longtext COLLATE utf8mb3_unicode_ci,
  `c_claim` longtext COLLATE utf8mb3_unicode_ci,
  `c_comment` longtext COLLATE utf8mb3_unicode_ci,
  `c_username` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_expense_cat`
--

DROP TABLE IF EXISTS `app_fd_j_expense_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_expense_cat` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_Category` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_expense_claim`
--

DROP TABLE IF EXISTS `app_fd_j_expense_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_expense_claim` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_spECD` longtext COLLATE utf8mb3_unicode_ci,
  `c_FinanceApprovedBy` longtext COLLATE utf8mb3_unicode_ci,
  `c_ApprovedDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_spED` longtext COLLATE utf8mb3_unicode_ci,
  `c_remark` longtext COLLATE utf8mb3_unicode_ci,
  `c_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_SelectApprover` longtext COLLATE utf8mb3_unicode_ci,
  `c_FinanceApprovedDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_finance_comments` longtext COLLATE utf8mb3_unicode_ci,
  `c_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_ref` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval_comments` longtext COLLATE utf8mb3_unicode_ci,
  `c_ApprovedBy` longtext COLLATE utf8mb3_unicode_ci,
  `c_CreatedDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_receipt` longtext COLLATE utf8mb3_unicode_ci,
  `c_claimant` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_username` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_expense_entry`
--

DROP TABLE IF EXISTS `app_fd_j_expense_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_expense_entry` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_date` longtext COLLATE utf8mb3_unicode_ci,
  `c_amount` longtext COLLATE utf8mb3_unicode_ci,
  `c_purpose` longtext COLLATE utf8mb3_unicode_ci,
  `c_claim` longtext COLLATE utf8mb3_unicode_ci,
  `c_category` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_isr_remark`
--

DROP TABLE IF EXISTS `app_fd_j_isr_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_isr_remark` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_request_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_remarks` longtext COLLATE utf8mb3_unicode_ci,
  `c_username` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_isr_request`
--

DROP TABLE IF EXISTS `app_fd_j_isr_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_isr_request` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_ref_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_requester` longtext COLLATE utf8mb3_unicode_ci,
  `c_subject` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_priority` longtext COLLATE utf8mb3_unicode_ci,
  `c_fgR` longtext COLLATE utf8mb3_unicode_ci,
  `c_createdDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_duedate` longtext COLLATE utf8mb3_unicode_ci,
  `c_verifier` longtext COLLATE utf8mb3_unicode_ci,
  `c_attention` longtext COLLATE utf8mb3_unicode_ci,
  `c_assignee` longtext COLLATE utf8mb3_unicode_ci,
  `c_dateVerified` longtext COLLATE utf8mb3_unicode_ci,
  `c_attachment2` longtext COLLATE utf8mb3_unicode_ci,
  `c_department` longtext COLLATE utf8mb3_unicode_ci,
  `c_attachment1` longtext COLLATE utf8mb3_unicode_ci,
  `c_requester_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_remarks` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_smtp`
--

DROP TABLE IF EXISTS `app_fd_j_smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_smtp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_SMTPFrom` longtext COLLATE utf8mb3_unicode_ci,
  `c_SMTPPort` longtext COLLATE utf8mb3_unicode_ci,
  `c_SMTPPassword` longtext COLLATE utf8mb3_unicode_ci,
  `c_SMTPHost` longtext COLLATE utf8mb3_unicode_ci,
  `c_SMTPSecurity` longtext COLLATE utf8mb3_unicode_ci,
  `c_SMTPUsername` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_temp`
--

DROP TABLE IF EXISTS `app_fd_j_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_temp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_lastName` longtext COLLATE utf8mb3_unicode_ci,
  `c_reportTo` longtext COLLATE utf8mb3_unicode_ci,
  `c_endDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobTitle` longtext COLLATE utf8mb3_unicode_ci,
  `c_active` longtext COLLATE utf8mb3_unicode_ci,
  `c_timeZone` longtext COLLATE utf8mb3_unicode_ci,
  `c_groups` longtext COLLATE utf8mb3_unicode_ci,
  `c_isHod` longtext COLLATE utf8mb3_unicode_ci,
  `c_employeeCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_firstName` longtext COLLATE utf8mb3_unicode_ci,
  `c_userRoles` longtext COLLATE utf8mb3_unicode_ci,
  `c_password` longtext COLLATE utf8mb3_unicode_ci,
  `c_organization` longtext COLLATE utf8mb3_unicode_ci,
  `c_grade` longtext COLLATE utf8mb3_unicode_ci,
  `c_department` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  `c_startDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_username` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_j_user_register`
--

DROP TABLE IF EXISTS `app_fd_j_user_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_j_user_register` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_firstName` longtext COLLATE utf8mb3_unicode_ci,
  `c_lastName` longtext COLLATE utf8mb3_unicode_ci,
  `c_userRoles` longtext COLLATE utf8mb3_unicode_ci,
  `c_password` longtext COLLATE utf8mb3_unicode_ci,
  `c_comments` longtext COLLATE utf8mb3_unicode_ci,
  `c_active` longtext COLLATE utf8mb3_unicode_ci,
  `c_verify_password` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_username` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_memo`
--

DROP TABLE IF EXISTS `app_fd_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_memo` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_usul` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval1StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval3StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval2StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_latarBelakang` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval3` longtext COLLATE utf8mb3_unicode_ci,
  `c_dari` longtext COLLATE utf8mb3_unicode_ci,
  `c_requester` longtext COLLATE utf8mb3_unicode_ci,
  `c_addApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_perihal` longtext COLLATE utf8mb3_unicode_ci,
  `c_nomor` longtext COLLATE utf8mb3_unicode_ci,
  `c_tujuan` longtext COLLATE utf8mb3_unicode_ci,
  `c_addApprover3Hidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_supportingDocument` longtext COLLATE utf8mb3_unicode_ci,
  `c_tanggal` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_paymentappr_currency`
--

DROP TABLE IF EXISTS `app_fd_paymentappr_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_paymentappr_currency` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_currency` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_paymentappr_detail`
--

DROP TABLE IF EXISTS `app_fd_paymentappr_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_paymentappr_detail` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_parrent_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_company` longtext COLLATE utf8mb3_unicode_ci,
  `c_location` longtext COLLATE utf8mb3_unicode_ci,
  `c_say` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_paymentappr_req`
--

DROP TABLE IF EXISTS `app_fd_paymentappr_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_paymentappr_req` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_signature_approval2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval1StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_kode_dua` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval2StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_signature_approval1` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviewer1` longtext COLLATE utf8mb3_unicode_ci,
  `c_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_request_date` longtext COLLATE utf8mb3_unicode_ci,
  `c_kode_satu` longtext COLLATE utf8mb3_unicode_ci,
  `c_payrol_detail` longtext COLLATE utf8mb3_unicode_ci,
  `c_report1` longtext COLLATE utf8mb3_unicode_ci,
  `c_reportOpt` longtext COLLATE utf8mb3_unicode_ci,
  `c_rev1` longtext COLLATE utf8mb3_unicode_ci,
  `c_app1` longtext COLLATE utf8mb3_unicode_ci,
  `c_reportOptionHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_kode_nol` longtext COLLATE utf8mb3_unicode_ci,
  `c_req1` longtext COLLATE utf8mb3_unicode_ci,
  `c_signature_requester1` longtext COLLATE utf8mb3_unicode_ci,
  `c_payee` longtext COLLATE utf8mb3_unicode_ci,
  `c_id_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_useMySign1` longtext COLLATE utf8mb3_unicode_ci,
  `c_applicant` longtext COLLATE utf8mb3_unicode_ci,
  `c_ext_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_supportingDocument` longtext COLLATE utf8mb3_unicode_ci,
  `c_description` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval3StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval3` longtext COLLATE utf8mb3_unicode_ci,
  `c_assignmentUrl` longtext COLLATE utf8mb3_unicode_ci,
  `c_wa_app1` longtext COLLATE utf8mb3_unicode_ci,
  `c_wa_app2` longtext COLLATE utf8mb3_unicode_ci,
  `c_wa_app3` longtext COLLATE utf8mb3_unicode_ci,
  `c_nextActivityId` longtext COLLATE utf8mb3_unicode_ci,
  `c_field11` longtext COLLATE utf8mb3_unicode_ci,
  `c_runningWAExp` longtext COLLATE utf8mb3_unicode_ci,
  `c_runningWAToken` longtext COLLATE utf8mb3_unicode_ci,
  `c_currency` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_paymentappr_sign`
--

DROP TABLE IF EXISTS `app_fd_paymentappr_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_paymentappr_sign` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_sign_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_id` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_paymentappr_vars`
--

DROP TABLE IF EXISTS `app_fd_paymentappr_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_paymentappr_vars` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_varName` longtext COLLATE utf8mb3_unicode_ci,
  `c_varValue` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_payroll_req`
--

DROP TABLE IF EXISTS `app_fd_payroll_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_payroll_req` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_pr_handa`
--

DROP TABLE IF EXISTS `app_fd_pr_handa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_pr_handa` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_filter_dept` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalAmount` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval` longtext COLLATE utf8mb3_unicode_ci,
  `c_request_date` longtext COLLATE utf8mb3_unicode_ci,
  `c_rel_dept` longtext COLLATE utf8mb3_unicode_ci,
  `c_requestor` longtext COLLATE utf8mb3_unicode_ci,
  `c_remarks` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_pr_handa_item`
--

DROP TABLE IF EXISTS `app_fd_pr_handa_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_pr_handa_item` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_unitPrice` longtext COLLATE utf8mb3_unicode_ci,
  `c_amount` longtext COLLATE utf8mb3_unicode_ci,
  `c_quantity` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_request_id` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs`
--

DROP TABLE IF EXISTS `app_fd_ptfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_reason` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver4` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_increment1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_increment2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver1` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_workingSchedule` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver9` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nOrgUnit` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver8` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver7` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver6` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_empStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver5` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approveCommentApprover3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_p25_y1` longtext COLLATE utf8mb3_unicode_ci,
  `c_p25_y2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverComBen` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_idPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_structure_min1` longtext COLLATE utf8mb3_unicode_ci,
  `c_ptf_doc` longtext COLLATE utf8mb3_unicode_ci,
  `c_structure_min2` longtext COLLATE utf8mb3_unicode_ci,
  `c_field11` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover11` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover12` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkLocation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_p25_x1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDivision` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_p25_x2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_meal2` longtext COLLATE utf8mb3_unicode_ci,
  `c_cWorkLocation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_alw_meal1` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalVarIncome2` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalVarIncome1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cr_opsi2` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_ik1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cr_opsi1` longtext COLLATE utf8mb3_unicode_ci,
  `c_p50_x1` longtext COLLATE utf8mb3_unicode_ci,
  `c_p50_x2` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPosition` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_empName` longtext COLLATE utf8mb3_unicode_ci,
  `c_hiddenReasonForAction` longtext COLLATE utf8mb3_unicode_ci,
  `c_endContractDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_annualIncomeNet` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPosition` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_rejectCommentApprover12` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover11` longtext COLLATE utf8mb3_unicode_ci,
  `c_patYear2` longtext COLLATE utf8mb3_unicode_ci,
  `c_patYear1` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_bonus1` longtext COLLATE utf8mb3_unicode_ci,
  `c_bonus2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_car1` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_car2` longtext COLLATE utf8mb3_unicode_ci,
  `c_thr` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_car` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_qsi` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover11` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover12` longtext COLLATE utf8mb3_unicode_ci,
  `c_salaryType` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_p50_y1` longtext COLLATE utf8mb3_unicode_ci,
  `c_spc_incentive` longtext COLLATE utf8mb3_unicode_ci,
  `c_p50_y2` longtext COLLATE utf8mb3_unicode_ci,
  `c_qsi2` longtext COLLATE utf8mb3_unicode_ci,
  `c_qsi1` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApproverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_yearly_basic` longtext COLLATE utf8mb3_unicode_ci,
  `c_annualIncomeNet2` longtext COLLATE utf8mb3_unicode_ci,
  `c_annualIncomeNet1` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_representasi1` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApproverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_dept3` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_dept1` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_dept2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_telecom` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_representasi2` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalVarIncome` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_transportasi2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_transportasi1` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_specials2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_specials1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3a` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_jht` longtext COLLATE utf8mb3_unicode_ci,
  `c_request_date` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_special1` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_total3` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_total2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_special2` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_total1` longtext COLLATE utf8mb3_unicode_ci,
  `c_age` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOrgStructure` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_basic2` longtext COLLATE utf8mb3_unicode_ci,
  `c_education` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_basic1` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_fuel2` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_fuel1` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_effective_date` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_period` longtext COLLATE utf8mb3_unicode_ci,
  `c_join_date` longtext COLLATE utf8mb3_unicode_ci,
  `c_mpp` longtext COLLATE utf8mb3_unicode_ci,
  `c_currentUser` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOthers` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_specials` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver12` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver10` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_thr2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver11` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_thr1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cr_market_opsi2` longtext COLLATE utf8mb3_unicode_ci,
  `c_cr_market_opsi1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApproverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_p75_y2` longtext COLLATE utf8mb3_unicode_ci,
  `c_p75_y1` longtext COLLATE utf8mb3_unicode_ci,
  `c_actingFor` longtext COLLATE utf8mb3_unicode_ci,
  `c_nCompCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_spc_incentive2` longtext COLLATE utf8mb3_unicode_ci,
  `c_spc_incentive1` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_representasi` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_special` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_fixIncomeIK` longtext COLLATE utf8mb3_unicode_ci,
  `c_structure_mid2` longtext COLLATE utf8mb3_unicode_ci,
  `c_p75_x2` longtext COLLATE utf8mb3_unicode_ci,
  `c_p75_x1` longtext COLLATE utf8mb3_unicode_ci,
  `c_structure_mid1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover12` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_transportasi` longtext COLLATE utf8mb3_unicode_ci,
  `c_bonus` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_fuel` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_meal` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover10` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover11` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_telecom2` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_telecom1` longtext COLLATE utf8mb3_unicode_ci,
  `c_fixIncomeIK1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cCompCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_fixIncomeIK2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApproverComben` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApproverComben` longtext COLLATE utf8mb3_unicode_ci,
  `c_nLevel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cLevel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_reasonForAction` longtext COLLATE utf8mb3_unicode_ci,
  `c_showHideWL` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_ik2` longtext COLLATE utf8mb3_unicode_ci,
  `c_nGroupBU` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_int_ik3` longtext COLLATE utf8mb3_unicode_ci,
  `c_movementCategory` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverOD` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_basic` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cDepartment` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nDivision` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nDepartment` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_int_name3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_jht1` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_name2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_name1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_jht2` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOthers` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_structure_max2` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOrgUnit` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_pat1` longtext COLLATE utf8mb3_unicode_ci,
  `c_pat2` longtext COLLATE utf8mb3_unicode_ci,
  `c_structure_max1` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_base1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cGroupBU` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_int_base2` longtext COLLATE utf8mb3_unicode_ci,
  `c_int_base3` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApproverComben` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgStructure` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approveCommentApprover8` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover7` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover9` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverComBen` longtext COLLATE utf8mb3_unicode_ci,
  `c_cIDPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_yearly_basic2` longtext COLLATE utf8mb3_unicode_ci,
  `c_yearly_basic1` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nPositionDesc` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCC` longtext COLLATE utf8mb3_unicode_ci,
  `c_major` longtext COLLATE utf8mb3_unicode_ci,
  `c_sameGBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_university` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkingSchedule` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cWorkingSchedule` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_check_group` longtext COLLATE utf8mb3_unicode_ci,
  `c_spvEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_wl_diff` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_meal_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_jht1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_basic2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_special1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_car1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_meal1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_bonustimes` longtext COLLATE utf8mb3_unicode_ci,
  `c_jht_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_spc_incentive1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowance1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_qsitimes2` longtext COLLATE utf8mb3_unicode_ci,
  `c_qsitimes1` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_transportasi1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_transportasi_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowance_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowance_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_bonustimes2` longtext COLLATE utf8mb3_unicode_ci,
  `c_bonustimes1` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowance1_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_qsitimes` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_car_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_basic_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_specials2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_representasi_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_telecom1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_fuel2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_fuel_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_jht2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_telecom_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_special2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_basic1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_car2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_spc_incentive2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowance2_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_spc_incentive_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_representasi1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_transportasi2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApproverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowance2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_meal2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_fixIncomeIK1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_specials_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentApproverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_special_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApproverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverComBenHead` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_alw_telecom2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_fuel1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_fixIncomeIK2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_representasi2_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_fixIncomeIK_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_alw_specials1_yearly` longtext COLLATE utf8mb3_unicode_ci,
  `c_spvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_field53` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_cc_diff` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPersArea` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_combenOption` longtext COLLATE utf8mb3_unicode_ci,
  `c_allowComben` longtext COLLATE utf8mb3_unicode_ci,
  `c_field205` longtext COLLATE utf8mb3_unicode_ci,
  `c_communication2` longtext COLLATE utf8mb3_unicode_ci,
  `c_communication1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project1` longtext COLLATE utf8mb3_unicode_ci,
  `c_coordination1` longtext COLLATE utf8mb3_unicode_ci,
  `c_coordination2` longtext COLLATE utf8mb3_unicode_ci,
  `c_condition1` longtext COLLATE utf8mb3_unicode_ci,
  `c_condition2` longtext COLLATE utf8mb3_unicode_ci,
  `c_requirement1` longtext COLLATE utf8mb3_unicode_ci,
  `c_requirement2` longtext COLLATE utf8mb3_unicode_ci,
  `c_training1` longtext COLLATE utf8mb3_unicode_ci,
  `c_training2` longtext COLLATE utf8mb3_unicode_ci,
  `c_authority1` longtext COLLATE utf8mb3_unicode_ci,
  `c_authority2` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobdesc2` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobdesc1` longtext COLLATE utf8mb3_unicode_ci,
  `c_tools1` longtext COLLATE utf8mb3_unicode_ci,
  `c_tools2` longtext COLLATE utf8mb3_unicode_ci,
  `c_inputUrl` longtext COLLATE utf8mb3_unicode_ci,
  `c_nextActivityId` longtext COLLATE utf8mb3_unicode_ci,
  `c_varUrl` longtext COLLATE utf8mb3_unicode_ci,
  `c_varAuthVacant` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_vacantPosition` varchar(2) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_runningWAToken` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_runningWAExp` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nPayrollArea` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_compCodeStatus` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cHOFEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_nHOFEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_cHOFName` longtext COLLATE utf8mb3_unicode_ci,
  `c_nHOFName` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPersArea` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_gbuCC2` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCCG` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCCG2` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_sect` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_dept` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_oth` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_ws` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_wl` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_pa` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_div` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_hof` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_pos` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_cc` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_lvl` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_spv` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_os` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_ou` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_gbu` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_topic1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_topic2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_topic3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_dept1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_dept2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_dept3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_tqc1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_tqc2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_tqc3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_roles1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_roles2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_roles3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_year1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_year2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_year3` longtext COLLATE utf8mb3_unicode_ci,
  `c_nganu` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCCIR` longtext COLLATE utf8mb3_unicode_ci,
  `c_requester` longtext COLLATE utf8mb3_unicode_ci,
  `c_remember` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn` longtext COLLATE utf8mb3_unicode_ci,
  `c_buGroupSeq` longtext COLLATE utf8mb3_unicode_ci,
  `c_samePosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_duration` longtext COLLATE utf8mb3_unicode_ci,
  `c_adminPA` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_effectiveDateSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDateSK2` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing_en` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameSK2` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_locationSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_commentAdminPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_different_hrbp` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_empNumber` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_iteration` varchar(5) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_movementFile` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_movementTitle` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_movementType` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_3` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_4` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_5` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_6` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_7` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_8` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_9` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_10` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_11` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_12` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_13` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_14` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_15` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_16` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_17` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_18` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_19` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik_20` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_ptfBulk` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_varAuth` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_urlAccess` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nSpvNik` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_check_cross` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionExchange` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionExchangeStatus` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_apprhistory` mediumtext COLLATE utf8mb3_unicode_ci,
  `c_costCenterMovement` char(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cPOH` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nPOH` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_commentsFromCombenHead` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_joinDateContinue` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitMedical` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitQSI` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitLeave` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitBonus` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitPesangon` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitMedicalComment` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitLeaveComment` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitQSIComment` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitBonusComment` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_benefitPesangonComment` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_transferToOtherGroup` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_osStatus` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_divStatus` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_check_smma` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_smma_externalBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_externalBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_internalBUCCSame` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_inter3BU` longtext COLLATE utf8mb3_unicode_ci,
  `c_check_interBUSameAsExternalBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccTMHRStratCHRO` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprove4` longtext COLLATE utf8mb3_unicode_ci,
  `c_blockingCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_addInfo` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverHRSI` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_statusApproverHRSI` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApproverHRSI` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverHRBPCorp` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_statusApproverHRBPCorp` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApproverHRBPCorp` longtext COLLATE utf8mb3_unicode_ci,
  `c_linkApproval` longtext COLLATE utf8mb3_unicode_ci,
  `c_processIdNotif` longtext COLLATE utf8mb3_unicode_ci,
  `c_submitAutoLogin` longtext COLLATE utf8mb3_unicode_ci,
  `c_ijpCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_IJPCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `c_nik` (`c_nik`),
  KEY `c_approver3` (`c_approver3`),
  KEY `c_approver4` (`c_approver4`),
  KEY `c_approver2` (`c_approver2`),
  KEY `c_workingSchedule` (`c_workingSchedule`),
  KEY `c_approver9` (`c_approver9`),
  KEY `c_approver3a` (`c_approver3a`),
  KEY `c_approver5` (`c_approver5`),
  KEY `c_approver6` (`c_approver6`),
  KEY `c_approver7` (`c_approver7`),
  KEY `c_approver8` (`c_approver8`),
  KEY `c_approver10` (`c_approver10`),
  KEY `c_approver11` (`c_approver11`),
  KEY `c_approver12` (`c_approver12`),
  KEY `c_approverOD` (`c_approverOD`),
  KEY `c_approverComBen` (`c_approverComBen`),
  KEY `c_approverComBenHead` (`c_approverComBenHead`),
  KEY `c_approverHRBPCorp` (`c_approverHRBPCorp`),
  KEY `c_approverHRSI` (`c_approverHRSI`),
  KEY `c_adminPA` (`c_adminPA`),
  KEY `c_cGroupBU` (`c_cGroupBU`),
  KEY `c_cCompCode` (`c_cCompCode`),
  KEY `c_cPersArea` (`c_cPersArea`),
  KEY `c_cOrgStructure` (`c_cOrgStructure`),
  KEY `c_cOrgUnit` (`c_cOrgUnit`),
  KEY `c_cDivision` (`c_cDivision`),
  KEY `c_cDepartment` (`c_cDepartment`),
  KEY `c_cSection` (`c_cSection`),
  KEY `c_cPosition` (`c_cPosition`),
  KEY `c_cWorkLocation` (`c_cWorkLocation`),
  KEY `c_cWorkingSchedule` (`c_cWorkingSchedule`),
  KEY `c_cLevel` (`c_cLevel`),
  KEY `c_nSpvNik` (`c_nSpvNik`),
  KEY `c_nGroupBU` (`c_nGroupBU`),
  KEY `c_nCompCode` (`c_nCompCode`),
  KEY `c_nPersArea` (`c_nPersArea`),
  KEY `c_nOrgStructure` (`c_nOrgStructure`),
  KEY `c_nOrgUnit` (`c_nOrgUnit`),
  KEY `c_nDivision` (`c_nDivision`),
  KEY `c_nDepartment` (`c_nDepartment`),
  KEY `c_nSection` (`c_nSection`),
  KEY `c_nPosition` (`c_nPosition`),
  KEY `c_nWorkLocation` (`c_nWorkLocation`),
  KEY `c_nWorkingSchedule` (`c_nWorkingSchedule`),
  KEY `c_nLevel` (`c_nLevel`),
  KEY `c_approver` (`c_approver1`) USING BTREE,
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_appr_history`
--

DROP TABLE IF EXISTS `app_fd_ptfs_appr_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_appr_history` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_field11` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_approver`
--

DROP TABLE IF EXISTS `app_fd_ptfs_approver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_approver` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_user_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_type` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_group` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_real_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_bulk`
--

DROP TABLE IF EXISTS `app_fd_ptfs_bulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_bulk` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cPersArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_reason` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_education` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCC` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSpvEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_nHOFEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_major` longtext COLLATE utf8mb3_unicode_ci,
  `c_empStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_cCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_cHOFName` longtext COLLATE utf8mb3_unicode_ci,
  `c_nLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPersArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPositionDesc` longtext COLLATE utf8mb3_unicode_ci,
  `c_mpp` longtext COLLATE utf8mb3_unicode_ci,
  `c_reasonForAction` longtext COLLATE utf8mb3_unicode_ci,
  `c_cLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_nGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_parent_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDateSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_movementCategory` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkingSchedule` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOthers` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_nDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_nDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_cWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_university` longtext COLLATE utf8mb3_unicode_ci,
  `c_nHOFName` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOthers` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_remember` longtext COLLATE utf8mb3_unicode_ci,
  `c_empName` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_pat1` longtext COLLATE utf8mb3_unicode_ci,
  `c_pat2` longtext COLLATE utf8mb3_unicode_ci,
  `c_nCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_endContractDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn` longtext COLLATE utf8mb3_unicode_ci,
  `c_cGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_cWorkingSchedule` longtext COLLATE utf8mb3_unicode_ci,
  `c_cHOFEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSpvEmail` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_gbuCCIR` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPositionDesc` longtext COLLATE utf8mb3_unicode_ci,
  `c_patYear2` longtext COLLATE utf8mb3_unicode_ci,
  `c_patYear1` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_age` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPayrollArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPOH` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPOH` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_cc`
--

DROP TABLE IF EXISTS `app_fd_ptfs_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_cc` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `dateModified` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_compCodeName` longtext COLLATE utf8mb3_unicode_ci,
  `c_compCodeSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_combenadmin`
--

DROP TABLE IF EXISTS `app_fd_ptfs_combenadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_combenadmin` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approverComBen` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverComBenHead` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_dept`
--

DROP TABLE IF EXISTS `app_fd_ptfs_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_dept` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_departmentName` longtext COLLATE utf8mb3_unicode_ci,
  `c_departmentSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_div`
--

DROP TABLE IF EXISTS `app_fd_ptfs_div`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_div` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_divisionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_divisionSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_divdepsect`
--

DROP TABLE IF EXISTS `app_fd_ptfs_divdepsect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_divdepsect` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_departmentName` longtext COLLATE utf8mb3_unicode_ci,
  `c_sectionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_departmentId` longtext COLLATE utf8mb3_unicode_ci,
  `c_divisionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_divisionId` longtext COLLATE utf8mb3_unicode_ci,
  `c_sectionId` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_gbu`
--

DROP TABLE IF EXISTS `app_fd_ptfs_gbu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_gbu` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_groupBUName` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupBUSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_gbu_within`
--

DROP TABLE IF EXISTS `app_fd_ptfs_gbu_within`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_gbu_within` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_groupBUMappingName` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupBUMapping` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupBUID` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_gbucc`
--

DROP TABLE IF EXISTS `app_fd_ptfs_gbucc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_gbucc` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cc` longtext COLLATE utf8mb3_unicode_ci,
  `c_working_location` longtext COLLATE utf8mb3_unicode_ci,
  `c_group_bu` longtext COLLATE utf8mb3_unicode_ci,
  `c_group_bu_desc` longtext COLLATE utf8mb3_unicode_ci,
  `c_org_structure` longtext COLLATE utf8mb3_unicode_ci,
  `c_org_structure_ofnon` longtext COLLATE utf8mb3_unicode_ci,
  `c_working_location_ofnon` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_hidden`
--

DROP TABLE IF EXISTS `app_fd_ptfs_hidden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_hidden` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cPersArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_nDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_nDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_cWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_cOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_cCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_nCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_cGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_nLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPersArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_cWorkingSchedule` longtext COLLATE utf8mb3_unicode_ci,
  `c_mpp` longtext COLLATE utf8mb3_unicode_ci,
  `c_cLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_reasonForAction` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit2` longtext COLLATE utf8mb3_unicode_ci,
  `c_nGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_movementCategory` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkingSchedule` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPOH` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPOH` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_history`
--

DROP TABLE IF EXISTS `app_fd_ptfs_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_history` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver12` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver10` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver11` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionCodeHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver4` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1` longtext COLLATE utf8mb3_unicode_ci,
  `c_field11` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver9` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver8` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3a` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver7` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver6` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver5` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverOD` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverComben` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverCombenHead` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_hrbp_user`
--

DROP TABLE IF EXISTS `app_fd_ptfs_hrbp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_hrbp_user` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_hrbp` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_jobeval`
--

DROP TABLE IF EXISTS `app_fd_ptfs_jobeval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_jobeval` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_project2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project1` longtext COLLATE utf8mb3_unicode_ci,
  `c_authority1` longtext COLLATE utf8mb3_unicode_ci,
  `c_authority2` longtext COLLATE utf8mb3_unicode_ci,
  `c_training1` longtext COLLATE utf8mb3_unicode_ci,
  `c_training2` longtext COLLATE utf8mb3_unicode_ci,
  `c_condition1` longtext COLLATE utf8mb3_unicode_ci,
  `c_communication2` longtext COLLATE utf8mb3_unicode_ci,
  `c_condition2` longtext COLLATE utf8mb3_unicode_ci,
  `c_communication1` longtext COLLATE utf8mb3_unicode_ci,
  `c_tools1` longtext COLLATE utf8mb3_unicode_ci,
  `c_tools2` longtext COLLATE utf8mb3_unicode_ci,
  `c_coordination1` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobdesc2` longtext COLLATE utf8mb3_unicode_ci,
  `c_coordination2` longtext COLLATE utf8mb3_unicode_ci,
  `c_requirement1` longtext COLLATE utf8mb3_unicode_ci,
  `c_requirement2` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobdesc1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_topic2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_topic1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_topic3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_tqc3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_roles2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_roles1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_roles3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_year3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_tqc2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_tqc1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_dept2` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_dept3` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_year1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_impact_dept1` longtext COLLATE utf8mb3_unicode_ci,
  `c_project_year2` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_level`
--

DROP TABLE IF EXISTS `app_fd_ptfs_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_level` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_levelName` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_levelId` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_os`
--

DROP TABLE IF EXISTS `app_fd_ptfs_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_os` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_OrgStructureName` longtext COLLATE utf8mb3_unicode_ci,
  `c_OrgStructureSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_ou`
--

DROP TABLE IF EXISTS `app_fd_ptfs_ou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_ou` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_orgUnitName` longtext COLLATE utf8mb3_unicode_ci,
  `c_orgUnitSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_ou_20210713`
--

DROP TABLE IF EXISTS `app_fd_ptfs_ou_20210713`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_ou_20210713` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_orgUnitName` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_orgUnitId` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_payrollarea`
--

DROP TABLE IF EXISTS `app_fd_ptfs_payrollarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_payrollarea` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_payrollCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_level` longtext COLLATE utf8mb3_unicode_ci,
  `c_persArea` longtext COLLATE utf8mb3_unicode_ci,
  `c_payrollText` longtext COLLATE utf8mb3_unicode_ci,
  `c_compCode` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_persarea`
--

DROP TABLE IF EXISTS `app_fd_ptfs_persarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_persarea` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_comp_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_subarea_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_persarea_text` longtext COLLATE utf8mb3_unicode_ci,
  `c_persarea_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_subarea_text` longtext COLLATE utf8mb3_unicode_ci,
  `c_persarea_search` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_persarea_20210726`
--

DROP TABLE IF EXISTS `app_fd_ptfs_persarea_20210726`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_persarea_20210726` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_comp_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_subarea_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_persarea_text` longtext COLLATE utf8mb3_unicode_ci,
  `c_persarea_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_subarea_text` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_poh`
--

DROP TABLE IF EXISTS `app_fd_ptfs_poh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_poh` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_poh_desc` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_position`
--

DROP TABLE IF EXISTS `app_fd_ptfs_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_position` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_position_20220317`
--

DROP TABLE IF EXISTS `app_fd_ptfs_position_20220317`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_position_20220317` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_position_20230810`
--

DROP TABLE IF EXISTS `app_fd_ptfs_position_20230810`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_position_20230810` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_position_temp`
--

DROP TABLE IF EXISTS `app_fd_ptfs_position_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_position_temp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_ou_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_rfa`
--

DROP TABLE IF EXISTS `app_fd_ptfs_rfa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_rfa` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_rfa_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_rfa_backup`
--

DROP TABLE IF EXISTS `app_fd_ptfs_rfa_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_rfa_backup` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_rfa_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_sect`
--

DROP TABLE IF EXISTS `app_fd_ptfs_sect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_sect` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_sectionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_sectionSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_sign`
--

DROP TABLE IF EXISTS `app_fd_ptfs_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_sign` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_sign_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_id` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_tmp`
--

DROP TABLE IF EXISTS `app_fd_ptfs_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_tmp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_varAuth` longtext COLLATE utf8mb3_unicode_ci,
  `c_datatype` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_tmp_q`
--

DROP TABLE IF EXISTS `app_fd_ptfs_tmp_q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_tmp_q` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_query2` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_vars`
--

DROP TABLE IF EXISTS `app_fd_ptfs_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_vars` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_varName` longtext COLLATE utf8mb3_unicode_ci,
  `c_varValue` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_wl`
--

DROP TABLE IF EXISTS `app_fd_ptfs_wl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_wl` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_workLocationName` longtext COLLATE utf8mb3_unicode_ci,
  `c_workLocationSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_workLocationId` longtext COLLATE utf8mb3_unicode_ci,
  `c_persa_id` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_wschedule`
--

DROP TABLE IF EXISTS `app_fd_ptfs_wschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_wschedule` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_workingScheduleId` longtext COLLATE utf8mb3_unicode_ci,
  `c_workingScheduleName` longtext COLLATE utf8mb3_unicode_ci,
  `c_workLocationId` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_workingScheduleSearch` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `c_workingScheduleId_c_workLocationId` (`c_workingScheduleId`(10),`c_workLocationId`(10)),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_ptfs_wschedule_backup`
--

DROP TABLE IF EXISTS `app_fd_ptfs_wschedule_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_ptfs_wschedule_backup` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_workingScheduleName` longtext COLLATE utf8mb3_unicode_ci,
  `c_workingScheduleSearch` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_workingScheduleId` longtext COLLATE utf8mb3_unicode_ci,
  `c_workLocationId` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_pur_mst_project_1`
--

DROP TABLE IF EXISTS `app_fd_pur_mst_project_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_pur_mst_project_1` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_crnam` longtext COLLATE utf8mb3_unicode_ci,
  `c_rlnam` longtext COLLATE utf8mb3_unicode_ci,
  `c_vbukr` longtext COLLATE utf8mb3_unicode_ci,
  `c_psphi` longtext COLLATE utf8mb3_unicode_ci,
  `c_erdat` longtext COLLATE utf8mb3_unicode_ci,
  `c_post1` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_sk_hidden`
--

DROP TABLE IF EXISTS `app_fd_sk_hidden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_sk_hidden` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_currentCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_buPKWTTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_linkApproval` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_sk_pkwt`
--

DROP TABLE IF EXISTS `app_fd_sk_pkwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_sk_pkwt` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approveCommentReviewer` text COLLATE utf8mb3_unicode_ci,
  `c_aboutPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_probAnticipation` tinyint DEFAULT NULL,
  `c_rejectCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt` longtext COLLATE utf8mb3_unicode_ci,
  `c_conImpScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_aspKuanScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_recommendation` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentSPP1` longtext COLLATE utf8mb3_unicode_ci,
  `c_nextActivityId` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_avgScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentReviewer` tinyint DEFAULT NULL,
  `c_aboutHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_posAttitudeScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_integrityScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_posAttitudeScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentReviewer` tinyint DEFAULT NULL,
  `c_descAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_loyalScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver5PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_innovScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover4PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_averageScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_consFeedback` longtext COLLATE utf8mb3_unicode_ci,
  `c_loyalScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentSRR1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver4PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAvgScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_aspekKuantitatif` longtext COLLATE utf8mb3_unicode_ci,
  `c_knowledgeApplication` tinyint DEFAULT NULL,
  `c_jumlahAspekKuantitatif` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualSRR1` longtext COLLATE utf8mb3_unicode_ci,
  `c_field31` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_penilai` tinyint DEFAULT NULL,
  `c_superCommentAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_totScoreKinerja` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviewerPKWT` tinyint DEFAULT NULL,
  `c_scorePerformancePresentation` longtext COLLATE utf8mb3_unicode_ci,
  `c_penilai2` tinyint DEFAULT NULL,
  `c_penilai3` tinyint DEFAULT NULL,
  `c_penilai4` tinyint DEFAULT NULL,
  `c_originCreativeInnov` tinyint DEFAULT NULL,
  `c_materialConformity` tinyint DEFAULT NULL,
  `c_others` tinyint DEFAULT NULL,
  `c_approval4StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_level` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualSPP1` longtext COLLATE utf8mb3_unicode_ci,
  `c_integrityScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_descSPP1` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover2PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt2` longtext COLLATE utf8mb3_unicode_ci,
  `c_tglPresentasi` tinyint DEFAULT NULL,
  `c_statusReviewerPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_reqOptHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_position` longtext COLLATE utf8mb3_unicode_ci,
  `c_conImpScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_note` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover2` longtext COLLATE utf8mb3_unicode_ci,
  `c_commitScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover4` longtext COLLATE utf8mb3_unicode_ci,
  `c_strukOrgn` longtext COLLATE utf8mb3_unicode_ci,
  `c_kekuatan` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover3` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover5` longtext COLLATE utf8mb3_unicode_ci,
  `c_departemen` longtext COLLATE utf8mb3_unicode_ci,
  `c_jumlahPenilai` longtext COLLATE utf8mb3_unicode_ci,
  `c_productivity` tinyint DEFAULT NULL,
  `c_actualAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_accuracyPresentation` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_jobControl` longtext COLLATE utf8mb3_unicode_ci,
  `c_opsiForm` longtext COLLATE utf8mb3_unicode_ci,
  `c_innovScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAvgScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_confidence` tinyint DEFAULT NULL,
  `c_npk` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_divisi` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusKepegawaian` longtext COLLATE utf8mb3_unicode_ci,
  `c_posFeedback` longtext COLLATE utf8mb3_unicode_ci,
  `c_scoreRoleResponsibility` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover5PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_overall6ValueSM` tinyint DEFAULT NULL,
  `c_aspKualScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_avgScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_commitScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_supportingDocument` longtext COLLATE utf8mb3_unicode_ci,
  `c_probSolving` tinyint DEFAULT NULL,
  `c_kesimpulan` tinyint DEFAULT NULL,
  `c_reviseChoice` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverPAAdmin` longtext COLLATE utf8mb3_unicode_ci,
  `c_name2` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  `c_positionID` longtext COLLATE utf8mb3_unicode_ci,
  `c_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDatePlace` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDateTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing2` longtext COLLATE utf8mb3_unicode_ci,
  `c_endJoinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_gender` longtext COLLATE utf8mb3_unicode_ci,
  `c_remember` longtext COLLATE utf8mb3_unicode_ci,
  `c_nikKTP` longtext COLLATE utf8mb3_unicode_ci,
  `c_address` longtext COLLATE utf8mb3_unicode_ci,
  `c_noLampiran` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn` longtext COLLATE utf8mb3_unicode_ci,
  `c_numberPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_idPosisi` longtext COLLATE utf8mb3_unicode_ci,
  `c_hal` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_consider` longtext COLLATE utf8mb3_unicode_ci,
  `c_setIn` longtext COLLATE utf8mb3_unicode_ci,
  `c_endJoinDateTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate2` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOnTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_recommendationHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_number2` longtext COLLATE utf8mb3_unicode_ci,
  `c_newCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_noTelp` longtext COLLATE utf8mb3_unicode_ci,
  `c_periodOfService` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalMonthContract` longtext COLLATE utf8mb3_unicode_ci,
  `c_currentCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDateTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_noTelpTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOnDetailsTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_periodOfServiceTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_endTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_buPKWTTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_buGroupSeq` longtext COLLATE utf8mb3_unicode_ci,
  `c_nomorTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_nomorTemp2` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCodeSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver` longtext COLLATE utf8mb3_unicode_ci,
  `c_newEndJoinTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPositionDesc` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingDisnaker` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingPK` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthPlaceTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_addressTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDateTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_sigApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_idNumberTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_sexTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalMonthContractTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_newEndJoin` longtext COLLATE utf8mb3_unicode_ci,
  `c_newEndJoinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHRBP` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHRBP4` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHRBP3` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHRBP2` longtext COLLATE utf8mb3_unicode_ci,
  `c_contribution` tinyint DEFAULT NULL,
  `c_planning` tinyint DEFAULT NULL,
  `c_joinDateRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_newLeaveEffectiveDateRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_communicationSkill` tinyint DEFAULT NULL,
  `c_materialMastery` tinyint DEFAULT NULL,
  `c_knowledge` tinyint DEFAULT NULL,
  `c_implemenTaskCommit` tinyint DEFAULT NULL,
  `c_teamwork` tinyint DEFAULT NULL,
  `c_custOriented` tinyint DEFAULT NULL,
  `c_subyekPresentasi` tinyint DEFAULT NULL,
  `c_AnalCriThinkingProbSolving` tinyint DEFAULT NULL,
  `c_timeControl` tinyint DEFAULT NULL,
  `c_kelemahan` tinyint DEFAULT NULL,
  `c_materialDelivery` tinyint DEFAULT NULL,
  `c_leaveEffectiveDateRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_newJoinDateRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDateRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccIR2` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccIR1` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_pkwt_massal` longtext COLLATE utf8mb3_unicode_ci,
  `c_evalDocument` longtext COLLATE utf8mb3_unicode_ci,
  `c_workLocName` longtext COLLATE utf8mb3_unicode_ci,
  `c_recommendationTxt` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif6` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif5` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif8` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif7` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif5` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif6` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif7` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif8` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif5` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif6` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif7` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif8` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif5` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif8` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif7` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif6` longtext COLLATE utf8mb3_unicode_ci,
  `c_number3` longtext COLLATE utf8mb3_unicode_ci,
  `c_emp_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_reason` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveDatePKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_perihal_pkwt` longtext COLLATE utf8mb3_unicode_ci,
  `c_location_pkwt` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_whatSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_tanggalMasukKerja` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalMonthContractRPA` longtext COLLATE utf8mb3_unicode_ci,
  `c_tanggalBerakhirPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_runningWAToken` longtext COLLATE utf8mb3_unicode_ci,
  `c_runningWAExp` longtext COLLATE utf8mb3_unicode_ci,
  `c_checkRSNext` longtext COLLATE utf8mb3_unicode_ci,
  `c_paAdminPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_paSpvPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentPAAdmin` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusPAAdminPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusPASpvPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentPASpv` longtext COLLATE utf8mb3_unicode_ci,
  `c_karyawanExpatriate` longtext COLLATE utf8mb3_unicode_ci,
  `c_penutupEng` longtext COLLATE utf8mb3_unicode_ci,
  `c_mengingatEng` longtext COLLATE utf8mb3_unicode_ci,
  `c_menimbangEng` longtext COLLATE utf8mb3_unicode_ci,
  `c_sponsorKITASNew` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNo` longtext COLLATE utf8mb3_unicode_ci,
  `c_recommendationKITASContract` longtext COLLATE utf8mb3_unicode_ci,
  `c_endOfKITAS` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover6PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_KITASNo` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver6PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover6` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOnTempCHRO` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOnTempCHRODetails` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOnTempCHROEngDetails` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1SelectBox` longtext COLLATE utf8mb3_unicode_ci,
  `c_currentApprover1PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_typeOfContract` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1PKWTSelectBox` longtext COLLATE utf8mb3_unicode_ci,
  `c_avgScore1HTML` mediumtext COLLATE utf8mb3_unicode_ci,
  `c_aspKualScoreHTML` mediumtext COLLATE utf8mb3_unicode_ci,
  `c_totScoreKinerjaCalculationField` mediumtext COLLATE utf8mb3_unicode_ci,
  `c_totScoreKinerjaHTML` mediumtext COLLATE utf8mb3_unicode_ci,
  `c_urlCekBaseURL` longtext COLLATE utf8mb3_unicode_ci,
  `c_rpaStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_buGrpId` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1APKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3APKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1APKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover3APKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1A` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover3A` longtext COLLATE utf8mb3_unicode_ci,
  `c_positiveAssesmentTextEditor` longtext COLLATE utf8mb3_unicode_ci,
  `c_negativeAssesmentTextEditor` longtext COLLATE utf8mb3_unicode_ci,
  `c_supervisorCommentTextEditor` longtext COLLATE utf8mb3_unicode_ci,
  `c_achievementTextEditor` longtext COLLATE utf8mb3_unicode_ci,
  `c_taskReviewTextEditor` longtext COLLATE utf8mb3_unicode_ci,
  `c_lateness` longtext COLLATE utf8mb3_unicode_ci,
  `c_leavingEarly` longtext COLLATE utf8mb3_unicode_ci,
  `c_license` longtext COLLATE utf8mb3_unicode_ci,
  `c_licenseNote` longtext COLLATE utf8mb3_unicode_ci,
  `c_360Feedback` longtext COLLATE utf8mb3_unicode_ci,
  `c_kpi` longtext COLLATE utf8mb3_unicode_ci,
  `c_taskReview` longtext COLLATE utf8mb3_unicode_ci,
  `c_supervisorComment` longtext COLLATE utf8mb3_unicode_ci,
  `c_achievement` longtext COLLATE utf8mb3_unicode_ci,
  `c_negativeAssesment` longtext COLLATE utf8mb3_unicode_ci,
  `c_positiveAssesment` longtext COLLATE utf8mb3_unicode_ci,
  `c_roleSupervisor` longtext COLLATE utf8mb3_unicode_ci,
  `c_spvNameAPI` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2PKWTSamsek` longtext COLLATE utf8mb3_unicode_ci,
  `c_workUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_achievementTextEditorHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approverDirectorSAMSEK` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApproverDirectorSAMSEK` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApproverDirectorSAMSEK` longtext COLLATE utf8mb3_unicode_ci,
  `c_workUnitRadio` longtext COLLATE utf8mb3_unicode_ci,
  `c_cabangWorkUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1BSAMSEK` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusApprover1BSAMSEK` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1BSAMSEK` longtext COLLATE utf8mb3_unicode_ci,
  `c_signerReport` longtext COLLATE utf8mb3_unicode_ci,
  `c_tipeEvaluasi` longtext COLLATE utf8mb3_unicode_ci,
  `c_linkApproval` longtext COLLATE utf8mb3_unicode_ci,
  `c_processIdNotif` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_sk_pkwt_history`
--

DROP TABLE IF EXISTS `app_fd_sk_pkwt_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_sk_pkwt_history` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_approver4PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_field11` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionCodeHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver2PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver3PKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_paAdminPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_paSpvPKWT` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_sk_pkwt_mass`
--

DROP TABLE IF EXISTS `app_fd_sk_pkwt_mass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_sk_pkwt_mass` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_pt` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDatePlace` longtext COLLATE utf8mb3_unicode_ci,
  `c_aspKuanScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentSPP1` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_hal` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing` longtext COLLATE utf8mb3_unicode_ci,
  `c_consider` longtext COLLATE utf8mb3_unicode_ci,
  `c_integrityScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_setIn` longtext COLLATE utf8mb3_unicode_ci,
  `c_posAttitudeScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_level` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualSPP1` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_loyalScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_descSPP1` longtext COLLATE utf8mb3_unicode_ci,
  `c_buPKWTTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt2` longtext COLLATE utf8mb3_unicode_ci,
  `c_descAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate2` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing2` longtext COLLATE utf8mb3_unicode_ci,
  `c_endJoinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_position` longtext COLLATE utf8mb3_unicode_ci,
  `c_conImpScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_name2` longtext COLLATE utf8mb3_unicode_ci,
  `c_innovScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_gender` longtext COLLATE utf8mb3_unicode_ci,
  `c_currentCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_commitScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_number2` longtext COLLATE utf8mb3_unicode_ci,
  `c_strukOrgn` longtext COLLATE utf8mb3_unicode_ci,
  `c_departemen` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentSRR1` longtext COLLATE utf8mb3_unicode_ci,
  `c_consFeedback` longtext COLLATE utf8mb3_unicode_ci,
  `c_remember` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthPlace` longtext COLLATE utf8mb3_unicode_ci,
  `c_total` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAvgScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_parrent_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAvgScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_noLampiran` longtext COLLATE utf8mb3_unicode_ci,
  `c_address` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn` longtext COLLATE utf8mb3_unicode_ci,
  `c_noKTP` longtext COLLATE utf8mb3_unicode_ci,
  `c_actualSRR1` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingDisnaker` longtext COLLATE utf8mb3_unicode_ci,
  `c_itemAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_divisi` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusKepegawaian` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_posFeedback` longtext COLLATE utf8mb3_unicode_ci,
  `c_noTelp` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingPK` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif2` longtext COLLATE utf8mb3_unicode_ci,
  `c_aspKualScore` longtext COLLATE utf8mb3_unicode_ci,
  `c_newEndJoinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif1` longtext COLLATE utf8mb3_unicode_ci,
  `c_avgScore1` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif4` longtext COLLATE utf8mb3_unicode_ci,
  `c_superCommentAKuantitatif3` longtext COLLATE utf8mb3_unicode_ci,
  `c_numberPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_periodOfService` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_totScoreKinerja` longtext COLLATE utf8mb3_unicode_ci,
  `c_number3` longtext COLLATE utf8mb3_unicode_ci,
  `c_location_pkwt` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveDatePKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_perihal_pkwt` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_checkRSNext` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_sk_request`
--

DROP TABLE IF EXISTS `app_fd_sk_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_sk_request` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_tipeSurat` longtext COLLATE utf8mb3_unicode_ci,
  `c_createProposal` longtext COLLATE utf8mb3_unicode_ci,
  `c_deliverHCToSPV` longtext COLLATE utf8mb3_unicode_ci,
  `c_salaryProposalStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_attachDocs` longtext COLLATE utf8mb3_unicode_ci,
  `c_requestTitle` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionSAPIT008` longtext COLLATE utf8mb3_unicode_ci,
  `c_skThreeSTatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_updatePa` longtext COLLATE utf8mb3_unicode_ci,
  `c_skPermanent` longtext COLLATE utf8mb3_unicode_ci,
  `c_skCreated` longtext COLLATE utf8mb3_unicode_ci,
  `c_deliverSk` longtext COLLATE utf8mb3_unicode_ci,
  `c_approvalSKGaji` longtext COLLATE utf8mb3_unicode_ci,
  `c_createSalaryProposal` longtext COLLATE utf8mb3_unicode_ci,
  `c_skGaji` longtext COLLATE utf8mb3_unicode_ci,
  `c_updateIt8` longtext COLLATE utf8mb3_unicode_ci,
  `c_skPromotion` longtext COLLATE utf8mb3_unicode_ci,
  `c_skPengangkatan` longtext COLLATE utf8mb3_unicode_ci,
  `c_completeStatus` longtext COLLATE utf8mb3_unicode_ci,
  `c_field6` longtext COLLATE utf8mb3_unicode_ci,
  `c_salaryGajiSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_actionSAP` longtext COLLATE utf8mb3_unicode_ci,
  `c_field4` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_sk_temp`
--

DROP TABLE IF EXISTS `app_fd_sk_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_sk_temp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_varAuth` longtext COLLATE utf8mb3_unicode_ci,
  `c_aboutPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_tipeSurat` longtext COLLATE utf8mb3_unicode_ci,
  `c_about` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_10` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_11` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_18` longtext COLLATE utf8mb3_unicode_ci,
  `c_iteration` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_19` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_16` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_17` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_14` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_15` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_12` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_13` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_20` longtext COLLATE utf8mb3_unicode_ci,
  `c_empNumber` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_9` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_8` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_7` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_6` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_5` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_4` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_3` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_2` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_1` longtext COLLATE utf8mb3_unicode_ci,
  `c_submitAutoLogin` longtext COLLATE utf8mb3_unicode_ci,
  `c_processIdNotif` longtext COLLATE utf8mb3_unicode_ci,
  `c_tipeEvaluasi` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_setIn` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval1StatusHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_level` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn` longtext COLLATE utf8mb3_unicode_ci,
  `c_about` longtext COLLATE utf8mb3_unicode_ci,
  `c_approval1` longtext COLLATE utf8mb3_unicode_ci,
  `c_footerLeft` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentApprover1` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver1` longtext COLLATE utf8mb3_unicode_ci,
  `c_remember` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing` longtext COLLATE utf8mb3_unicode_ci,
  `c_supportingDocument` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_consider` longtext COLLATE utf8mb3_unicode_ci,
  `c_field8` longtext COLLATE utf8mb3_unicode_ci,
  `c_position` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_footerRight` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt` longtext COLLATE utf8mb3_unicode_ci,
  `c_divDept` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_divDept2` longtext COLLATE utf8mb3_unicode_ci,
  `c_position2` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt2` longtext COLLATE utf8mb3_unicode_ci,
  `c_location2` longtext COLLATE utf8mb3_unicode_ci,
  `c_location` longtext COLLATE utf8mb3_unicode_ci,
  `c_level2` longtext COLLATE utf8mb3_unicode_ci,
  `c_aboutHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_approveCommentReviewer` longtext COLLATE utf8mb3_unicode_ci,
  `c_rejectCommentReviewer` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusReviewer` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseCommentReviewer` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviewer` longtext COLLATE utf8mb3_unicode_ci,
  `c_assignmentUrl` longtext COLLATE utf8mb3_unicode_ci,
  `c_subject` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDatePlace` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation` longtext COLLATE utf8mb3_unicode_ci,
  `c_hal` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumber` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing2` longtext COLLATE utf8mb3_unicode_ci,
  `c_endJoinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing3` longtext COLLATE utf8mb3_unicode_ci,
  `c_name2` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily` longtext COLLATE utf8mb3_unicode_ci,
  `c_noLampiran` longtext COLLATE utf8mb3_unicode_ci,
  `c_hakkewajiban` longtext COLLATE utf8mb3_unicode_ci,
  `c_rightsObligations` longtext COLLATE utf8mb3_unicode_ci,
  `c_to` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily` longtext COLLATE utf8mb3_unicode_ci,
  `c_numberPKWT` longtext COLLATE utf8mb3_unicode_ci,
  `c_periodOfService` longtext COLLATE utf8mb3_unicode_ci,
  `c_consider2` longtext COLLATE utf8mb3_unicode_ci,
  `c_keterangan` longtext COLLATE utf8mb3_unicode_ci,
  `c_remarks` longtext COLLATE utf8mb3_unicode_ci,
  `c_namaBank` longtext COLLATE utf8mb3_unicode_ci,
  `c_tujuan` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDate2` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_rotasi_massal` longtext COLLATE utf8mb3_unicode_ci,
  `c_paklaring_massal` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file_paklaring` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalFamily` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation5` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation4` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation3` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation2` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily2` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily3` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily4` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily5` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily5` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily3` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily4` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily2` longtext COLLATE utf8mb3_unicode_ci,
  `c_reqOptHidden` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHrbp` longtext COLLATE utf8mb3_unicode_ci,
  `c_totalHRBP` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHrbp4` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHrbp2` longtext COLLATE utf8mb3_unicode_ci,
  `c_ccHrbp3` longtext COLLATE utf8mb3_unicode_ci,
  `c_nextActivityId` longtext COLLATE utf8mb3_unicode_ci,
  `c_skipApproval` longtext COLLATE utf8mb3_unicode_ci,
  `c_reviseChoice` longtext COLLATE utf8mb3_unicode_ci,
  `c_idSuratKeputusan` longtext COLLATE utf8mb3_unicode_ci,
  `c_disnaker_massal` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate2` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file_disnaker` longtext COLLATE utf8mb3_unicode_ci,
  `c_buTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_gender` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnitAPI` longtext COLLATE utf8mb3_unicode_ci,
  `c_address` longtext COLLATE utf8mb3_unicode_ci,
  `c_businessUnitTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_buGroupSeq` longtext COLLATE utf8mb3_unicode_ci,
  `c_buGroupTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_noTelp` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCode1` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCodeSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_note` longtext COLLATE utf8mb3_unicode_ci,
  `c_noKTP` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthPlaceTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDateTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_approver` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn3` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn2` longtext COLLATE utf8mb3_unicode_ci,
  `c_tipeSurat` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file_1b` longtext COLLATE utf8mb3_unicode_ci,
  `c_upload_file_test` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingDisnaker` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingPaklaring` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingVisa` longtext COLLATE utf8mb3_unicode_ci,
  `c_runningWAExp` longtext COLLATE utf8mb3_unicode_ci,
  `c_runningWAToken` longtext COLLATE utf8mb3_unicode_ci,
  `c_field11` longtext COLLATE utf8mb3_unicode_ci,
  `c_mass_pengangkatan` longtext COLLATE utf8mb3_unicode_ci,
  `c_varAuth` longtext COLLATE utf8mb3_unicode_ci,
  `c_paklaring_and_disnaker` longtext COLLATE utf8mb3_unicode_ci,
  `c_title` longtext COLLATE utf8mb3_unicode_ci,
  `c_tujuanEng` longtext COLLATE utf8mb3_unicode_ci,
  `c_rememberEng` longtext COLLATE utf8mb3_unicode_ci,
  `c_karyawanExpatriate` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_10` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_11` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_18` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_19` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_16` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_17` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_14` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_15` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_12` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_13` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_20` longtext COLLATE utf8mb3_unicode_ci,
  `c_empNumber` longtext COLLATE utf8mb3_unicode_ci,
  `c_iteration` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_9` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_8` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_7` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_6` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_5` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_4` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_3` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_2` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik_1` longtext COLLATE utf8mb3_unicode_ci,
  `c_existRow` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily10` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation7` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation6` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation9` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation8` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily6` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily7` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily8` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily9` longtext COLLATE utf8mb3_unicode_ci,
  `c_relation10` longtext COLLATE utf8mb3_unicode_ci,
  `c_passportNumberFamily10` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily9` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily7` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily8` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameFamily6` longtext COLLATE utf8mb3_unicode_ci,
  `c_testMunculGa` longtext COLLATE utf8mb3_unicode_ci,
  `c_urlCekBaseURL` longtext COLLATE utf8mb3_unicode_ci,
  `c_orgStruct` longtext COLLATE utf8mb3_unicode_ci,
  `c_newSpvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_newPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_newLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_duration` longtext COLLATE utf8mb3_unicode_ci,
  `c_newOrgStruct` longtext COLLATE utf8mb3_unicode_ci,
  `c_spvName` longtext COLLATE utf8mb3_unicode_ci,
  `c_currentCompanyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_sexTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusKekaryawananToBe` longtext COLLATE utf8mb3_unicode_ci,
  `c_statusKekaryawananCurrent` longtext COLLATE utf8mb3_unicode_ci,
  `c_branch` longtext COLLATE utf8mb3_unicode_ci,
  `c_tujuanSamsek` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOnSamsek` longtext COLLATE utf8mb3_unicode_ci,
  `c_closingSamsek` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyName` longtext COLLATE utf8mb3_unicode_ci,
  `c_licenseNumber` longtext COLLATE utf8mb3_unicode_ci,
  `c_licensePublishDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_toLicense` longtext COLLATE utf8mb3_unicode_ci,
  `c_licenseType` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_apv`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_apv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_apv` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_user_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_employee_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_type` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_ccd`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_ccd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_ccd` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_companyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyName` longtext COLLATE utf8mb3_unicode_ci,
  `c_companySeq` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_comp`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_comp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_imageLogo` longtext COLLATE utf8mb3_unicode_ci,
  `c_code` longtext COLLATE utf8mb3_unicode_ci,
  `c_address` longtext COLLATE utf8mb3_unicode_ci,
  `c_logoPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_logo` longtext COLLATE utf8mb3_unicode_ci,
  `c_pic` longtext COLLATE utf8mb3_unicode_ci,
  `c_addressPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_stampImage` longtext COLLATE utf8mb3_unicode_ci,
  `c_origin` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyCodeSK` longtext COLLATE utf8mb3_unicode_ci,
  `c_addressImage` longtext COLLATE utf8mb3_unicode_ci,
  `c_addressType` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_gbu`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_gbu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_gbu` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_groupBUName` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupBUSeq` longtext COLLATE utf8mb3_unicode_ci,
  `c_groupBUCode` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_hrbp`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_hrbp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_hrbp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_email` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_mass`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_mass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_mass` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_businessUnit` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt` longtext COLLATE utf8mb3_unicode_ci,
  `c_setOn` longtext COLLATE utf8mb3_unicode_ci,
  `c_level` longtext COLLATE utf8mb3_unicode_ci,
  `c_birthDatePlace` longtext COLLATE utf8mb3_unicode_ci,
  `c_position2` longtext COLLATE utf8mb3_unicode_ci,
  `c_tujuan` longtext COLLATE utf8mb3_unicode_ci,
  `c_divDept` longtext COLLATE utf8mb3_unicode_ci,
  `c_pt2` longtext COLLATE utf8mb3_unicode_ci,
  `c_remember` longtext COLLATE utf8mb3_unicode_ci,
  `c_number` longtext COLLATE utf8mb3_unicode_ci,
  `c_nik` longtext COLLATE utf8mb3_unicode_ci,
  `c_divDept2` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_closing2` longtext COLLATE utf8mb3_unicode_ci,
  `c_parrent_id` longtext COLLATE utf8mb3_unicode_ci,
  `c_location2` longtext COLLATE utf8mb3_unicode_ci,
  `c_location` longtext COLLATE utf8mb3_unicode_ci,
  `c_position` longtext COLLATE utf8mb3_unicode_ci,
  `c_consider` longtext COLLATE utf8mb3_unicode_ci,
  `c_periodOfService` longtext COLLATE utf8mb3_unicode_ci,
  `c_effectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_level2` longtext COLLATE utf8mb3_unicode_ci,
  `c_hal` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_noLampiran` longtext COLLATE utf8mb3_unicode_ci,
  `c_leaveEffectiveDate2` longtext COLLATE utf8mb3_unicode_ci,
  `c_buPKWTTemp` longtext COLLATE utf8mb3_unicode_ci,
  `c_number2` longtext COLLATE utf8mb3_unicode_ci,
  `c_joinDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_existRow` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_pos`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_pos` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_positionName` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_sign`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_sign` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_sign_file` longtext COLLATE utf8mb3_unicode_ci,
  `c_user_id` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_surat_keputusan_temp`
--

DROP TABLE IF EXISTS `app_fd_surat_keputusan_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_surat_keputusan_temp` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_supportingDocument` longtext COLLATE utf8mb3_unicode_ci,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_test01`
--

DROP TABLE IF EXISTS `app_fd_test01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_test01` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_cOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_nPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_cWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_nDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_nDepartment` longtext COLLATE utf8mb3_unicode_ci,
  `c_cGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_nLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_cPosition` longtext COLLATE utf8mb3_unicode_ci,
  `c_cLevel` longtext COLLATE utf8mb3_unicode_ci,
  `c_nOrgStructure` longtext COLLATE utf8mb3_unicode_ci,
  `c_nGroupBU` longtext COLLATE utf8mb3_unicode_ci,
  `c_nWorkLocation` longtext COLLATE utf8mb3_unicode_ci,
  `c_cCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_cDivision` longtext COLLATE utf8mb3_unicode_ci,
  `c_cSection` longtext COLLATE utf8mb3_unicode_ci,
  `c_nCompCode` longtext COLLATE utf8mb3_unicode_ci,
  `c_nSection` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_test0224`
--

DROP TABLE IF EXISTS `app_fd_test0224`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_test0224` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_field1` longtext COLLATE utf8mb3_unicode_ci,
  `c_kota` longtext COLLATE utf8mb3_unicode_ci,
  `c_angka1` longtext COLLATE utf8mb3_unicode_ci,
  `c_angka2` longtext COLLATE utf8mb3_unicode_ci,
  `c_field2` longtext COLLATE utf8mb3_unicode_ci,
  `c_field5` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_test_form_01`
--

DROP TABLE IF EXISTS `app_fd_test_form_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_test_form_01` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_varUrl` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_travelAdvisory`
--

DROP TABLE IF EXISTS `app_fd_travelAdvisory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_travelAdvisory` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_sanitizers` longtext COLLATE utf8mb3_unicode_ci,
  `c_emergencyContact` longtext COLLATE utf8mb3_unicode_ci,
  `c_companyName` longtext COLLATE utf8mb3_unicode_ci,
  `c_limitContact` longtext COLLATE utf8mb3_unicode_ci,
  `c_photo` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameInfectedPerson` longtext COLLATE utf8mb3_unicode_ci,
  `c_liason` longtext COLLATE utf8mb3_unicode_ci,
  `c_contactWithConfirmedCase` longtext COLLATE utf8mb3_unicode_ci,
  `c_emergencyContactPhone` longtext COLLATE utf8mb3_unicode_ci,
  `c_visitorName` longtext COLLATE utf8mb3_unicode_ci,
  `c_q4Breathlessness` longtext COLLATE utf8mb3_unicode_ci,
  `c_q1temperature` longtext COLLATE utf8mb3_unicode_ci,
  `c_q3BodyAche` longtext COLLATE utf8mb3_unicode_ci,
  `c_from` longtext COLLATE utf8mb3_unicode_ci,
  `c_visitorAddress` longtext COLLATE utf8mb3_unicode_ci,
  `c_to` longtext COLLATE utf8mb3_unicode_ci,
  `c_countryOfOrigin` longtext COLLATE utf8mb3_unicode_ci,
  `c_visitorPhone` longtext COLLATE utf8mb3_unicode_ci,
  `c_event` longtext COLLATE utf8mb3_unicode_ci,
  `c_visitedC19Countries` longtext COLLATE utf8mb3_unicode_ci,
  `c_nameVisitedC19Countries` longtext COLLATE utf8mb3_unicode_ci,
  `c_faceMask` longtext COLLATE utf8mb3_unicode_ci,
  `c_status` longtext COLLATE utf8mb3_unicode_ci,
  `c_q2Cough` longtext COLLATE utf8mb3_unicode_ci,
  `c_keperluan` longtext COLLATE utf8mb3_unicode_ci,
  `c_lantai` longtext COLLATE utf8mb3_unicode_ci,
  `c_intendedPerson` longtext COLLATE utf8mb3_unicode_ci,
  `c_location` longtext COLLATE utf8mb3_unicode_ci,
  `c_conditionHealth` longtext COLLATE utf8mb3_unicode_ci,
  `c_uploadFoto` longtext COLLATE utf8mb3_unicode_ci,
  `c_language` longtext COLLATE utf8mb3_unicode_ci,
  `c_time` longtext COLLATE utf8mb3_unicode_ci,
  `c_completedVaccinated` longtext COLLATE utf8mb3_unicode_ci,
  `c_notOverseased` longtext COLLATE utf8mb3_unicode_ci,
  `c_notDiagnosedCovid` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_travelAdvisory_kary`
--

DROP TABLE IF EXISTS `app_fd_travelAdvisory_kary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_travelAdvisory_kary` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_name` longtext COLLATE utf8mb3_unicode_ci,
  `c_phone` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_travelAdvisory_loc`
--

DROP TABLE IF EXISTS `app_fd_travelAdvisory_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_travelAdvisory_loc` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_locationName` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_fd_wa_token`
--

DROP TABLE IF EXISTS `app_fd_wa_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_fd_wa_token` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modifiedByName` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `c_tokenExpDate` longtext COLLATE utf8mb3_unicode_ci,
  `c_token` longtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_datecreated` (`dateCreated`),
  KEY `idx_createdby` (`createdBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_form`
--

DROP TABLE IF EXISTS `app_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_form` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `formId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `tableName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `json` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`,`formId`),
  KEY `FK45957822462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK45957822462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_form_data_audit_trail`
--

DROP TABLE IF EXISTS `app_form_data_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_form_data_audit_trail` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appVersion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tableName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_message`
--

DROP TABLE IF EXISTS `app_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_message` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `ouid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `messageKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`,`ouid`),
  KEY `FKEE346FE9462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FKEE346FE9462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package`
--

DROP TABLE IF EXISTS `app_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package` (
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageVersion` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appVersion` bigint DEFAULT NULL,
  PRIMARY KEY (`packageId`,`packageVersion`),
  KEY `FK852EA428462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK852EA428462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package_activity_form`
--

DROP TABLE IF EXISTS `app_package_activity_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package_activity_form` (
  `processDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `activityDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageVersion` bigint NOT NULL,
  `ouid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formIFrameStyle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `autoContinue` bit(1) DEFAULT NULL,
  `disableSaveAsDraft` bit(1) DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKA8D741D5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKA8D741D5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package_activity_plugin`
--

DROP TABLE IF EXISTS `app_package_activity_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package_activity_plugin` (
  `processDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `activityDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageVersion` bigint NOT NULL,
  `ouid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pluginName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pluginProperties` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKADE8644C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKADE8644C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package_participant`
--

DROP TABLE IF EXISTS `app_package_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package_participant` (
  `processDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `participantId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageVersion` bigint NOT NULL,
  `ouid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pluginProperties` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`processDefId`,`participantId`,`packageId`,`packageVersion`),
  KEY `FK6D7BF59C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FK6D7BF59C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_plugin_default`
--

DROP TABLE IF EXISTS `app_plugin_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_plugin_default` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pluginName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pluginDescription` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pluginProperties` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK7A835713462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK7A835713462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_report_activity`
--

DROP TABLE IF EXISTS `app_report_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_report_activity` (
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `activityDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activityName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `processUid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK5E33D79C918F93D` (`processUid`),
  CONSTRAINT `FK5E33D79C918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_report_activity_instance`
--

DROP TABLE IF EXISTS `app_report_activity_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_report_activity_instance` (
  `instanceId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `performer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `assignmentUsers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `due` datetime DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint DEFAULT NULL,
  `timeConsumingFromCreatedTime` bigint DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint DEFAULT NULL,
  `activityUid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `processInstanceId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK9C6ABDD8B06E2043` (`activityUid`),
  KEY `FK9C6ABDD8D4610A90` (`processInstanceId`),
  CONSTRAINT `FK9C6ABDD8B06E2043` FOREIGN KEY (`activityUid`) REFERENCES `app_report_activity` (`uuid`),
  CONSTRAINT `FK9C6ABDD8D4610A90` FOREIGN KEY (`processInstanceId`) REFERENCES `app_report_process_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_report_app`
--

DROP TABLE IF EXISTS `app_report_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_report_app` (
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appVersion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_report_package`
--

DROP TABLE IF EXISTS `app_report_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_report_package` (
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `packageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `packageVersion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appUid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKBD580A19E475ABC` (`appUid`),
  CONSTRAINT `FKBD580A19E475ABC` FOREIGN KEY (`appUid`) REFERENCES `app_report_app` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_report_process`
--

DROP TABLE IF EXISTS `app_report_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_report_process` (
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `processDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `processName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `packageUid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKDAFFF442D40695DD` (`packageUid`),
  CONSTRAINT `FKDAFFF442D40695DD` FOREIGN KEY (`packageUid`) REFERENCES `app_report_package` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_report_process_instance`
--

DROP TABLE IF EXISTS `app_report_process_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_report_process_instance` (
  `instanceId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `requester` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint DEFAULT NULL,
  `processUid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK351D7BF2918F93D` (`processUid`),
  CONSTRAINT `FK351D7BF2918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_resource`
--

DROP TABLE IF EXISTS `app_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_resource` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `filesize` bigint DEFAULT NULL,
  `permissionClass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `permissionProperties` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  CONSTRAINT `FK_nnvkg0h6yy8o3f4yjhd20ury0` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_userview`
--

DROP TABLE IF EXISTS `app_userview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_userview` (
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appVersion` bigint NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `json` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FKE411D54E462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FKE411D54E462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_department`
--

DROP TABLE IF EXISTS `dir_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_department` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEE8AA4418CEBAE1` (`organizationId`),
  KEY `FKEEE8AA44EF6BB2B7` (`parentId`),
  KEY `FKEEE8AA4480DB1449` (`hod`),
  CONSTRAINT `FKEEE8AA4418CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKEEE8AA4480DB1449` FOREIGN KEY (`hod`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FKEEE8AA44EF6BB2B7` FOREIGN KEY (`parentId`) REFERENCES `dir_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_employment`
--

DROP TABLE IF EXISTS `dir_employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_employment` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employeeCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gradeId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `departmentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC6620ADE716AE35F` (`departmentId`),
  KEY `FKC6620ADE14CE02E9` (`gradeId`),
  KEY `FKC6620ADECE539211` (`userId`),
  KEY `FKC6620ADE18CEBAE1` (`organizationId`),
  CONSTRAINT `FKC6620ADE14CE02E9` FOREIGN KEY (`gradeId`) REFERENCES `dir_grade` (`id`),
  CONSTRAINT `FKC6620ADE18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKC6620ADE716AE35F` FOREIGN KEY (`departmentId`) REFERENCES `dir_department` (`id`),
  CONSTRAINT `FKC6620ADECE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_employment_20230123`
--

DROP TABLE IF EXISTS `dir_employment_20230123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_employment_20230123` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employeeCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gradeId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `departmentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC6620ADE716AE35F` (`departmentId`),
  KEY `FKC6620ADE14CE02E9` (`gradeId`),
  KEY `FKC6620ADECE539211` (`userId`),
  KEY `FKC6620ADE18CEBAE1` (`organizationId`),
  CONSTRAINT `dir_employment_20230123_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `dir_grade` (`id`),
  CONSTRAINT `dir_employment_20230123_ibfk_2` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `dir_employment_20230123_ibfk_3` FOREIGN KEY (`departmentId`) REFERENCES `dir_department` (`id`),
  CONSTRAINT `dir_employment_20230123_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_employment_report_to`
--

DROP TABLE IF EXISTS `dir_employment_report_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_employment_report_to` (
  `employmentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reportToId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employmentId`,`reportToId`),
  KEY `FK53622945F4068416` (`reportToId`),
  KEY `FK536229452787E613` (`employmentId`),
  CONSTRAINT `FK536229452787E613` FOREIGN KEY (`employmentId`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FK53622945F4068416` FOREIGN KEY (`reportToId`) REFERENCES `dir_employment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_grade`
--

DROP TABLE IF EXISTS `dir_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_grade` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A49A518CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A49A518CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_group`
--

DROP TABLE IF EXISTS `dir_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_group` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A804D18CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A804D18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_organization`
--

DROP TABLE IF EXISTS `dir_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_organization` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parentId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55A15FA5961BD498` (`parentId`),
  CONSTRAINT `FK55A15FA5961BD498` FOREIGN KEY (`parentId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_role`
--

DROP TABLE IF EXISTS `dir_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_role` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user`
--

DROP TABLE IF EXISTS `dir_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` int DEFAULT NULL,
  `timeZone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_20230123`
--

DROP TABLE IF EXISTS `dir_user_20230123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_20230123` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` int DEFAULT NULL,
  `timeZone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_extra`
--

DROP TABLE IF EXISTS `dir_user_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_extra` (
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `algorithm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `loginAttempt` int DEFAULT NULL,
  `failedloginAttempt` int DEFAULT NULL,
  `lastLogedInDate` datetime DEFAULT NULL,
  `lockOutDate` datetime DEFAULT NULL,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `requiredPasswordChange` bit(1) DEFAULT NULL,
  `noPasswordExpiration` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_group`
--

DROP TABLE IF EXISTS `dir_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_group` (
  `groupId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `FK2F0367FD159B6639` (`groupId`),
  KEY `FK2F0367FDCE539211` (`userId`),
  CONSTRAINT `FK2F0367FD159B6639` FOREIGN KEY (`groupId`) REFERENCES `dir_group` (`id`),
  CONSTRAINT `FK2F0367FDCE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_meta`
--

DROP TABLE IF EXISTS `dir_user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_meta` (
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `meta_value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`username`,`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_password_history`
--

DROP TABLE IF EXISTS `dir_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_password_history` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_replacement`
--

DROP TABLE IF EXISTS `dir_user_replacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_replacement` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `replacementUser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `processIds` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_replacement_user` (`replacementUser`),
  KEY `idx_start` (`startDate`),
  KEY `idx_end` (`endDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_role`
--

DROP TABLE IF EXISTS `dir_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_role` (
  `roleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK5C5FE738C8FE3CA7` (`roleId`),
  KEY `FK5C5FE738CE539211` (`userId`),
  CONSTRAINT `FK5C5FE738C8FE3CA7` FOREIGN KEY (`roleId`) REFERENCES `dir_role` (`id`),
  CONSTRAINT `FK5C5FE738CE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dir_user_role_20230123`
--

DROP TABLE IF EXISTS `dir_user_role_20230123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_user_role_20230123` (
  `roleId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK5C5FE738C8FE3CA7` (`roleId`),
  KEY `FK5C5FE738CE539211` (`userId`),
  CONSTRAINT `dir_user_role_20230123_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `dir_role` (`id`),
  CONSTRAINT `dir_user_role_20230123_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectid`
--

DROP TABLE IF EXISTS `objectid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectid` (
  `nextoid` decimal(19,0) NOT NULL,
  PRIMARY KEY (`nextoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_audit_trail`
--

DROP TABLE IF EXISTS `wf_audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_audit_trail` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clazz` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `timestamp` datetime DEFAULT NULL,
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appVersion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_history_activity`
--

DROP TABLE IF EXISTS `wf_history_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_history_activity` (
  `activityId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` bigint DEFAULT NULL,
  `accepted` bigint DEFAULT NULL,
  `lastStateTime` bigint DEFAULT NULL,
  `limitDuration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participantId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignmentUsers` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `variables` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activityId`),
  KEY `FK_7mmrnb28ugrdxpf0dpw35y73u` (`processId`),
  CONSTRAINT `FK_7mmrnb28ugrdxpf0dpw35y73u` FOREIGN KEY (`processId`) REFERENCES `wf_history_process` (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_history_process`
--

DROP TABLE IF EXISTS `wf_history_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_history_process` (
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processRequesterId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resourceRequesterId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started` bigint DEFAULT NULL,
  `created` bigint DEFAULT NULL,
  `lastStateTime` bigint DEFAULT NULL,
  `limitDuration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`processId`),
  CONSTRAINT `FK_prxyxtqy6byfrq3l5qght53l6` FOREIGN KEY (`processId`) REFERENCES `wf_process_link_history` (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_process_link`
--

DROP TABLE IF EXISTS `wf_process_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_process_link` (
  `processId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parentProcessId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `originProcessId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processId`),
  KEY `idx_origin` (`originProcessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_process_link_history`
--

DROP TABLE IF EXISTS `wf_process_link_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_process_link_history` (
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentProcessId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originProcessId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_report`
--

DROP TABLE IF EXISTS `wf_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_report` (
  `activityInstanceId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `processInstanceId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `dateLimit` bigint DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `delay` bigint DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `timeConsumingFromDateCreated` bigint DEFAULT NULL,
  `timeConsumingFromDateStarted` bigint DEFAULT NULL,
  `performer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `processDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activityDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `assignmentUsers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `appId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `appVersion` bigint DEFAULT NULL,
  PRIMARY KEY (`activityInstanceId`),
  KEY `FKB943CCA47A4E8F48` (`packageId`),
  KEY `FKB943CCA4A39D6461` (`processDefId`),
  KEY `FKB943CCA4CB863F` (`activityDefId`),
  CONSTRAINT `FKB943CCA47A4E8F48` FOREIGN KEY (`packageId`) REFERENCES `wf_report_package` (`packageId`),
  CONSTRAINT `FKB943CCA4A39D6461` FOREIGN KEY (`processDefId`) REFERENCES `wf_report_process` (`processDefId`),
  CONSTRAINT `FKB943CCA4CB863F` FOREIGN KEY (`activityDefId`) REFERENCES `wf_report_activity` (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_report_activity`
--

DROP TABLE IF EXISTS `wf_report_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_report_activity` (
  `activityDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `activityName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_report_package`
--

DROP TABLE IF EXISTS `wf_report_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_report_package` (
  `packageId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `packageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_report_process`
--

DROP TABLE IF EXISTS `wf_report_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_report_process` (
  `processDefId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `processName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_resource_bundle_message`
--

DROP TABLE IF EXISTS `wf_resource_bundle_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_resource_bundle_message` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `messageKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wf_setup`
--

DROP TABLE IF EXISTS `wf_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wf_setup` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `property` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `ordering` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-09  5:56:38
