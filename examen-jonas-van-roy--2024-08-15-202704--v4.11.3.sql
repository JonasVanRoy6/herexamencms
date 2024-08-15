-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cozyqhtfkjymfgbwtjlzigneegmughgurbwz` (`ownerId`),
  CONSTRAINT `fk_cozyqhtfkjymfgbwtjlzigneegmughgurbwz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pifhiqdbxzggpsiwdilirotuzwztcxznwsdt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nhjocfwkphvatnkoyciqulidpikbydhjsslv` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_sagvhhhmdiepvhhkpovbbfnnbfiakdysqkln` (`dateRead`),
  KEY `fk_ivsdlmoikezrwykiljxvsbbdazbvxicyvjvw` (`pluginId`),
  CONSTRAINT `fk_gglapubsuxpcqwsynpdtppvmmntuiqlrjfck` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ivsdlmoikezrwykiljxvsbbdazbvxicyvjvw` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nvevcpwelczrsfettjuqnismrmdeswhgnbgw` (`sessionId`,`volumeId`),
  KEY `idx_pivymfzkggvqmsquxzsmxrjrappptwsfbdzf` (`volumeId`),
  CONSTRAINT `fk_lngyteljbanbxqzekzmgdmfnaoerepjgahcn` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ukmtxvqbphacvctupnfmlvixfxsaqwavwzpm` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ahfodnnyxxytjqnxbzmbjnnrotbyuwifqsxh` (`filename`,`folderId`),
  KEY `idx_kkpzcadvekynwkiyhmcjzksznenyhteuexkv` (`folderId`),
  KEY `idx_onjozahsabybxqdcmntnulvpzvszmuvldadr` (`volumeId`),
  KEY `fk_kfnwuvqvuslreecnzmbijjiuclbbpypfuahh` (`uploaderId`),
  CONSTRAINT `fk_kfnwuvqvuslreecnzmbijjiuclbbpypfuahh` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sranqclyvnpqxmltytpfapxfavnfpbscrkwy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wkyhmeveilrnoyszzruxiijwlsvoipzkesyt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrkndghasujzsnlobggrdsfvcghdqicwnmwt` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msljnbcmmpyqjptdgchrzygmppdxfuxibwuc` (`groupId`),
  KEY `fk_jvtfxfjqrisqiqemceuyncylyfqiuwuufxmu` (`parentId`),
  CONSTRAINT `fk_cnovlsggqoivcjrjcokosniermpshdhnpzcy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jvtfxfjqrisqiqemceuyncylyfqiuwuufxmu` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ldezleuqxovbklnjeagczlnqpkserxdhsejk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cmdrxkgpowkvykcuratafsqsdcxwwekrsmfs` (`name`),
  KEY `idx_pvlhbfcwwjowbwsuxnqjztygmuucjkfitfzp` (`handle`),
  KEY `idx_idaxszxlzdvzwffemizjxpuoiadiwkjwotfh` (`structureId`),
  KEY `idx_dxlwggmpybxvrjsspafciijishdgezfhgxhm` (`fieldLayoutId`),
  KEY `idx_cspatdcbvbpkacaqvsekgxbzayzpvguilzmc` (`dateDeleted`),
  CONSTRAINT `fk_exrarupkciiauyzhkamamkskmolkvpehuoju` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fwggrsfhhmkqcgbumvxqlskcrljksrvecpgq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dyuzwsbieclgkyhjamsitbddjtatptqnebus` (`groupId`,`siteId`),
  KEY `idx_dooqzadwjdungcfojuuveulmlonytrhnraab` (`siteId`),
  CONSTRAINT `fk_ffzqjshzgtekdoamyazkuaydxuhxivfzxpiu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rtzouznyzbjxkznjkwmdhyknmkpcdvgdhlef` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ntrprcqevbwarikjdmmzyexxlynimthgcote` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qnasfjhmcjjevbipqylrfrgvkgebdkqdtczf` (`siteId`),
  KEY `fk_ormknsqnxuxynkkpqoacjlqviznwcornaays` (`userId`),
  CONSTRAINT `fk_bckkgeywxnfpjocxfrhpvigtzeznsblqprfo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ormknsqnxuxynkkpqoacjlqviznwcornaays` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qnasfjhmcjjevbipqylrfrgvkgebdkqdtczf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_cavyphtnykpeifnylxobllrcxbmhgatuvpkd` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_wwzwjlzrelbghurvotqrbfmplqgagwkvgkea` (`siteId`),
  KEY `fk_bfcolmrxcyioitwbnuwqujoupyhrrdmpnzbu` (`fieldId`),
  KEY `fk_bpqrxcwtplqplylghkxnjwibwrqanizwqmqx` (`userId`),
  CONSTRAINT `fk_bfcolmrxcyioitwbnuwqujoupyhrrdmpnzbu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bpqrxcwtplqplylghkxnjwibwrqanizwqmqx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_opatjsrhukwcrczgfjftyrzdytzjxzdpvalx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wwzwjlzrelbghurvotqrbfmplqgagwkvgkea` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_prijs_uvymsfej` decimal(7,2) DEFAULT NULL,
  `field_beschrijving_pgfoymjv` text,
  `field_primair_ykpxmovf` char(7) DEFAULT NULL,
  `field_secundair_esbuwhni` char(7) DEFAULT NULL,
  `field_zwart_xcfhxgvw` char(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dmyhwfpwcwoluzufpackjwpaczcxvnymdfoi` (`elementId`,`siteId`),
  KEY `idx_vqjeffhmghdoxitbpjlorcwghnpkckmulnrb` (`siteId`),
  KEY `idx_nrfhgmqfxewournbbeibvtzjhggcxubcwuue` (`title`),
  CONSTRAINT `fk_ntnwlqfmaekaxrqxcnkwlhkxoxlksmirmrip` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xffougbkclcxketxpdlzyxxofysizwigbctm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_zeaufcokajjkuxdkhsdlobolgfwtgybjvbua` (`userId`),
  CONSTRAINT `fk_zeaufcokajjkuxdkhsdlobolgfwtgybjvbua` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dqychrgbclymljydakegpwqtrrprlugitupi` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_zafmkxnhbztgiwsbxgtzszhduldctsnhcwlr` (`creatorId`,`provisional`),
  KEY `idx_cnbecqdazazylvewpwjegenjoalbqulzslll` (`saved`),
  KEY `fk_bysymdgrfwessevxqunjoymggdmywhrcwvhs` (`canonicalId`),
  CONSTRAINT `fk_bysymdgrfwessevxqunjoymggdmywhrcwvhs` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tyejgynyxrecogeljbwmjpqfenuzlitrlfkg` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_caiwxwluiblvlzqcyllnmwqhdpnkwmpfrock` (`elementId`,`timestamp`,`userId`),
  KEY `fk_zlxymoyuwvrkktkxrldudtunrkbvojdmlfas` (`userId`),
  KEY `fk_hichpdxqmntfvurqocacewejqkmuhkxufqrv` (`siteId`),
  KEY `fk_aneezjregsorqbhuehucwsephjypywjijjph` (`draftId`),
  CONSTRAINT `fk_aneezjregsorqbhuehucwsephjypywjijjph` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hichpdxqmntfvurqocacewejqkmuhkxufqrv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tmgztpmgjfksqkuhdfyemaivhmrwzrehgoqz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zlxymoyuwvrkktkxrldudtunrkbvojdmlfas` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dvenqxundryxwtgdohhxzjfqrsewpbmuvmln` (`dateDeleted`),
  KEY `idx_spprhkkvtbvdcoarcvurexjhhxdimconmere` (`fieldLayoutId`),
  KEY `idx_lmnzvjfcoydeanxuaznbkfftggppziiadngz` (`type`),
  KEY `idx_yckvhkcpdhqwwkrhmjbzvnjpdzuybdxzbugq` (`enabled`),
  KEY `idx_khhqvfhupfskuaeflierjjwqwzuxrhnefmxc` (`canonicalId`),
  KEY `idx_jqpnsljrufggpvgsvmgxivntdehpjdauzlyf` (`archived`,`dateCreated`),
  KEY `idx_aatxsotmiusirpsgomlykuxezvwkpppkzygq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_qqbpvtquwwsjmepkerwldqvfkbqiwxzojiet` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_sfvwcrvhnyzcmwjojyhmqvznnafzykpbxbtt` (`draftId`),
  KEY `fk_xdlfegekirhatqjpheaelmgzqeearadlsmof` (`revisionId`),
  CONSTRAINT `fk_euoiacubouihcgvemdyrzacmhgtwjougjhtd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sfvwcrvhnyzcmwjojyhmqvznnafzykpbxbtt` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xdlfegekirhatqjpheaelmgzqeearadlsmof` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xlopvdoysyvgvxexrutugnytkrqtvmukrkkw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_seekgpzogttjsedvkzhyxubehsjdbzxetkvr` (`elementId`,`siteId`),
  KEY `idx_yinizftwmadkgvphscsmyjedxavszxsvbdkk` (`siteId`),
  KEY `idx_iptfrgzvffnmisqvgyfkrbuthcnyfpalupjv` (`slug`,`siteId`),
  KEY `idx_fvpklmfxlskixnragbxzbesaqrnkcqiozdji` (`enabled`),
  KEY `idx_sdehnzoenvxcrlqhkptzvsdvhnjpheibaxjb` (`uri`,`siteId`),
  CONSTRAINT `fk_cobfcyowpvchwpriwpuzljzzkzhsjkgxqbim` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tlgiqfyllbnsgddtxarcedhrchksvwbtcwer` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qutxmjsmyvhzrntwsulliwgijxplmflsyyjr` (`postDate`),
  KEY `idx_pgrujyuxtndceccuuhqbhrdjkjhndldukmio` (`expiryDate`),
  KEY `idx_loqphglpgrsrqkwirrastryssdjemyqgdjfu` (`authorId`),
  KEY `idx_kguwygnhkjgaingurhcmdjtzwajtypehpaiw` (`sectionId`),
  KEY `idx_zztqbiszfqpwuvuzjbeydfuvxmgcdvddfpvv` (`typeId`),
  KEY `fk_lbmwljhhvsqkniutxqzsfnaufhhdtweiivrd` (`parentId`),
  CONSTRAINT `fk_dhxamcpmpvdgkhvdlxwyzysvwlxwqbaqinfr` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jkdxittppsfqujswdoasnyrnecvtevuuqajv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lbmwljhhvsqkniutxqzsfnaufhhdtweiivrd` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qbplttqaqpnecqeqkovclanpavfxplzzdafp` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wzjpdqfdyinncyxawbtfisyfweopftihvpxn` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zpbsbxdapcaspnevsohkrrvmeddtmjxhhhyp` (`name`,`sectionId`),
  KEY `idx_ofpysqiypumecwxrtexpotsavkrhtykedetd` (`handle`,`sectionId`),
  KEY `idx_vhuhfobppgiwvnjocpvnyntfnxlpfvxysgnn` (`sectionId`),
  KEY `idx_sptuoyfaeantnpcfngzqzgwqjglatkjdfxog` (`fieldLayoutId`),
  KEY `idx_zmntixdoweilsfrowgfmtgnqxvlbyqtyejil` (`dateDeleted`),
  CONSTRAINT `fk_korlvwsweexnhwiwygtviqkvdkqifgbihfgn` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mscjvifsxvzkyptgkszelvdubdmunxsudnrc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cjiasyplkfgmjhahuwvjamijpctbnnasnejk` (`name`),
  KEY `idx_kummsoilfunedsvyygwtahalepurighqewgb` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_llykmcepxwcxhkmpyfzorzmusuqmvyxxfdqy` (`layoutId`,`fieldId`),
  KEY `idx_ukuvucyckrmexuyzytakjtwcnvyirettwujm` (`sortOrder`),
  KEY `idx_igbbxfxminjcuwhnooaiiyjbaogcxrqwkypr` (`tabId`),
  KEY `idx_hpsmloksugmhfgdbgkkagserdrfxoyjempik` (`fieldId`),
  CONSTRAINT `fk_ounwthnmohtgyffrglobuquvzrpwydksvvyt` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xepkpcudyptpueeslqihgyaghxpmjjpcally` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yuzrezhxulzzvggkjbdxnminemwzsaslfljd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bqxqlkbwwgjueoqxtodjifhjgticntowcxmn` (`dateDeleted`),
  KEY `idx_gjwmwzuhtseqflbahzwcogzbeqmuwhhetjty` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_njgotzmogizjievtowbjbddjfxoulozpsnqw` (`sortOrder`),
  KEY `idx_eijxuysecovgprwpqyobdhmtrnbfpskjgsgg` (`layoutId`),
  CONSTRAINT `fk_sljaboljiihtmpqohwfkcdmkwmwftodiwuxa` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jmtlugumfudkpxizxjdywdzneagjofirsrmc` (`handle`,`context`),
  KEY `idx_yxtrikjkevwfzzdykddkoljxgtjorvqythqy` (`groupId`),
  KEY `idx_dmniebxarroknvqrlyyimkzfowgavawlfywc` (`context`),
  CONSTRAINT `fk_fnblguwttmegvybxxuaijkhmxedydaiubolk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_apsnppufapjxaeqoembycxzujjvtqvamkgpc` (`name`),
  KEY `idx_fqghekaflcoscecfprdlkjcrrtwzqhojherc` (`handle`),
  KEY `idx_jdyvpwcwhgxijjnvmwkukspxeohrnkmjcffs` (`fieldLayoutId`),
  KEY `idx_vfefswsxsyeqdznablmywwkfnbdshaakcoqj` (`sortOrder`),
  CONSTRAINT `fk_evylesuejpgbjqunrgoxbdyhnuvpkjntlvrr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gbzwwrzfwmyvwgqaxtrmdnlnawoxstwiwghu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vwcukbgngpbjgsuyegbfbeudevmwwkxfqsoi` (`accessToken`),
  UNIQUE KEY `idx_sdxtwfbklwwgnenqimcqekspsrutyhgphatk` (`name`),
  KEY `fk_fouujnplyatjklgwbctkeftazukhtkmekunu` (`schemaId`),
  CONSTRAINT `fk_fouujnplyatjklgwbctkeftazukhtkmekunu` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mlobqkqxxzogvgjcehbvnkdarxjraisnbtzc` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oqfkyzjpocvsuvxarumcdwuzbglvyrdxcsoi` (`name`),
  KEY `idx_lksurlzzccdklbmsfbqayjuyonxvxsfkxldu` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bpxqkpqixrmjklgqloqzobnpqrfclurwmncy` (`primaryOwnerId`),
  KEY `idx_idtulmguxnblvzjneatixdxfzoaweoxidqvk` (`fieldId`),
  KEY `idx_nhortjflrienkweeoyxwftpqsjthdihqnmjy` (`typeId`),
  CONSTRAINT `fk_eipnyoppgmtfwsjsiozjwlvjkpdipipgongu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvhftjwjzepbjuzwvgolmpyrerqjnixuvosf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rzftaqbehnpxkncjicsvugswlmnyuyzcrddi` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytjaqthhokgdaznzcutdeojhdojymnegvzpg` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_rwdontlnedsrmcwnieoncvpfvmlwvyavdgpt` (`ownerId`),
  CONSTRAINT `fk_aeakqnrhrklcezzkxadnqbhxzmgfcwebrsez` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rwdontlnedsrmcwnieoncvpfvmlwvyavdgpt` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hnlpoquhzrafbptuliunsmvtczlbnchmqnli` (`name`,`fieldId`),
  KEY `idx_enstflcdqelfhsieqvcnmsyeyqpedwivrffe` (`handle`,`fieldId`),
  KEY `idx_jqwgiscyvuzaumsmwmaesfrjcqflepuhikeb` (`fieldId`),
  KEY `idx_hrblmvxwlcfjdloeeygheaxritkxajxkobxq` (`fieldLayoutId`),
  CONSTRAINT `fk_funksyuvwwxnjgpgnpmfjpaukyffjjcixwpd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yfyunredcxjovytsfyxkprppruwyustcsqnt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_elqazjfimphcbhzyvxlbfnhkdpjnpnsntses` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lsbfbuurrpjhvdneywoicamgjegccrzvssvc` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_nncgeynuglcgqfzubmgxxxefqkenwcnjnozz` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_uppbnhuezayqbbkgcgrougcburykehhefctz` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rrptwixgccaejjkzsgwkindhxifbtpjhzlru` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_qezvxvsrmmmwbjcshqggflnmlykqbyiijgxo` (`sourceId`),
  KEY `idx_jzmylrtspbojsakvbqhtkgdhtgpdhebuktcl` (`targetId`),
  KEY `idx_phmewdsorvfvteymieojufgvbigcxzrnsbux` (`sourceSiteId`),
  CONSTRAINT `fk_alvzmdtwejnrlcczfbnsrqvvmazivpzdftug` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snyufwglclkfarpehhiyzzrcrrwazgxzuyxt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tozzrtouxgywjsfslssfmqixhjayedytlhkl` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ydnmeatifxgbrtceorrzmcuaswrrxtrfvstg` (`canonicalId`,`num`),
  KEY `fk_gszcecumzqejnsflipgkpjjstoxakuhjikqu` (`creatorId`),
  CONSTRAINT `fk_gszcecumzqejnsflipgkpjjstoxakuhjikqu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_onwvrwqgekcmlulpmduuaeevdzgyhkvkkssv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_thyilkpmvkymrysdtxmpiovrbyggyzjmhhew` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nyoyueurdshxrqvlegnuswukojdwbakcvola` (`handle`),
  KEY `idx_mjhefmaympomfylkeqjkzjsbumwvvferedas` (`name`),
  KEY `idx_mwcojsyolahatuywwoaaclgylstpzhmqrjoo` (`structureId`),
  KEY `idx_qksrorkqasvzgdasqocfsggacdsgoqjrrway` (`dateDeleted`),
  CONSTRAINT `fk_oqkgeskfvjwkzpgyiqbvlnhxzwgppjyptxsw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uqrfydswplazislqbcamqbnvhxipnihtxsli` (`sectionId`,`siteId`),
  KEY `idx_fywbjcskdsajcoahccuswbznuemlcxwgxpym` (`siteId`),
  CONSTRAINT `fk_ffhpbjagqmgzptfepxvgjpsokzqvyjkwxqnx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wkybvvqaghwzegetjiiwctqusoaaseheokdr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eevaugoedolpphsjfdpabvkwrjnhtuhrpblu` (`uid`),
  KEY `idx_vaaiabmsbsjrrrdlcjuxjevuenydnvuibmry` (`token`),
  KEY `idx_kwftyriowuitsnlizlsdgbyvsgxbpgxhiqnu` (`dateUpdated`),
  KEY `idx_dkjoxgaljlvljutcyauqrvnwfwyufxgukfhe` (`userId`),
  CONSTRAINT `fk_mdzwfwhydkpovtlgmhtuvwzlpnvrknrngwqm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vepdwvyduolasfzmnjveeolqevsllmbhailk` (`userId`,`message`),
  CONSTRAINT `fk_nhnjhvmqotvpvxhpwzrnaptnvywaoztmmmcj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cxwjrzyxxecpqiawxybubxrrpyioevdoinpa` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hvadkpycbrpefngjnjueqkkgdfsyhhjkylqf` (`dateDeleted`),
  KEY `idx_wldpvjjphekhcjdxzivoaxoazapmhaplxwkl` (`handle`),
  KEY `idx_ojvhhrsgxcjtyzuotthrhkswdjijcuxghdea` (`sortOrder`),
  KEY `fk_ramctatulxavowdeywocmsmjjnvawnblnttj` (`groupId`),
  CONSTRAINT `fk_ramctatulxavowdeywocmsmjjnvawnblnttj` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_grhfvswvqjlyhglvqyucqctnkcqrjnlheymy` (`structureId`,`elementId`),
  KEY `idx_jkhqzrehkraebkjveminivehjdjjtqeumfei` (`root`),
  KEY `idx_xjbnpaiespdewfflaloyobbukderpvsxcnvz` (`lft`),
  KEY `idx_rnmdxlvfgwxnitzynoxqdjhjavzpwuehsxkb` (`rgt`),
  KEY `idx_qgnhozivtefoptkcylhiaqqepmweldrpsxxr` (`level`),
  KEY `idx_gfsuymyvyybwzfdegmkfwxlnspysvvqwghjy` (`elementId`),
  CONSTRAINT `fk_nhubjjrimongxtdwxpdovfngxadrbdmjixmm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yunrllhdsuhpqrkjnbjbkkqlvxyneahksmtb` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kbqifizyxoebbwybnepyfeaqapvuutsmdhoh` (`key`,`language`),
  KEY `idx_ntoirrsxqmsxfirpjrmccjqnnwxnusllkjhb` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_krhgngtkxexlenssvouqivfjsggzqgchmfcv` (`name`),
  KEY `idx_plyexswhlkdardaayypmqwtixofizyzuwwtg` (`handle`),
  KEY `idx_oitmqfedduisiascreshkwfmpojqzfxonbdh` (`dateDeleted`),
  KEY `fk_frqjcwyonofrlurjisrksdsumvszufdjimxz` (`fieldLayoutId`),
  CONSTRAINT `fk_frqjcwyonofrlurjisrksdsumvszufdjimxz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kpbrcqmcfwplgzfrxtxgstiwoiyokapvgzya` (`groupId`),
  CONSTRAINT `fk_lqajaetictvmckyhvpxyygmcupoasurohkes` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sicuhwnhravlvmlbkhshinejmcfaydngjccm` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uvgdtvbljlebefphrdzaxwgksbmyeoyudigg` (`token`),
  KEY `idx_zkjgvqoxvgxsurhallyttbutexuwhaaqwvbr` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wxaqgciwrfpjpoutqfppstuwxiysipooeeid` (`handle`),
  KEY `idx_mmqkslpxhptfwgezexvznxkmygphawpmqcqc` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_geckxykothwgvaifewptcrvaylxtbbvcrypb` (`groupId`,`userId`),
  KEY `idx_kiedcuoiyepswghpkbrbbldnbkpipifpiltl` (`userId`),
  CONSTRAINT `fk_bmsanspbspfeklbzdagghslacqavwamzjsxp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ilesbdnewkgfxyctrfrsyzjqlnxcnglgxkkc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xindqrhukepomobohgvqsrqzinsxasfldmzs` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jiuqrtkgpgjthwhohcydiuuduraohtokrmpv` (`permissionId`,`groupId`),
  KEY `idx_uyugjgbplwfomjmcsrrgeiuhnurujushjain` (`groupId`),
  CONSTRAINT `fk_dyvtotmlsmwnmuldllprlbaloxszzlclelng` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_udadlpymrrhsflczpzpcpmxbfuddmmktaiat` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_terditehmpsditkywbhquddzzlvnultvhdfp` (`permissionId`,`userId`),
  KEY `idx_vvnqamuuyrvrtcnwxtrptrbjzwcyzxmrliqj` (`userId`),
  CONSTRAINT `fk_ezpyinisiabfymrujqqvjegslncvwgohevqk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gzbokhrjjlqesyueaofwtvjeukldzjzjjrsy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_qidqjuulfykswuvnqxpsdptiblxaoytjsvms` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_krygdjlcfmswgpcuhdgcyxpmqwcdkhudtrgu` (`active`),
  KEY `idx_qocogquowonjyukdaivlbgsoaybeetagwlrn` (`locked`),
  KEY `idx_ojpuxztgmbpzepvnfbbdaldbkgzubxmltzep` (`pending`),
  KEY `idx_fsoqzyyyrdqgrmarkwyoizighwyunkjpxpea` (`suspended`),
  KEY `idx_tymehzzgwrlvqslvgqxnydsicucilniixalv` (`verificationCode`),
  KEY `idx_mrfrrgchmktyehmlwnfkwmitsuxqonmvqmrx` (`email`),
  KEY `idx_foclcbyzjsharaappkckimlmelmrmzrhsymb` (`username`),
  KEY `fk_xnqqlwbhplasmhzllwldskmcmzkeaanjcsss` (`photoId`),
  CONSTRAINT `fk_tewpqubsydwhlbmnagesccvlcubxejcwibcg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnqqlwbhplasmhzllwldskmcmzkeaanjcsss` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sdziwjxusbypnhcidcldsifrpwzhagfdpbpo` (`name`,`parentId`,`volumeId`),
  KEY `idx_jnalapjoukuapfaexpdeheqepmwzopyrwfbz` (`parentId`),
  KEY `idx_hfpkyjfjhvwyxcoesgmgohjdppdmfrnwoaiu` (`volumeId`),
  CONSTRAINT `fk_evptocjhnkbrqbuctpcdrglspfluowjcnuat` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mpyxhsfqheyovqcegbooaipmjbvghjwecaku` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mbhnfmgclvhteqyfacckjykkmcijligirdbr` (`name`),
  KEY `idx_stoakzzksoenbfvlvqwzkjwnhkwtpkyzurso` (`handle`),
  KEY `idx_ffcvpyasxwmlvbgurwvxcqyfdjflxgtqdilv` (`fieldLayoutId`),
  KEY `idx_pdpjsxqmjrebmkopyfochidqcankqgarvpll` (`dateDeleted`),
  CONSTRAINT `fk_ryreovqbzaclchvrguchxuwskbdyyccvvhjz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mxqltziscmwrbdelrxgsomfadnfzonqhckzn` (`userId`),
  CONSTRAINT `fk_zbouwvlgxjwoyhrpkeyrjtlohuecszdiaoxg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 20:27:05
-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (4,1,1,1,'mojito.png','image',NULL,737,737,360392,NULL,0,0,'2024-01-10 10:10:13','2024-01-10 10:10:14','2024-01-10 10:10:14'),(8,1,1,1,'BlueLagoon.png','image',NULL,360,499,121580,NULL,0,0,'2024-01-10 12:04:42','2024-01-10 12:04:42','2024-01-10 12:04:42'),(9,1,1,1,'Caipirinha.png','image',NULL,460,553,201215,NULL,0,0,'2024-01-10 12:04:47','2024-01-10 12:04:47','2024-01-10 12:04:47'),(10,1,1,1,'bloody-mary.png','image',NULL,550,945,386833,NULL,0,0,'2024-01-10 12:04:51','2024-01-10 12:04:51','2024-01-10 12:04:51'),(11,1,1,1,'cubalibre.png','image',NULL,2021,3234,1878088,NULL,0,0,'2024-01-10 12:05:12','2024-01-10 12:05:12','2024-01-10 12:05:12'),(12,1,1,1,'long-island.png','image',NULL,313,342,87897,NULL,0,0,'2024-01-10 12:05:22','2024-01-10 12:05:22','2024-01-10 12:05:22'),(13,1,1,1,'tequilasunrise.png','image',NULL,433,567,141532,NULL,0,0,'2024-01-10 12:05:27','2024-01-10 12:05:27','2024-01-10 12:05:27'),(14,1,1,1,'sexonthebeach.png','image',NULL,1500,2709,1442140,NULL,0,0,'2024-01-10 12:05:36','2024-01-10 12:05:36','2024-01-10 12:05:36'),(58,1,1,1,'Alcohol-Drinks.jpg','image',NULL,1920,1280,561631,NULL,0,0,'2024-01-10 19:01:00','2024-01-10 19:01:00','2024-01-10 19:01:00'),(87,1,1,1,'benz.png','image',NULL,251,265,44029,NULL,NULL,NULL,'2024-08-13 11:42:58','2024-08-13 11:42:58','2024-08-13 11:42:58'),(88,1,1,1,'bureau.png','image',NULL,1062,719,157494,NULL,NULL,NULL,'2024-08-13 11:43:00','2024-08-13 11:43:00','2024-08-13 11:43:00'),(89,1,1,1,'bureau2.png','image',NULL,448,336,55710,NULL,NULL,NULL,'2024-08-13 11:43:00','2024-08-13 11:43:00','2024-08-13 11:43:00'),(90,1,1,1,'geel.png','image',NULL,250,257,57106,NULL,NULL,NULL,'2024-08-13 11:43:00','2024-08-13 11:43:00','2024-08-13 11:43:00'),(91,1,1,1,'kast.png','image',NULL,1363,1363,421115,NULL,NULL,NULL,'2024-08-13 11:43:02','2024-08-13 11:43:02','2024-08-13 11:43:02'),(92,1,1,1,'Leolux_Caruzzo_1-600x450.jpg.webp','image',NULL,600,450,8910,NULL,NULL,NULL,'2024-08-13 11:43:02','2024-08-13 11:43:02','2024-08-13 11:43:02'),(93,1,1,1,'mood.png','image',NULL,1000,1000,119576,NULL,NULL,NULL,'2024-08-13 11:43:04','2024-08-13 11:43:04','2024-08-13 11:43:04'),(94,1,1,1,'rb684-005-600x450.jpg.webp','image',NULL,600,450,7678,NULL,NULL,NULL,'2024-08-13 11:43:04','2024-08-13 11:43:04','2024-08-13 11:43:04'),(95,1,1,1,'sofa2.png','image',NULL,2000,2000,2092441,NULL,NULL,NULL,'2024-08-13 11:43:07','2024-08-13 11:43:08','2024-08-13 11:43:08'),(96,1,1,1,'sofas.webp','image',NULL,500,250,7924,NULL,NULL,NULL,'2024-08-13 11:43:08','2024-08-13 11:43:08','2024-08-13 11:43:08'),(97,1,1,1,'vakkenkast.png','image',NULL,1164,873,662702,NULL,NULL,NULL,'2024-08-13 11:43:09','2024-08-13 11:43:09','2024-08-13 11:43:09'),(169,1,1,1,'benz_2024-08-15-184841_peim.png','image',NULL,251,265,44029,NULL,NULL,NULL,'2024-08-15 18:48:42','2024-08-15 18:48:42','2024-08-15 18:48:42'),(172,1,1,1,'benz_2024-08-15-185028_jqur.png','image',NULL,251,265,44029,NULL,NULL,NULL,'2024-08-15 18:50:29','2024-08-15 18:50:29','2024-08-15 18:50:29'),(175,1,1,1,'geel_2024-08-15-185047_ydnt.png','image',NULL,250,257,57106,NULL,NULL,NULL,'2024-08-15 18:50:47','2024-08-15 18:50:48','2024-08-15 18:50:48'),(178,1,1,1,'vakkenkast_2024-08-15-185059_gfyb.png','image',NULL,1164,873,662702,NULL,NULL,NULL,'2024-08-15 18:50:59','2024-08-15 18:50:59','2024-08-15 18:50:59'),(181,1,1,1,'bureau_2024-08-15-185110_ujui.png','image',NULL,1062,719,157494,NULL,NULL,NULL,'2024-08-15 18:51:11','2024-08-15 18:51:11','2024-08-15 18:51:11'),(184,1,1,1,'mood_2024-08-15-185123_truu.png','image',NULL,1000,1000,119576,NULL,NULL,NULL,'2024-08-15 18:51:23','2024-08-15 18:51:23','2024-08-15 18:51:23'),(187,1,1,1,'sofa2_2024-08-15-185134_egxy.png','image',NULL,2000,2000,2092441,NULL,NULL,NULL,'2024-08-15 18:51:37','2024-08-15 18:51:37','2024-08-15 18:51:37'),(190,1,1,1,'kast_2024-08-15-185151_fbqg.png','image',NULL,1363,1363,421115,NULL,NULL,NULL,'2024-08-15 18:51:51','2024-08-15 18:51:52','2024-08-15 18:51:52'),(193,1,1,1,'bureau2_2024-08-15-185204_qeuz.png','image',NULL,448,336,55710,NULL,NULL,NULL,'2024-08-15 18:52:04','2024-08-15 18:52:04','2024-08-15 18:52:04');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES (50,1,NULL,1,'2024-01-10 15:32:04','2024-01-10 15:32:04'),(120,3,NULL,NULL,'2024-08-14 13:31:15','2024-08-14 13:31:15'),(123,3,NULL,NULL,'2024-08-14 13:40:52','2024-08-14 13:40:52'),(124,3,NULL,NULL,'2024-08-14 13:40:58','2024-08-14 13:40:58'),(126,3,NULL,NULL,'2024-08-14 13:41:44','2024-08-14 13:41:44'),(127,3,NULL,NULL,'2024-08-14 13:42:17','2024-08-14 13:42:17'),(128,3,NULL,NULL,'2024-08-14 13:42:52','2024-08-14 13:42:52'),(129,3,NULL,NULL,'2024-08-14 13:43:01','2024-08-14 13:43:01'),(134,3,NULL,NULL,'2024-08-14 13:49:13','2024-08-14 13:49:13');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES (1,1,8,'Above 4 stars','above4Stars','end','2024-01-10 15:29:34','2024-01-10 15:29:34','2024-08-14 13:27:04','65605942-9145-4e59-8df2-54b9b78abf67'),(2,2,9,'under 4 stars','under4Stars','end','2024-01-10 15:39:30','2024-01-10 15:39:30','2024-08-14 13:27:06','d529b83d-608f-4000-acf3-e477d4814032'),(3,3,15,'Productcategorieën','productcategorieen','end','2024-08-14 13:28:08','2024-08-14 13:28:08',NULL,'5a1d0dff-e9b9-4313-af3b-69517129c377');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'above-4-stars/{slug}','styles/_entry','2024-01-10 15:29:34','2024-01-10 15:29:34','7a6b88e4-0b67-4a96-b2fd-5111d4a31ff6'),(2,2,1,1,'under-4-stars/{slug}',NULL,'2024-01-10 15:39:30','2024-01-10 15:39:30','044af1ca-8791-4d18-8de8-e272370ad0c9'),(3,3,1,1,'productcategorieen/{slug}','productcategorieen/_category.twig','2024-08-14 13:28:08','2024-08-14 13:28:08','8336f309-7358-4625-bab4-d571e0367f10');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2024-01-10 09:56:40',0,1),(2,1,'slug','2024-01-10 09:54:45',0,1),(2,1,'title','2024-08-13 13:18:24',0,1),(2,1,'uri','2024-01-10 09:54:45',0,1),(7,1,'postDate','2024-01-10 12:05:44',0,1),(7,1,'slug','2024-01-10 12:03:53',0,1),(7,1,'title','2024-08-13 13:17:50',0,1),(7,1,'uri','2024-01-10 12:03:53',0,1),(16,1,'postDate','2024-01-10 12:33:42',0,1),(16,1,'slug','2024-01-10 12:33:12',0,1),(16,1,'title','2024-08-13 13:16:43',0,1),(16,1,'uri','2024-01-10 12:33:12',0,1),(18,1,'enabled','2024-08-15 13:43:36',0,1),(18,1,'postDate','2024-01-10 12:36:08',0,1),(18,1,'slug','2024-01-10 12:35:39',0,1),(18,1,'title','2024-08-13 12:56:51',0,1),(18,1,'uri','2024-01-10 12:35:39',0,1),(20,1,'enabled','2024-08-15 13:43:37',0,1),(20,1,'postDate','2024-01-10 12:36:44',0,1),(20,1,'slug','2024-01-10 12:36:24',0,1),(20,1,'title','2024-08-13 13:15:08',0,1),(20,1,'uri','2024-01-10 12:36:24',0,1),(22,1,'enabled','2024-08-15 13:43:37',0,1),(22,1,'postDate','2024-01-10 12:37:20',0,1),(22,1,'slug','2024-01-10 12:36:59',0,1),(22,1,'title','2024-08-13 12:55:47',0,1),(22,1,'uri','2024-01-10 12:36:59',0,1),(24,1,'postDate','2024-01-10 12:38:09',0,1),(24,1,'slug','2024-01-10 12:37:37',0,1),(24,1,'title','2024-08-13 11:42:23',0,1),(24,1,'uri','2024-01-10 12:37:37',0,1),(26,1,'enabled','2024-08-15 13:43:37',0,1),(26,1,'postDate','2024-01-10 12:38:44',0,1),(26,1,'slug','2024-01-10 12:38:24',0,1),(26,1,'title','2024-08-13 12:54:51',0,1),(26,1,'uri','2024-01-10 12:38:24',0,1),(50,1,'slug','2024-01-10 15:32:29',0,1),(50,1,'title','2024-01-10 15:32:30',0,1),(50,1,'uri','2024-01-10 15:32:30',0,1),(83,1,'postDate','2024-08-13 12:43:44',0,1),(83,1,'slug','2024-08-13 12:43:43',0,1),(83,1,'title','2024-08-13 12:43:43',0,1),(83,1,'uri','2024-08-13 12:43:43',0,1),(117,1,'enabled','2024-08-15 13:43:37',0,1),(127,1,'slug','2024-08-14 13:42:21',0,1),(127,1,'title','2024-08-14 13:42:21',0,1),(127,1,'uri','2024-08-14 13:42:21',0,1),(128,1,'slug','2024-08-14 13:42:57',0,1),(128,1,'title','2024-08-14 13:42:57',0,1),(128,1,'uri','2024-08-14 13:42:57',0,1),(129,1,'slug','2024-08-14 13:43:05',0,1),(129,1,'title','2024-08-14 13:43:05',0,1),(129,1,'uri','2024-08-14 13:43:05',0,1),(153,1,'authorId','2024-08-15 16:37:00',0,1),(153,1,'postDate','2024-08-15 13:29:00',0,1),(153,1,'slug','2024-08-15 13:29:00',0,1),(153,1,'title','2024-08-15 14:00:35',0,1),(153,1,'uri','2024-08-15 16:37:00',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,2,'2024-08-13 13:18:24',0,1),(2,1,9,'2024-08-13 13:18:24',0,1),(2,1,10,'2024-08-15 18:52:06',0,1),(2,1,22,'2024-08-14 13:53:39',0,1),(7,1,2,'2024-08-13 13:17:50',0,1),(7,1,9,'2024-08-13 13:17:50',0,1),(7,1,10,'2024-08-15 18:51:53',0,1),(7,1,22,'2024-08-14 13:53:29',0,1),(16,1,2,'2024-08-13 13:16:43',0,1),(16,1,9,'2024-08-13 13:16:43',0,1),(16,1,10,'2024-08-15 18:51:44',0,1),(16,1,22,'2024-08-14 13:53:20',0,1),(18,1,2,'2024-08-13 12:56:51',0,1),(18,1,9,'2024-08-13 12:56:51',0,1),(18,1,10,'2024-08-15 18:51:12',0,1),(18,1,22,'2024-08-14 13:53:02',0,1),(20,1,2,'2024-08-13 13:15:08',0,1),(20,1,9,'2024-08-13 13:15:08',0,1),(20,1,10,'2024-08-15 18:51:26',0,1),(20,1,22,'2024-08-14 13:53:12',0,1),(22,1,2,'2024-08-13 12:55:47',0,1),(22,1,9,'2024-08-13 12:55:47',0,1),(22,1,10,'2024-08-15 18:51:01',0,1),(22,1,22,'2024-08-14 13:52:52',0,1),(24,1,2,'2024-08-13 11:44:26',0,1),(24,1,9,'2024-08-13 11:42:23',0,1),(24,1,10,'2024-08-13 11:44:26',0,1),(26,1,2,'2024-08-13 12:54:51',0,1),(26,1,9,'2024-08-13 12:54:51',0,1),(26,1,10,'2024-08-15 18:50:30',0,1),(26,1,22,'2024-08-14 13:52:36',0,1),(54,1,10,'2024-01-10 19:01:09',0,1),(83,1,2,'2024-08-13 12:43:44',0,1),(83,1,9,'2024-08-13 12:43:38',0,1),(83,1,10,'2024-08-13 12:43:34',0,1),(117,1,10,'2024-08-15 18:50:49',0,1),(117,1,22,'2024-08-14 13:52:44',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2024-01-06 09:36:55','2024-01-06 09:36:55','b5480c88-6d5d-4fdd-b7da-f437d2037360',NULL,NULL,NULL,NULL,NULL),(2,2,1,'Poet Desk Bureau','2024-01-10 09:52:59','2024-08-15 18:52:06','be332d40-46b7-475a-bca8-c4810200cbdd',1499.00,'The Poet Desk by Nordic Tales was designed by Martin D. Christensen. It is an ode to classic handmade Scandinavian furniture with an emphasis on high-quality materials and attention to details.One of the designers wishes was to play with the construction and focus on the use of wedges. The wedges gave him the opportunity to create a sturdy and elegant desk without the use of nails, screws or glue. The wedges also make it possible to take the desk apart.',NULL,NULL,NULL),(3,3,1,'mojito','2024-01-10 09:56:40','2024-08-13 12:32:24','85f9e81a-fb8d-4698-9ca7-f1775bdbe3ec',4.00,'A Mojito is a classic Cuban cocktail known for its refreshing blend of fresh mint, lime, and white rum. Muddled mint and sugar, combined with lime wedges, create a sweet and tart base. The mixture is poured over ice, topped with club soda, and stirred for a cool and invigorating drink. Garnished with lime and mint, the Mojito is a visually appealing and timeless cocktail, perfect for warm weather or any occasion.',NULL,NULL,NULL),(4,4,1,'Mojito','2024-01-10 10:10:11','2024-01-10 10:10:11','79cc62fe-8897-4456-8e33-310b7a84b7fd',NULL,NULL,NULL,NULL,NULL),(6,6,1,'mojito','2024-01-10 10:14:19','2024-08-13 12:32:24','618ac9c0-4a47-4055-b5e5-a88f46c6d491',4.00,'A Mojito is a classic Cuban cocktail known for its refreshing blend of fresh mint, lime, and white rum. Muddled mint and sugar, combined with lime wedges, create a sweet and tart base. The mixture is poured over ice, topped with club soda, and stirred for a cool and invigorating drink. Garnished with lime and mint, the Mojito is a visually appealing and timeless cocktail, perfect for warm weather or any occasion.',NULL,NULL,NULL),(7,7,1,'Curiosity cupboard','2024-01-10 12:03:31','2024-08-15 18:51:53','3fb2197a-46ac-43f7-bb19-a88bd0f57ddd',2015.00,'Discover sustainable and functional designs from the Danish brand Menu. Uncomplicated, tactile design for a Scandinavian-inspired home that will make everyday life a little more beautiful.',NULL,NULL,NULL),(8,8,1,'Blue Lagoon','2024-01-10 12:04:42','2024-01-10 12:04:42','0ae2ff6d-4540-4501-8e3a-5f651c47c0aa',NULL,NULL,NULL,NULL,NULL),(9,9,1,'Caipirinha','2024-01-10 12:04:47','2024-01-10 12:04:47','4eaf5a71-d559-4429-8e4f-acdad3a8b62a',NULL,NULL,NULL,NULL,NULL),(10,10,1,'Bloody mary','2024-01-10 12:04:50','2024-01-10 12:04:50','b6aabc6f-7f77-45c2-9251-af659490a181',NULL,NULL,NULL,NULL,NULL),(11,11,1,'Cubalibre','2024-01-10 12:04:55','2024-01-10 12:04:55','d98e37a1-72ea-42b8-b07c-ba857b0000e8',NULL,NULL,NULL,NULL,NULL),(12,12,1,'Long island','2024-01-10 12:05:22','2024-01-10 12:05:22','c963a184-2bac-4fb2-82f9-6b875482aeaa',NULL,NULL,NULL,NULL,NULL),(13,13,1,'Tequilasunrise','2024-01-10 12:05:27','2024-01-10 12:05:27','0f7c556e-cea6-4b0e-9c79-032719df46f2',NULL,NULL,NULL,NULL,NULL),(14,14,1,'Sexonthebeach','2024-01-10 12:05:34','2024-01-10 12:05:34','3dfbc19d-e2ee-4027-9557-d41851857f18',NULL,NULL,NULL,NULL,NULL),(15,15,1,'Blue lagoon','2024-01-10 12:05:44','2024-08-13 12:32:24','f877a843-2ef6-4b35-9c14-01ca41fc45d5',3.00,'The Blue Lagoon is a vibrant tropical cocktail that captures attention with its stunning blue hue. This refreshing drink combines vodka and blue curaçao with a splash of lemon-lime soda over ice. With its visually striking appearance and a citrusy kick, the Blue Lagoon is a delightful and refreshing choice for those seeking a taste of the tropics. Garnish with an orange slice or a cherry for an extra touch of flair.',NULL,NULL,NULL),(16,16,1,'BOXIT 2-seater','2024-01-10 12:32:54','2024-08-15 18:51:43','e92ae6f2-8a0d-42e2-ad81-2ea82306936c',930.00,'The BOXIT sofas convince with their comfort, modularity, precision and fit best with your interior. The BOXIT design sofa with armrests looks modern and at the same time appears light and stable thanks to the curved legs. Thanks to optional corner elements, BOXIT products can be placed in any configuration.',NULL,NULL,NULL),(17,17,1,'Bloody mary','2024-01-10 12:33:42','2024-08-13 12:32:24','b62b22e1-f1df-4d0f-8795-4e5977067e9e',4.00,'The Bloody Mary is a classic cocktail known for its bold and savory profile. It combines vodka with tomato juice, lemon juice, hot sauce, Worcestershire sauce, salt, and black pepper. Shaken and poured over ice, it\'s garnished with a celery stalk and lemon wedge. Optional additions like a pickle spear or olives enhance its flavorful appeal, making it a popular choice, especially during brunch.',NULL,NULL,NULL),(18,18,1,'Bureau Noord Walnoot','2024-01-10 12:35:24','2024-08-15 18:51:12','904f0f29-b82a-4d09-a42e-625c26c53b35',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(19,19,1,'Long island','2024-01-10 12:36:08','2024-08-13 12:32:24','a5062fbe-a5f2-4a69-9ba7-8bd02f5e69a1',3.00,'The Long Island Iced Tea is a robust cocktail blending vodka, gin, rum, tequila, triple sec, lemon juice, and simple syrup. Shaken over ice, it\'s strained into a glass with fresh ice, topped with cola, and garnished with a lemon slice. Deceptively smooth, it carries a strong kick. Drink responsibly!',NULL,NULL,NULL),(20,20,1,'Stoel Mood 91','2024-01-10 12:36:11','2024-08-15 18:51:25','7414d9ae-bcf0-41eb-b41a-c08722b7a0c6',317.00,'The Moods chair has an extremely customizable concept. Depending on your interior or mood, the Moods model can be customized as desired. Chair with or without armrests, fixed or swiveling, on a metal or wooden base and in many different fabrics (plain or two-tone) or in (artificial) leather.',NULL,NULL,NULL),(21,21,1,'Tequila sunrise','2024-01-10 12:36:44','2024-08-13 12:32:24','622e1af8-5aa3-452e-9c1f-94b7b52555a6',3.00,'The Tequila Sunrise is a visually striking cocktail that mimics the colors of a sunrise. Mix 60 ml of tequila and 120 ml of orange juice in a glass with ice. Slowly pour 15 ml of grenadine for a gradient effect. Garnish with an orange slice and a cherry. Refreshing and visually appealing, it\'s a delightful choice for a burst of flavor. Cheers!',NULL,NULL,NULL),(22,22,1,'Vakkenkast 180470','2024-01-10 12:36:47','2024-08-15 18:51:01','1ccf22b0-d0bd-4d3a-8a6c-f59e08220576',1130.00,'Beautiful composition in our collection of hanging shelving units, finished in the color RAL 9003 and with three doors in birch plywood.The cabinet also has three different depths (25, 35 and 35 cm), making it a very attractive piece of furniture from a spatial perspective.',NULL,NULL,NULL),(23,23,1,'sex on the beach','2024-01-10 12:37:20','2024-08-13 12:32:24','1894f2a2-b75d-4147-afe8-484620e484d1',5.00,'Sex on the Beach is a fruity and tropical cocktail. Shake 45 ml vodka, 15 ml peach liqueur, 45 ml cranberry juice, and 45 ml orange juice with ice. Strain into a glass with ice and garnish with an orange slice and/or cherry. Enjoy the refreshing taste of this beach-inspired drink!',NULL,NULL,NULL),(24,24,1,'Leolux Caruzzo','2024-01-10 12:37:22','2024-08-13 12:32:43','94d78872-b16c-4651-9d80-24aa5fadac20',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(25,25,1,'Cuba libre','2024-01-10 12:38:09','2024-08-13 12:32:25','473eb195-0ca4-4ed1-af5f-d5f89f495d72',4.00,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(26,26,1,'Rolf Benz 684 fauteuil','2024-01-10 12:38:13','2024-08-15 18:50:30','c62015c7-cc48-4387-ae16-af8ae2808740',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(27,27,1,'Caipirinha','2024-01-10 12:38:44','2024-08-13 12:32:25','1785d7ca-c3b5-459c-a246-41c057eea826',4.00,'The Caipirinha, a refreshing Brazilian cocktail, combines 60 ml of cachaça with lime wedges and 2 teaspoons of sugar. Muddle the limes, add ice, and stir gently for a delightful blend of flavors. Enjoy the crisp taste of Brazil!',NULL,NULL,NULL),(28,28,1,'Cuba libre','2024-01-10 12:39:53','2024-08-13 12:32:25','ef673bf4-2e75-4fc0-bb96-01d6ca377d9c',4.00,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(30,30,1,'Caipirinha','2024-01-10 12:40:05','2024-08-13 12:32:25','ddb0d80c-3b13-4f60-b664-a59ea000b39f',4.00,'The Caipirinha, a refreshing Brazilian cocktail, combines 60 ml of cachaça with lime wedges and 2 teaspoons of sugar. Muddle the limes, add ice, and stir gently for a delightful blend of flavors. Enjoy the crisp taste of Brazil!',NULL,NULL,NULL),(31,31,1,'sex on the beach','2024-01-10 12:40:09','2024-08-13 12:32:25','4c2e12f5-67b4-423c-a866-f47679453213',5.00,'Sex on the Beach is a fruity and tropical cocktail. Shake 45 ml vodka, 15 ml peach liqueur, 45 ml cranberry juice, and 45 ml orange juice with ice. Strain into a glass with ice and garnish with an orange slice and/or cherry. Enjoy the refreshing taste of this beach-inspired drink!',NULL,NULL,NULL),(32,32,1,'Long island','2024-01-10 12:40:12','2024-08-13 12:32:25','350066f1-aba0-4172-8e48-6aa1c8695fbd',3.00,'The Long Island Iced Tea is a robust cocktail blending vodka, gin, rum, tequila, triple sec, lemon juice, and simple syrup. Shaken over ice, it\'s strained into a glass with fresh ice, topped with cola, and garnished with a lemon slice. Deceptively smooth, it carries a strong kick. Drink responsibly!',NULL,NULL,NULL),(33,33,1,'Tequila sunrise','2024-01-10 12:40:15','2024-08-13 12:32:25','137d75da-3e92-4ea7-b8c4-e0aeded65084',3.00,'The Tequila Sunrise is a visually striking cocktail that mimics the colors of a sunrise. Mix 60 ml of tequila and 120 ml of orange juice in a glass with ice. Slowly pour 15 ml of grenadine for a gradient effect. Garnish with an orange slice and a cherry. Refreshing and visually appealing, it\'s a delightful choice for a burst of flavor. Cheers!',NULL,NULL,NULL),(34,34,1,'Bloody mary','2024-01-10 12:40:19','2024-08-13 12:32:25','38b36965-2fdb-4eb2-9eef-48b162094248',4.00,'The Bloody Mary is a classic cocktail known for its bold and savory profile. It combines vodka with tomato juice, lemon juice, hot sauce, Worcestershire sauce, salt, and black pepper. Shaken and poured over ice, it\'s garnished with a celery stalk and lemon wedge. Optional additions like a pickle spear or olives enhance its flavorful appeal, making it a popular choice, especially during brunch.',NULL,NULL,NULL),(35,35,1,'Blue lagoon','2024-01-10 12:40:22','2024-08-13 12:32:25','b76c95c2-3b1a-4a13-87f2-6885535de54c',3.00,'The Blue Lagoon is a vibrant tropical cocktail that captures attention with its stunning blue hue. This refreshing drink combines vodka and blue curaçao with a splash of lemon-lime soda over ice. With its visually striking appearance and a citrusy kick, the Blue Lagoon is a delightful and refreshing choice for those seeking a taste of the tropics. Garnish with an orange slice or a cherry for an extra touch of flair.',NULL,NULL,NULL),(36,36,1,'mojito','2024-01-10 12:40:26','2024-08-13 12:32:25','b1b41138-17de-4656-893e-787af64a87cc',4.00,'A Mojito is a classic Cuban cocktail known for its refreshing blend of fresh mint, lime, and white rum. Muddled mint and sugar, combined with lime wedges, create a sweet and tart base. The mixture is poured over ice, topped with club soda, and stirred for a cool and invigorating drink. Garnished with lime and mint, the Mojito is a visually appealing and timeless cocktail, perfect for warm weather or any occasion.',NULL,NULL,NULL),(37,37,1,'Cuba libre','2024-01-10 12:40:55','2024-08-13 12:32:25','e352972a-df73-4fc1-8292-9866030f9124',4.00,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(38,38,1,'Caipirinha','2024-01-10 12:41:02','2024-08-13 12:32:25','262c23e9-4abf-4ad1-a8f6-f76234b61ae0',4.00,'The Caipirinha, a refreshing Brazilian cocktail, combines 60 ml of cachaça with lime wedges and 2 teaspoons of sugar. Muddle the limes, add ice, and stir gently for a delightful blend of flavors. Enjoy the crisp taste of Brazil!',NULL,NULL,NULL),(39,39,1,'Long island','2024-01-10 12:41:07','2024-08-13 12:32:25','b7eb28b1-ec7f-4941-8ce8-a89451bbb299',3.00,'The Long Island Iced Tea is a robust cocktail blending vodka, gin, rum, tequila, triple sec, lemon juice, and simple syrup. Shaken over ice, it\'s strained into a glass with fresh ice, topped with cola, and garnished with a lemon slice. Deceptively smooth, it carries a strong kick. Drink responsibly!',NULL,NULL,NULL),(41,41,1,'Cuba libre','2024-01-10 12:41:17','2024-08-13 12:32:25','a940611a-1cf0-4676-a9bd-78cea4a59988',42.00,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(43,43,1,'Cuba libre','2024-01-10 12:41:49','2024-08-13 12:32:25','5820b4b8-bb8b-42be-beb7-76f7cc5c1805',4.00,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(46,46,1,'Cuba libre','2024-01-10 14:14:05','2024-08-13 12:32:25','5549e170-1fc4-45df-8cf9-9fea13025fd6',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(47,47,1,'search','2024-01-10 14:50:54','2024-01-10 14:50:54','c097dbbe-4d0b-4157-942a-094961632a3b',NULL,NULL,NULL,NULL,NULL),(48,48,1,'search','2024-01-10 14:50:54','2024-01-10 14:50:54','fea96825-7ecf-4906-bac6-b0680689c8ff',NULL,NULL,NULL,NULL,NULL),(49,49,1,'search','2024-01-10 14:50:54','2024-01-10 14:50:54','1f152317-bf7c-4763-aa52-aa03b9e3b8d4',NULL,NULL,NULL,NULL,NULL),(50,50,1,'Above 4 stars','2024-01-10 15:32:04','2024-01-10 15:32:46','400459ea-3014-4f89-9ba6-cba9721305f3',NULL,NULL,NULL,NULL,NULL),(52,52,1,'Cuba libre','2024-01-10 15:37:00','2024-08-13 12:32:25','31a4b6ea-4ac9-4a31-85d8-8ea91897e6c4',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(54,54,1,'header','2024-01-10 18:59:34','2024-01-10 19:01:09','c19e07e4-c7b5-4070-8a5c-88a0fd566c7b',NULL,NULL,NULL,NULL,NULL),(55,55,1,'header','2024-01-10 18:59:34','2024-01-10 18:59:34','1f656574-b776-4bef-a572-a96d95d16855',NULL,NULL,NULL,NULL,NULL),(56,56,1,'header','2024-01-10 18:59:34','2024-01-10 18:59:34','7d963a3f-d7f0-4482-b256-ff9ab021731e',NULL,NULL,NULL,NULL,NULL),(57,57,1,'header','2024-01-10 19:00:17','2024-01-10 19:00:17','a615d276-4cea-4c9b-b66d-498873bde897',NULL,NULL,NULL,NULL,NULL),(58,58,1,'Alcohol Drinks','2024-01-10 19:01:00','2024-01-10 19:01:00','0a43fbf6-0978-4887-b282-8c862256f36d',NULL,NULL,NULL,NULL,NULL),(60,60,1,'header','2024-01-10 19:01:09','2024-01-10 19:01:09','d2efb15c-32cb-4143-a8a0-8cd89248a03e',NULL,NULL,NULL,NULL,NULL),(62,62,1,'Caipirinha','2024-01-10 19:31:00','2024-08-13 12:32:25','95e6321e-a3f7-4ffd-a6e6-6567cb30adb8',4.20,'The Caipirinha, a refreshing Brazilian cocktail, combines 60 ml of cachaça with lime wedges and 2 teaspoons of sugar. Muddle the limes, add ice, and stir gently for a delightful blend of flavors. Enjoy the crisp taste of Brazil!',NULL,NULL,NULL),(63,63,1,'sex on the beach','2024-01-10 19:31:05','2024-08-13 12:32:25','9fa4679b-6d6c-43eb-998c-eec4d9415a49',5.00,'Sex on the Beach is a fruity and tropical cocktail. Shake 45 ml vodka, 15 ml peach liqueur, 45 ml cranberry juice, and 45 ml orange juice with ice. Strain into a glass with ice and garnish with an orange slice and/or cherry. Enjoy the refreshing taste of this beach-inspired drink!',NULL,NULL,NULL),(65,65,1,'Long island','2024-01-10 19:31:14','2024-08-13 12:32:26','6ad037f9-23e2-40c3-9631-17b7df2c7dd5',3.80,'The Long Island Iced Tea is a robust cocktail blending vodka, gin, rum, tequila, triple sec, lemon juice, and simple syrup. Shaken over ice, it\'s strained into a glass with fresh ice, topped with cola, and garnished with a lemon slice. Deceptively smooth, it carries a strong kick. Drink responsibly!',NULL,NULL,NULL),(67,67,1,'Bloody mary','2024-01-10 19:31:22','2024-08-13 12:32:26','0d3185ee-ea9a-46d7-8676-1414a265ee89',4.10,'The Bloody Mary is a classic cocktail known for its bold and savory profile. It combines vodka with tomato juice, lemon juice, hot sauce, Worcestershire sauce, salt, and black pepper. Shaken and poured over ice, it\'s garnished with a celery stalk and lemon wedge. Optional additions like a pickle spear or olives enhance its flavorful appeal, making it a popular choice, especially during brunch.',NULL,NULL,NULL),(69,69,1,'Blue lagoon','2024-01-10 19:31:35','2024-08-13 12:32:26','6cca2043-62a2-4298-8ead-8bc26190079b',3.60,'The Blue Lagoon is a vibrant tropical cocktail that captures attention with its stunning blue hue. This refreshing drink combines vodka and blue curaçao with a splash of lemon-lime soda over ice. With its visually striking appearance and a citrusy kick, the Blue Lagoon is a delightful and refreshing choice for those seeking a taste of the tropics. Garnish with an orange slice or a cherry for an extra touch of flair.',NULL,NULL,NULL),(71,71,1,'mojito','2024-01-10 19:31:42','2024-08-13 12:32:26','c3e37873-dd6d-4c96-aaf0-759d68b9cea3',4.70,'A Mojito is a classic Cuban cocktail known for its refreshing blend of fresh mint, lime, and white rum. Muddled mint and sugar, combined with lime wedges, create a sweet and tart base. The mixture is poured over ice, topped with club soda, and stirred for a cool and invigorating drink. Garnished with lime and mint, the Mojito is a visually appealing and timeless cocktail, perfect for warm weather or any occasion.',NULL,NULL,NULL),(72,72,1,'Cuba libre 2','2024-01-11 14:53:03','2024-08-13 12:32:26','11a88771-38ea-42a1-9c8f-04db1697b2b8',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(74,74,1,'Cuba libre','2024-01-11 14:53:17','2024-08-13 12:32:26','d9f795e7-f90c-4861-9307-084dc095b9d8',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(76,76,1,'Cuba libre 2','2024-01-11 14:55:53','2024-08-13 12:32:26','d14acb88-3166-4f9d-8880-292ec3e4f8c3',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(78,78,1,'Cuba libre','2024-01-11 14:56:07','2024-08-13 12:32:26','9a4f4290-ee71-42f2-ba52-5c0c58e58370',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(80,80,1,'Cuba libre 2','2024-01-11 15:38:51','2024-08-13 12:32:26','b51141d2-8982-494e-8083-e575af566e29',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(82,82,1,'Cuba libre','2024-01-11 15:39:15','2024-08-13 12:32:26','572c55e5-1d71-45ee-8e58-5ae25ab2d5f1',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(83,83,1,'vakken','2024-01-15 12:23:53','2024-08-13 12:43:44','a61db3a3-fcca-437b-a498-bef052a74f70',200.00,'vakkenkast',NULL,NULL,NULL),(84,84,1,'Cuba libre','2024-08-13 10:04:16','2024-08-13 12:32:26','21787610-151a-40f1-af50-225629ff1d22',4.50,'The Cuba Libre is a refreshing cocktail that combines 50 ml of white rum with cola over ice. Gently stir and garnish with a lime wedge. This classic drink is known for its simplicity and tropical appeal, making it a timeless and invigorating choice. Cheers!',NULL,NULL,NULL),(86,86,1,'Leolux Caruzzo','2024-08-13 11:42:23','2024-08-13 12:32:26','bf12f37c-10e2-4759-ab62-bf13c32cd18d',4.50,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(87,87,1,'Benz','2024-08-13 11:42:58','2024-08-13 11:42:58','d47a0646-1b3c-448e-a9ed-85a4cee90133',NULL,NULL,NULL,NULL,NULL),(88,88,1,'Bureau','2024-08-13 11:42:58','2024-08-13 11:42:58','0c6524fd-17bc-42e3-9d8b-abfe359895f6',NULL,NULL,NULL,NULL,NULL),(89,89,1,'Bureau2','2024-08-13 11:43:00','2024-08-13 11:43:00','9284b416-48c3-48c8-86cb-08352e637582',NULL,NULL,NULL,NULL,NULL),(90,90,1,'Geel','2024-08-13 11:43:00','2024-08-13 11:43:00','e23253e5-08a0-4c5f-9d54-3151497a26fb',NULL,NULL,NULL,NULL,NULL),(91,91,1,'Kast','2024-08-13 11:43:01','2024-08-13 11:43:01','50827433-1d1a-4bf1-9da3-bde48e560611',NULL,NULL,NULL,NULL,NULL),(92,92,1,'Leolux Caruzzo 1 600x450 jpg','2024-08-13 11:43:02','2024-08-13 11:43:02','9148ea53-f18e-4a10-bdde-ed734130e704',NULL,NULL,NULL,NULL,NULL),(93,93,1,'Mood','2024-08-13 11:43:03','2024-08-13 11:43:03','e0f5c218-8982-44b0-aca5-6ac0a9cd6c3f',NULL,NULL,NULL,NULL,NULL),(94,94,1,'Rb684 005 600x450 jpg','2024-08-13 11:43:04','2024-08-13 11:43:04','68d4e255-eee0-422c-8b1f-2975d9f30877',NULL,NULL,NULL,NULL,NULL),(95,95,1,'Sofa2','2024-08-13 11:43:05','2024-08-13 11:43:05','79b3ead6-23a3-4beb-9cb0-9265df749d3b',NULL,NULL,NULL,NULL,NULL),(96,96,1,'Sofas','2024-08-13 11:43:08','2024-08-13 11:43:08','ff7fc174-57de-4d26-a89e-cc97f73356a7',NULL,NULL,NULL,NULL,NULL),(97,97,1,'Vakkenkast','2024-08-13 11:43:08','2024-08-13 11:43:08','faada544-3469-468a-879f-990f36149107',NULL,NULL,NULL,NULL,NULL),(99,99,1,'Leolux Caruzzo','2024-08-13 11:44:25','2024-08-13 12:32:26','d3fc43bf-15e6-47dd-b5db-228954aa39a4',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(100,100,1,'vakken','2024-08-13 12:43:45','2024-08-13 12:43:45','5a6123dc-6ea4-43a2-8500-ea6dee453bce',200.00,'vakkenkast',NULL,NULL,NULL),(102,102,1,'Rolf Benz 684 fauteuil','2024-08-13 12:54:51','2024-08-13 12:54:51','93b6f99e-12f8-40fe-8747-16579faa376a',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(104,104,1,'Vakkenkast 180470','2024-08-13 12:55:46','2024-08-13 12:55:46','2ad4d64d-622e-4e5d-a04f-b17101044aa3',1130.00,'Beautiful composition in our collection of hanging shelving units, finished in the color RAL 9003 and with three doors in birch plywood.The cabinet also has three different depths (25, 35 and 35 cm), making it a very attractive piece of furniture from a spatial perspective.',NULL,NULL,NULL),(106,106,1,'Bureau Noord Walnoot','2024-08-13 12:56:51','2024-08-13 12:56:51','13c5d7fb-86e8-4abf-9d09-cb6408659e0b',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(107,107,1,'Tequila sunrise','2024-08-13 13:06:39','2024-08-13 13:06:39','9edcdc78-9cd5-4774-abca-9f064a9167f6',3.00,'The Tequila Sunrise is a visually striking cocktail that mimics the colors of a sunrise. Mix 60 ml of tequila and 120 ml of orange juice in a glass with ice. Slowly pour 15 ml of grenadine for a gradient effect. Garnish with an orange slice and a cherry. Refreshing and visually appealing, it\'s a delightful choice for a burst of flavor. Cheers!',NULL,NULL,NULL),(108,108,1,'Bureau Noord Walnoot','2024-08-13 13:14:28','2024-08-13 13:14:28','1cb36747-2a16-448e-9ec2-f7f9d02f0cc5',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(110,110,1,'Stoel Mood 91','2024-08-13 13:15:08','2024-08-13 13:15:08','1db081be-a563-4db7-a72a-02cc8ec373ce',317.00,'The Moods chair has an extremely customizable concept. Depending on your interior or mood, the Moods model can be customized as desired. Chair with or without armrests, fixed or swiveling, on a metal or wooden base and in many different fabrics (plain or two-tone) or in (artificial) leather.',NULL,NULL,NULL),(112,112,1,'BOXIT 2-seater','2024-08-13 13:16:42','2024-08-13 13:16:42','d29ad68d-2169-4efe-bf49-a51fa922a687',930.00,'The BOXIT sofas convince with their comfort, modularity, precision and fit best with your interior. The BOXIT design sofa with armrests looks modern and at the same time appears light and stable thanks to the curved legs. Thanks to optional corner elements, BOXIT products can be placed in any configuration.',NULL,NULL,NULL),(114,114,1,'Curiosity cupboard','2024-08-13 13:17:50','2024-08-13 13:17:50','051cec98-61cd-42ab-906c-8ad476ce66b3',2015.00,'Discover sustainable and functional designs from the Danish brand Menu. Uncomplicated, tactile design for a Scandinavian-inspired home that will make everyday life a little more beautiful.',NULL,NULL,NULL),(116,116,1,'Poet Desk Bureau','2024-08-13 13:18:24','2024-08-13 13:18:24','e49ba088-63cf-4094-97eb-2a9133ba5b23',1499.00,'The Poet Desk by Nordic Tales was designed by Martin D. Christensen. It is an ode to classic handmade Scandinavian furniture with an emphasis on high-quality materials and attention to details.One of the designers wishes was to play with the construction and focus on the use of wedges. The wedges gave him the opportunity to create a sturdy and elegant desk without the use of nails, screws or glue. The wedges also make it possible to take the desk apart.',NULL,NULL,NULL),(117,117,1,'Leolux Caruzzo','2024-08-14 09:37:47','2024-08-15 18:50:49','a3f0cf77-96cf-48ef-b718-c328344db87d',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(118,118,1,'Leolux Caruzzo','2024-08-14 09:37:47','2024-08-14 09:37:47','2fc49773-3bd7-4297-845e-5fb5fcb94a29',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(119,119,1,NULL,'2024-08-14 11:24:01','2024-08-14 13:04:30','1235d79e-c69f-40fd-84b5-0c0266f7d849',NULL,NULL,'#007bff','#ffffff','#000000'),(120,120,1,NULL,'2024-08-14 13:31:15','2024-08-14 13:31:15','9fb92369-fd97-4bdd-8bec-c437f5322f5f',NULL,NULL,NULL,NULL,NULL),(121,121,1,'Rolf Benz 684 fauteuil','2024-08-14 13:31:25','2024-08-14 13:31:25','52ca4bfa-01c5-4211-94d7-88bb29041b48',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(122,122,1,'Rolf Benz 684 fauteuil','2024-08-14 13:32:38','2024-08-14 13:32:38','8b042420-6424-413c-81a9-0e23515dc116',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(123,123,1,NULL,'2024-08-14 13:40:52','2024-08-14 13:40:52','e489378c-ab8f-4a89-876a-efb4c38d1f51',NULL,NULL,NULL,NULL,NULL),(124,124,1,NULL,'2024-08-14 13:40:58','2024-08-14 13:40:58','388c3d78-296e-4bb6-a9c0-ec5d0ecd229b',NULL,NULL,NULL,NULL,NULL),(125,125,1,'Rolf Benz 684 fauteuil','2024-08-14 13:41:35','2024-08-14 13:41:35','6a183c2f-e87a-4b6f-95fa-7f6812b3dac1',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(126,126,1,NULL,'2024-08-14 13:41:44','2024-08-14 13:41:44','f2a06615-02a5-464b-aa1d-2aaca625d0de',NULL,NULL,NULL,NULL,NULL),(127,127,1,'kasten','2024-08-14 13:42:17','2024-08-14 14:45:12','f4034076-147d-4924-859d-a8b254398bf4',NULL,NULL,NULL,NULL,NULL),(128,128,1,'stoelen','2024-08-14 13:42:52','2024-08-14 13:42:57','0d6eac5c-23fb-424c-aed2-16906cd37472',NULL,NULL,NULL,NULL,NULL),(129,129,1,'tafels','2024-08-14 13:43:01','2024-08-14 13:43:05','2c023b41-3a04-49d8-be8e-fab36f8ea6bb',NULL,NULL,NULL,NULL,NULL),(130,130,1,'Rolf Benz 684 fauteuil','2024-08-14 13:43:21','2024-08-14 13:43:21','789623c4-47e8-47de-b706-84adf828edb4',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(131,131,1,'Leolux Caruzzo','2024-08-14 13:44:51','2024-08-14 13:44:51','963bda16-43b2-4e7f-a266-49702d0661a9',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(132,132,1,'Rolf Benz 684 fauteuil','2024-08-14 13:45:18','2024-08-14 13:45:18','6e415d60-efbf-47fa-8b7b-b4fcb42d2eda',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(133,133,1,'Leolux Caruzzo','2024-08-14 13:47:57','2024-08-14 13:47:57','46dc9a49-cd6c-48fa-9286-344895eeaa00',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(134,134,1,NULL,'2024-08-14 13:49:13','2024-08-14 13:49:13','425ea883-3292-4c70-a741-38c63a5c0d39',NULL,NULL,NULL,NULL,NULL),(135,135,1,'Rolf Benz 684 fauteuil','2024-08-14 13:51:24','2024-08-14 13:51:24','92d974ac-4ce9-4f59-857c-6a2845bb01ec',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(137,137,1,'Rolf Benz 684 fauteuil','2024-08-14 13:52:36','2024-08-14 13:52:36','db727cab-ac37-4171-8964-0d85436d48a6',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(139,139,1,'Leolux Caruzzo','2024-08-14 13:52:44','2024-08-14 13:52:44','1c3f5573-f65a-49be-9186-067b21b95401',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(141,141,1,'Vakkenkast 180470','2024-08-14 13:52:52','2024-08-14 13:52:52','3ace6a11-ee4b-41d4-8be6-13d28768c912',1130.00,'Beautiful composition in our collection of hanging shelving units, finished in the color RAL 9003 and with three doors in birch plywood.The cabinet also has three different depths (25, 35 and 35 cm), making it a very attractive piece of furniture from a spatial perspective.',NULL,NULL,NULL),(143,143,1,'Bureau Noord Walnoot','2024-08-14 13:53:02','2024-08-14 13:53:02','e90c2d73-d6aa-4068-9a7b-ee459702d624',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(145,145,1,'Stoel Mood 91','2024-08-14 13:53:12','2024-08-14 13:53:12','58e9e0af-a00d-4148-918c-aeb1e6ea2701',317.00,'The Moods chair has an extremely customizable concept. Depending on your interior or mood, the Moods model can be customized as desired. Chair with or without armrests, fixed or swiveling, on a metal or wooden base and in many different fabrics (plain or two-tone) or in (artificial) leather.',NULL,NULL,NULL),(147,147,1,'BOXIT 2-seater','2024-08-14 13:53:20','2024-08-14 13:53:20','ed8a1ae5-68db-479b-bd21-175f30056ae8',930.00,'The BOXIT sofas convince with their comfort, modularity, precision and fit best with your interior. The BOXIT design sofa with armrests looks modern and at the same time appears light and stable thanks to the curved legs. Thanks to optional corner elements, BOXIT products can be placed in any configuration.',NULL,NULL,NULL),(149,149,1,'Curiosity cupboard','2024-08-14 13:53:29','2024-08-14 13:53:29','9016824e-350e-47f9-b884-b9cd660fcb89',2015.00,'Discover sustainable and functional designs from the Danish brand Menu. Uncomplicated, tactile design for a Scandinavian-inspired home that will make everyday life a little more beautiful.',NULL,NULL,NULL),(151,151,1,'Poet Desk Bureau','2024-08-14 13:53:39','2024-08-14 13:53:39','28a10159-727e-4795-9d45-28313b2e66ab',1499.00,'The Poet Desk by Nordic Tales was designed by Martin D. Christensen. It is an ode to classic handmade Scandinavian furniture with an emphasis on high-quality materials and attention to details.One of the designers wishes was to play with the construction and focus on the use of wedges. The wedges gave him the opportunity to create a sturdy and elegant desk without the use of nails, screws or glue. The wedges also make it possible to take the desk apart.',NULL,NULL,NULL),(152,152,1,'Rolf Benz 684 fauteuil','2024-08-14 14:38:25','2024-08-14 14:38:25','75d7d415-f4de-447c-a3fc-6f45ee4b98c6',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(153,153,1,'Furniture.','2024-08-15 13:28:49','2024-08-15 16:37:01','4cf14f70-c45b-489c-8ed7-2061c45ae947',NULL,NULL,NULL,NULL,NULL),(154,154,1,'Furniture','2024-08-15 13:29:01','2024-08-15 16:37:01','3496530f-ee8a-498c-901f-1629502e3bc5',NULL,NULL,NULL,NULL,NULL),(155,155,1,'Bureau Noord Walnoot','2024-08-15 13:43:16','2024-08-15 13:43:16','58334f9b-72e0-4659-bdb7-55cb35f279df',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(156,156,1,'Stoel Mood 91','2024-08-15 13:43:16','2024-08-15 13:43:16','0e47db63-2def-4b3c-8832-eae292c2ebe5',317.00,'The Moods chair has an extremely customizable concept. Depending on your interior or mood, the Moods model can be customized as desired. Chair with or without armrests, fixed or swiveling, on a metal or wooden base and in many different fabrics (plain or two-tone) or in (artificial) leather.',NULL,NULL,NULL),(157,157,1,'Vakkenkast 180470','2024-08-15 13:43:17','2024-08-15 13:43:17','af37068a-a750-4217-9ebf-cdb3251e3e5a',1130.00,'Beautiful composition in our collection of hanging shelving units, finished in the color RAL 9003 and with three doors in birch plywood.The cabinet also has three different depths (25, 35 and 35 cm), making it a very attractive piece of furniture from a spatial perspective.',NULL,NULL,NULL),(158,158,1,'Rolf Benz 684 fauteuil','2024-08-15 13:43:17','2024-08-15 13:43:17','01cef07d-ca9c-42ed-b087-f26af217efce',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(159,159,1,'Leolux Caruzzo','2024-08-15 13:43:17','2024-08-15 13:43:17','34ef5a03-a3c2-4c47-aa85-49beb3c37301',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(160,160,1,'Bureau Noord Walnoot','2024-08-15 13:43:36','2024-08-15 13:43:36','e2dbc833-e76d-4fbd-8ba9-156f27f125b8',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(161,161,1,'Stoel Mood 91','2024-08-15 13:43:37','2024-08-15 13:43:37','fe43acf4-9db6-4d76-8a54-6a4e6f87979b',317.00,'The Moods chair has an extremely customizable concept. Depending on your interior or mood, the Moods model can be customized as desired. Chair with or without armrests, fixed or swiveling, on a metal or wooden base and in many different fabrics (plain or two-tone) or in (artificial) leather.',NULL,NULL,NULL),(162,162,1,'Vakkenkast 180470','2024-08-15 13:43:37','2024-08-15 13:43:37','07a73ae8-b64b-4a80-a9f8-cb49796a0b96',1130.00,'Beautiful composition in our collection of hanging shelving units, finished in the color RAL 9003 and with three doors in birch plywood.The cabinet also has three different depths (25, 35 and 35 cm), making it a very attractive piece of furniture from a spatial perspective.',NULL,NULL,NULL),(163,163,1,'Rolf Benz 684 fauteuil','2024-08-15 13:43:37','2024-08-15 13:43:37','768886b8-0750-4797-9d14-37941d10a3e7',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(164,164,1,'Leolux Caruzzo','2024-08-15 13:43:37','2024-08-15 13:43:37','f257ea6f-66bc-4bc7-9396-766f6d3aef43',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(166,166,1,'Furniture.','2024-08-15 14:00:35','2024-08-15 16:37:01','983e0ba7-3881-4e78-9a5b-515107496090',NULL,NULL,NULL,NULL,NULL),(167,167,1,'Furniture.','2024-08-15 16:37:00','2024-08-15 16:37:01','2b377e48-8a29-4792-8323-cf066f7f666c',NULL,NULL,NULL,NULL,NULL),(169,169,1,'Benz','2024-08-15 18:48:41','2024-08-15 18:48:41','2c830201-c116-4427-84fd-95050d374dcf',NULL,NULL,NULL,NULL,NULL),(170,170,1,'Rolf Benz 684 fauteuil','2024-08-15 18:48:45','2024-08-15 18:48:45','e417a926-abf0-49ee-8f5e-38b84fdfb094',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(172,172,1,'Benz','2024-08-15 18:50:28','2024-08-15 18:50:28','ab14ef3b-a8c6-4522-b1af-872ba297c990',NULL,NULL,NULL,NULL,NULL),(173,173,1,'Rolf Benz 684 fauteuil','2024-08-15 18:50:30','2024-08-15 18:50:30','1328c2a6-e6a0-4c9c-be20-971da89095d7',1229.00,'The Rolf Benz 684 is a distinctly compact armchair. This armchair is an ideal side armchair because of its unique design it always has a beautiful appearance. The 684 stands on a swivel base and is also available with a comfortable footstool.',NULL,NULL,NULL),(175,175,1,'Geel','2024-08-15 18:50:47','2024-08-15 18:50:47','d0f15df3-cfce-4b58-af40-a19e3175e6de',NULL,NULL,NULL,NULL,NULL),(176,176,1,'Leolux Caruzzo','2024-08-15 18:50:49','2024-08-15 18:50:49','24343ec8-7161-479e-a3cc-d93735541310',3025.00,'The Leolux Caruzzo is a top-class wing chair. A lot of attention has been paid to the design and seating comfort. Thanks to the high curved backrest, the armchair closes you off from your surroundings, allowing you the ultimate in relaxation. In addition, this designer armchair is also a classic addition to your interior.',NULL,NULL,NULL),(178,178,1,'Vakkenkast','2024-08-15 18:50:59','2024-08-15 18:50:59','674b94e1-6153-491e-8df8-ae87f12d9a8a',NULL,NULL,NULL,NULL,NULL),(179,179,1,'Vakkenkast 180470','2024-08-15 18:51:01','2024-08-15 18:51:01','7da4d702-231f-45be-b1de-aecfff0d02f3',1130.00,'Beautiful composition in our collection of hanging shelving units, finished in the color RAL 9003 and with three doors in birch plywood.The cabinet also has three different depths (25, 35 and 35 cm), making it a very attractive piece of furniture from a spatial perspective.',NULL,NULL,NULL),(181,181,1,'Bureau','2024-08-15 18:51:10','2024-08-15 18:51:10','b857cba4-dd5a-4a6a-900b-aa87712c131c',NULL,NULL,NULL,NULL,NULL),(182,182,1,'Bureau Noord Walnoot','2024-08-15 18:51:12','2024-08-15 18:51:12','a1877453-a1f8-4ed8-b90f-301a8119b722',1462.82,'Inspired by Designer Editions Nord Desk, this Scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional, practical and stylish looks. Complete with shelf space for easy storage and access to your documents and papers.',NULL,NULL,NULL),(184,184,1,'Mood','2024-08-15 18:51:23','2024-08-15 18:51:23','bfd6de35-e753-4206-9dd0-7dd1598def5e',NULL,NULL,NULL,NULL,NULL),(185,185,1,'Stoel Mood 91','2024-08-15 18:51:25','2024-08-15 18:51:25','4c622148-778c-4060-b49d-b638fdfef1a5',317.00,'The Moods chair has an extremely customizable concept. Depending on your interior or mood, the Moods model can be customized as desired. Chair with or without armrests, fixed or swiveling, on a metal or wooden base and in many different fabrics (plain or two-tone) or in (artificial) leather.',NULL,NULL,NULL),(187,187,1,'Sofa2','2024-08-15 18:51:34','2024-08-15 18:51:34','03e4e806-db8e-482d-bb6a-da16e1767aae',NULL,NULL,NULL,NULL,NULL),(188,188,1,'BOXIT 2-seater','2024-08-15 18:51:43','2024-08-15 18:51:43','a4f5cb2f-3098-4c09-9cf2-e1c7e1f7f5b1',930.00,'The BOXIT sofas convince with their comfort, modularity, precision and fit best with your interior. The BOXIT design sofa with armrests looks modern and at the same time appears light and stable thanks to the curved legs. Thanks to optional corner elements, BOXIT products can be placed in any configuration.',NULL,NULL,NULL),(190,190,1,'Kast','2024-08-15 18:51:51','2024-08-15 18:51:51','cf39f461-94cf-419d-9d49-0267fbc46b57',NULL,NULL,NULL,NULL,NULL),(191,191,1,'Curiosity cupboard','2024-08-15 18:51:53','2024-08-15 18:51:53','1b1ff371-eb4b-436a-a49e-46e9538e75f0',2015.00,'Discover sustainable and functional designs from the Danish brand Menu. Uncomplicated, tactile design for a Scandinavian-inspired home that will make everyday life a little more beautiful.',NULL,NULL,NULL),(193,193,1,'Bureau2','2024-08-15 18:52:04','2024-08-15 18:52:04','c227ddd7-1578-4ea0-8069-8f6709d9a0b5',NULL,NULL,NULL,NULL,NULL),(194,194,1,'Poet Desk Bureau','2024-08-15 18:52:06','2024-08-15 18:52:06','ef394e55-6dbb-4a8c-a393-d0cd75712f7a',1499.00,'The Poet Desk by Nordic Tales was designed by Martin D. Christensen. It is an ode to classic handmade Scandinavian furniture with an emphasis on high-quality materials and attention to details.One of the designers wishes was to play with the construction and focus on the use of wedges. The wedges gave him the opportunity to create a sturdy and elegant desk without the use of nails, screws or glue. The wedges also make it possible to take the desk apart.',NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (39,NULL,1,0,'First draft',NULL,0,NULL,0),(40,NULL,1,0,'First draft',NULL,0,NULL,0),(41,NULL,1,0,'First draft',NULL,0,NULL,0),(42,NULL,1,0,'First draft',NULL,0,NULL,0),(46,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2024-08-15 18:52:05'),(2,1,1,NULL,'save','2024-08-15 18:52:06'),(7,1,1,NULL,'edit','2024-08-15 18:51:52'),(7,1,1,NULL,'save','2024-08-15 18:51:53'),(16,1,1,NULL,'edit','2024-08-15 18:51:40'),(16,1,1,NULL,'save','2024-08-15 18:51:43'),(18,1,1,NULL,'edit','2024-08-15 18:51:11'),(18,1,1,NULL,'save','2024-08-15 18:51:12'),(20,1,1,NULL,'edit','2024-08-15 18:51:24'),(20,1,1,NULL,'save','2024-08-15 18:51:26'),(22,1,1,NULL,'edit','2024-08-15 18:51:00'),(22,1,1,NULL,'save','2024-08-15 18:51:01'),(24,1,1,NULL,'edit','2024-08-13 11:44:25'),(24,1,1,NULL,'save','2024-08-13 11:44:25'),(26,1,1,NULL,'edit','2024-08-15 18:50:29'),(26,1,1,NULL,'save','2024-08-15 18:50:30'),(50,1,1,NULL,'save','2024-01-10 15:32:46'),(54,1,1,NULL,'edit','2024-01-10 19:01:02'),(54,1,1,NULL,'save','2024-01-10 19:01:09'),(83,1,1,NULL,'save','2024-08-13 12:43:45'),(117,1,1,NULL,'edit','2024-08-15 18:50:48'),(117,1,1,NULL,'save','2024-08-15 18:50:49'),(127,1,1,NULL,'save','2024-08-14 14:45:12'),(128,1,1,NULL,'save','2024-08-14 13:42:57'),(129,1,1,NULL,'save','2024-08-14 13:43:05'),(153,1,1,NULL,'edit','2024-08-15 14:00:35'),(153,1,1,NULL,'save','2024-08-15 14:00:36');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-01-06 09:36:55','2024-01-06 09:36:55',NULL,NULL,'b2dc30e1-e07d-4bd4-823f-63ba0c35ecae'),(2,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 09:52:58','2024-08-15 18:52:06',NULL,NULL,'40e726e4-15de-461f-a9eb-f758ddf0e532'),(3,2,NULL,1,5,'craft\\elements\\Entry',1,0,'2024-01-10 09:56:40','2024-01-10 09:56:40',NULL,NULL,'ac24b5d9-2e14-425d-821f-82cbbbc9a043'),(4,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 10:10:11','2024-01-10 10:10:11',NULL,'2024-08-14 16:51:10','ee8afe6e-e7f5-41f2-8386-98d9fe98c968'),(6,2,NULL,2,5,'craft\\elements\\Entry',1,0,'2024-01-10 10:14:19','2024-01-10 10:14:19',NULL,NULL,'076fa175-a69c-419d-8f60-d564341e4cb0'),(7,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:03:30','2024-08-15 18:51:53',NULL,NULL,'80bcedac-8e20-4646-ae84-e886c3528d91'),(8,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:04:42','2024-01-10 12:04:42',NULL,'2024-08-14 16:51:10','89f05b16-86ba-467a-b10a-4e0e86d8026f'),(9,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:04:47','2024-01-10 12:04:47',NULL,'2024-08-14 16:51:10','b33c6e12-16e8-4570-bacb-643e564ff13b'),(10,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:04:50','2024-01-10 12:04:50',NULL,'2024-08-14 16:51:10','933d4445-1168-4630-8259-34dab8226c03'),(11,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:04:55','2024-01-10 12:04:55',NULL,'2024-08-14 16:51:10','1b1b1f9d-9b4e-44ad-974a-0cf780cd15ba'),(12,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:05:22','2024-01-10 12:05:22',NULL,'2024-08-14 16:51:10','e84936fe-ad5e-4540-9fb0-4e5f48414d93'),(13,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:05:27','2024-01-10 12:05:27',NULL,'2024-08-14 16:51:10','5cd2e576-8191-48c9-a688-8d7bcf06fce2'),(14,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 12:05:34','2024-01-10 12:05:34',NULL,'2024-08-14 16:51:10','010fe576-df3c-43fa-b99f-3c0799b1305f'),(15,7,NULL,3,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:05:44','2024-01-10 12:05:44',NULL,NULL,'e59cfd8b-84c6-4e10-99d8-09a06e6faf53'),(16,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:32:54','2024-08-15 18:51:43',NULL,NULL,'f999a07d-d578-4746-8405-899ba35bd893'),(17,16,NULL,4,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:33:42','2024-01-10 12:33:42',NULL,NULL,'c97739db-d78e-4c89-a786-6f0f491acaf0'),(18,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:35:24','2024-08-15 18:51:12',NULL,NULL,'c67100a9-b56c-4c7e-ad43-85f2ac712c79'),(19,18,NULL,5,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:36:08','2024-01-10 12:36:08',NULL,NULL,'408b37bd-b7e2-41dd-b45b-4b92d4569c51'),(20,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:36:11','2024-08-15 18:51:25',NULL,NULL,'d67bcd57-f3d9-4377-ac9d-774338282700'),(21,20,NULL,6,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:36:44','2024-01-10 12:36:44',NULL,NULL,'8a9ee7f9-f3ad-487b-9f92-c590566e1449'),(22,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:36:47','2024-08-15 18:51:01',NULL,NULL,'b2c02cbe-d2c0-44af-8da8-f44f14d183f8'),(23,22,NULL,7,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:37:20','2024-01-10 12:37:20',NULL,NULL,'233a7f1c-395f-42b7-8709-71b3000a1bd7'),(24,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:37:22','2024-08-13 11:44:25',NULL,'2024-08-14 09:38:14','361f6bc1-55a8-4265-84b2-ef56a13f026a'),(25,24,NULL,8,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:38:09','2024-01-10 12:38:09',NULL,'2024-08-14 09:38:14','9622c8cc-131b-404d-aaf3-3a0c5d3e5bfb'),(26,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:38:13','2024-08-15 18:50:30',NULL,NULL,'ccd8f66e-cb70-4acf-b598-d8ef9f4e8258'),(27,26,NULL,9,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:38:44','2024-01-10 12:38:44',NULL,NULL,'60347e8a-859c-44ac-a033-f569cec9724a'),(28,24,NULL,10,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:39:53','2024-01-10 12:39:53',NULL,'2024-08-14 09:38:14','f347f82b-4a75-432a-a45a-2fbadbbc9447'),(30,26,NULL,11,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:05','2024-01-10 12:40:05',NULL,NULL,'0419367e-c5df-4c97-a002-e76c3fb48bd7'),(31,22,NULL,12,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:09','2024-01-10 12:40:09',NULL,NULL,'ea776b86-a7c9-4a43-9a12-86cdbfd6350a'),(32,18,NULL,13,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:12','2024-01-10 12:40:12',NULL,NULL,'75b5c3ec-9c47-4385-8b98-f7f000501ee7'),(33,20,NULL,14,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:15','2024-01-10 12:40:15',NULL,NULL,'90f0a1e5-5570-4cb3-9d93-ebc0a7d14ced'),(34,16,NULL,15,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:19','2024-01-10 12:40:19',NULL,NULL,'a1f580fc-a659-4bca-a9af-f1d7639b91f6'),(35,7,NULL,16,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:22','2024-01-10 12:40:22',NULL,NULL,'f002e9db-affe-416f-81f3-9eff7b7d3d12'),(36,2,NULL,17,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:26','2024-01-10 12:40:26',NULL,NULL,'3061b490-97c5-433b-9c0d-244ab37cab88'),(37,24,NULL,18,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:40:55','2024-01-10 12:40:55',NULL,'2024-08-14 09:38:14','3bd2f850-981b-4011-b892-e88d434a60a7'),(38,26,NULL,19,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:41:02','2024-01-10 12:41:02',NULL,NULL,'5e38ebe0-8026-4ad9-95bf-ae9c9196eb7e'),(39,18,NULL,20,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:41:07','2024-01-10 12:41:07',NULL,NULL,'5428788c-6208-4d9b-a1c5-1575e4175f59'),(41,24,NULL,21,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:41:17','2024-01-10 12:41:17',NULL,'2024-08-14 09:38:14','05b2e43c-213b-45d8-a653-19c09861e797'),(43,24,NULL,22,5,'craft\\elements\\Entry',1,0,'2024-01-10 12:41:49','2024-01-10 12:41:49',NULL,'2024-08-14 09:38:14','ce18ff3c-e962-4556-a9e7-7397b07a6a00'),(46,24,NULL,23,5,'craft\\elements\\Entry',1,0,'2024-01-10 14:14:05','2024-01-10 14:14:05',NULL,'2024-08-14 09:38:14','05be925a-b747-414b-9129-3d109852b48e'),(47,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-01-10 14:50:54','2024-01-10 14:50:54',NULL,'2024-01-10 15:03:36','f248149f-3346-47f7-9cbb-2a0816d3a650'),(48,47,NULL,24,7,'craft\\elements\\Entry',1,0,'2024-01-10 14:50:54','2024-01-10 14:50:54',NULL,NULL,'083dd1a1-bb6c-4186-ba03-b68108f1a226'),(49,47,NULL,25,7,'craft\\elements\\Entry',1,0,'2024-01-10 14:50:54','2024-01-10 14:50:54',NULL,NULL,'a2752ce6-eb18-4065-a52d-a717b866598a'),(50,NULL,NULL,NULL,8,'craft\\elements\\Category',1,0,'2024-01-10 15:32:04','2024-01-10 15:32:46',NULL,'2024-08-14 13:27:04','b9eee52b-fc69-4d28-9afd-a007aa8fb9fc'),(52,24,NULL,26,5,'craft\\elements\\Entry',1,0,'2024-01-10 15:37:00','2024-01-10 15:37:00',NULL,'2024-08-14 09:38:14','4a94aaf2-e4c7-49e7-9096-a82084ee50b4'),(54,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2024-01-10 18:59:34','2024-01-10 19:01:09',NULL,'2024-01-10 19:31:55','040800e2-4c4e-4ef5-aac2-68a75254084b'),(55,54,NULL,27,10,'craft\\elements\\Entry',1,0,'2024-01-10 18:59:34','2024-01-10 18:59:34',NULL,NULL,'8615712e-dff9-45f7-9a09-6607ffb6e1b8'),(56,54,NULL,28,10,'craft\\elements\\Entry',1,0,'2024-01-10 18:59:34','2024-01-10 18:59:34',NULL,NULL,'e6e30f1d-3739-45d1-b0b3-f9ef732e6c52'),(57,54,NULL,29,10,'craft\\elements\\Entry',1,0,'2024-01-10 19:00:17','2024-01-10 19:00:17',NULL,NULL,'92f2dd56-a061-4e19-8289-89c1b1ddfff6'),(58,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-01-10 19:01:00','2024-01-10 19:01:00',NULL,'2024-08-14 16:51:10','88a5c1b5-d7d5-4653-b765-7042f47062f0'),(60,54,NULL,30,10,'craft\\elements\\Entry',1,0,'2024-01-10 19:01:09','2024-01-10 19:01:09',NULL,NULL,'99c43f61-de3e-4b30-8583-8923cd03bab6'),(62,26,NULL,31,5,'craft\\elements\\Entry',1,0,'2024-01-10 19:31:00','2024-01-10 19:31:00',NULL,NULL,'f9a85c3d-2ec0-4559-bb57-5298d4af6357'),(63,22,NULL,32,5,'craft\\elements\\Entry',1,0,'2024-01-10 19:31:05','2024-01-10 19:31:05',NULL,NULL,'874a959d-30df-4a1c-9ba1-97eab019da44'),(65,18,NULL,33,5,'craft\\elements\\Entry',1,0,'2024-01-10 19:31:13','2024-01-10 19:31:14',NULL,NULL,'23e32e93-e2c0-4fd5-9670-e8f0b9c32bef'),(67,16,NULL,34,5,'craft\\elements\\Entry',1,0,'2024-01-10 19:31:22','2024-01-10 19:31:22',NULL,NULL,'1a90afd3-8c62-467e-88bb-b05b32414eb8'),(69,7,NULL,35,5,'craft\\elements\\Entry',1,0,'2024-01-10 19:31:35','2024-01-10 19:31:35',NULL,NULL,'bb14c23e-6258-438d-97c4-4789b4b7be48'),(71,2,NULL,36,5,'craft\\elements\\Entry',1,0,'2024-01-10 19:31:42','2024-01-10 19:31:42',NULL,NULL,'a78113fe-5af3-4a42-8d08-5e936a2652b2'),(72,24,NULL,37,5,'craft\\elements\\Entry',1,0,'2024-01-11 14:53:03','2024-01-11 14:53:03',NULL,'2024-08-14 09:38:14','02a18bc9-c916-4104-b48f-cb2f7e4bcc70'),(74,24,NULL,38,5,'craft\\elements\\Entry',1,0,'2024-01-11 14:53:17','2024-01-11 14:53:17',NULL,'2024-08-14 09:38:14','42a1c870-f97b-455d-bf52-150a75850039'),(76,24,NULL,39,5,'craft\\elements\\Entry',1,0,'2024-01-11 14:55:53','2024-01-11 14:55:53',NULL,'2024-08-14 09:38:14','8ff7ff3e-f9d6-4d50-a7c9-be9fbd0fa2f4'),(78,24,NULL,40,5,'craft\\elements\\Entry',1,0,'2024-01-11 14:56:06','2024-01-11 14:56:07',NULL,'2024-08-14 09:38:14','dbb23046-29f3-4be0-8954-b9f12446d2ed'),(80,24,NULL,41,5,'craft\\elements\\Entry',1,0,'2024-01-11 15:38:51','2024-01-11 15:38:51',NULL,'2024-08-14 09:38:14','c37ebf25-87c6-4619-9018-f2046d1e01ca'),(82,24,NULL,42,5,'craft\\elements\\Entry',1,0,'2024-01-11 15:39:15','2024-01-11 15:39:15',NULL,'2024-08-14 09:38:14','74fd2363-d6b2-4355-b7d0-7ce40112b2bd'),(83,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-01-15 12:23:53','2024-08-13 12:43:44',NULL,'2024-08-13 12:55:54','0cc65aa8-ace2-423f-ae19-787c6a105810'),(84,24,NULL,43,5,'craft\\elements\\Entry',1,0,'2024-08-13 10:04:16','2024-08-13 10:04:16',NULL,'2024-08-14 09:38:14','fdde2241-0681-4e6d-bdff-4c21349f2463'),(86,24,NULL,44,5,'craft\\elements\\Entry',1,0,'2024-08-13 11:42:23','2024-08-13 11:42:23',NULL,'2024-08-14 09:38:14','da0362eb-7042-4c20-ae31-547e4a547029'),(87,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:42:58','2024-08-13 11:42:58',NULL,NULL,'2df0a9b7-e335-46fe-8fff-5f4dd3d316c5'),(88,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:42:58','2024-08-13 11:42:58',NULL,NULL,'bc1dc22c-207e-4ef9-bb0c-3cbf29cadfc0'),(89,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:00','2024-08-13 11:43:00',NULL,NULL,'d26bb9d7-d865-43c3-bd8a-e01779898e7d'),(90,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:00','2024-08-13 11:43:00',NULL,NULL,'65fe0e3a-ee9b-42e0-af3e-9c8c6fe4cea2'),(91,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:00','2024-08-13 11:43:00',NULL,NULL,'62a7b381-faaf-49df-abab-f6cbb37975b4'),(92,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:02','2024-08-13 11:43:02',NULL,NULL,'3d07e109-ee9b-4bfd-8e70-b7784ac1d732'),(93,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:03','2024-08-13 11:43:03',NULL,NULL,'5f6cb0d5-1051-42bc-99b3-b505fa3d02ee'),(94,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:04','2024-08-13 11:43:04',NULL,NULL,'61e36412-018a-4e6d-9727-1d56d2c8e0a2'),(95,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:05','2024-08-13 11:43:05',NULL,NULL,'07a23800-173f-42f4-9e83-85d345150e82'),(96,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:08','2024-08-13 11:43:08',NULL,NULL,'c6fb9c38-3a4d-49b1-846b-2e9bbe82733e'),(97,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-13 11:43:08','2024-08-13 11:43:08',NULL,NULL,'2dc0fbc9-4124-41b4-aa6f-b7957d010208'),(99,24,NULL,45,5,'craft\\elements\\Entry',1,0,'2024-08-13 11:44:25','2024-08-13 11:44:25',NULL,'2024-08-14 09:38:14','ef8c3ee9-cb31-4ecb-a6eb-75a43c25f761'),(100,83,NULL,46,5,'craft\\elements\\Entry',1,0,'2024-08-13 12:43:44','2024-08-13 12:43:45',NULL,'2024-08-13 12:55:54','b048d429-f7e8-425d-8244-24bcce8c1ac2'),(102,26,NULL,47,5,'craft\\elements\\Entry',1,0,'2024-08-13 12:54:51','2024-08-13 12:54:51',NULL,NULL,'f84e46e1-7a7b-402c-bb81-b61414328ac8'),(104,22,NULL,48,5,'craft\\elements\\Entry',1,0,'2024-08-13 12:55:46','2024-08-13 12:55:46',NULL,NULL,'85a315bf-1ac8-4742-8bf5-c2dd15345a81'),(106,18,NULL,49,5,'craft\\elements\\Entry',1,0,'2024-08-13 12:56:50','2024-08-13 12:56:51',NULL,NULL,'0514f15d-b710-4cb0-ab3b-9a0dc3507fb0'),(107,20,NULL,50,5,'craft\\elements\\Entry',1,0,'2024-08-13 13:06:39','2024-08-13 13:06:39',NULL,NULL,'93cedc57-435e-47f1-b113-b101fba70abc'),(108,18,NULL,51,5,'craft\\elements\\Entry',1,0,'2024-08-13 13:14:28','2024-08-13 13:14:28',NULL,NULL,'99367a44-b0d7-427d-bc90-2f502493a89b'),(110,20,NULL,52,5,'craft\\elements\\Entry',1,0,'2024-08-13 13:15:08','2024-08-13 13:15:08',NULL,NULL,'d6745c38-72dd-475c-9fad-bd4d0b90307d'),(112,16,NULL,53,5,'craft\\elements\\Entry',1,0,'2024-08-13 13:16:42','2024-08-13 13:16:42',NULL,NULL,'7a95e393-972f-47dc-9e94-83a80c1f290c'),(114,7,NULL,54,5,'craft\\elements\\Entry',1,0,'2024-08-13 13:17:50','2024-08-13 13:17:50',NULL,NULL,'625c3a56-f170-41b5-82c5-4adbd271e4a8'),(116,2,NULL,55,5,'craft\\elements\\Entry',1,0,'2024-08-13 13:18:24','2024-08-13 13:18:24',NULL,NULL,'eea647ed-f0c9-43e2-8efc-fcc742910ebf'),(117,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-08-14 09:37:47','2024-08-15 18:50:49',NULL,NULL,'1b74dab2-2789-451b-a043-3f81437c577a'),(118,117,NULL,56,5,'craft\\elements\\Entry',1,0,'2024-08-14 09:37:47','2024-08-14 09:37:47',NULL,NULL,'5269d970-0b84-40ec-a450-3a3f1e0746a5'),(119,NULL,NULL,NULL,14,'craft\\elements\\GlobalSet',1,0,'2024-08-14 11:24:01','2024-08-14 13:04:30',NULL,NULL,'81cec9b8-d078-4d2d-9966-301f621d9ee3'),(120,NULL,39,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:31:15','2024-08-14 13:31:15',NULL,NULL,'860fe8ae-5f92-471b-908e-768992156ced'),(121,26,NULL,57,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:31:25','2024-08-14 13:31:25',NULL,NULL,'365d3d7e-43c4-4209-8679-526550b213d4'),(122,26,NULL,58,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:32:38','2024-08-14 13:32:38',NULL,NULL,'369dd690-429d-4879-b3a2-b23fde0698ff'),(123,NULL,40,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:40:52','2024-08-14 13:40:52',NULL,NULL,'dbba947c-96af-4d12-ba2a-c92e94921555'),(124,NULL,41,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:40:58','2024-08-14 13:40:58',NULL,NULL,'302b254d-623d-4ee4-90f9-6911d194e2bf'),(125,26,NULL,59,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:41:35','2024-08-14 13:41:35',NULL,NULL,'c26da3b3-4289-4d90-9c65-cc57555846cf'),(126,NULL,42,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:41:44','2024-08-14 13:41:44',NULL,NULL,'53ffcd6e-5eef-4ca0-b340-1823776046b6'),(127,NULL,NULL,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:42:17','2024-08-14 14:45:12',NULL,NULL,'8fecc765-191a-4685-83da-bd5839f00a8d'),(128,NULL,NULL,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:42:52','2024-08-14 13:42:57',NULL,NULL,'bc47aa74-0c3b-4c86-80b3-fa9ead0e1359'),(129,NULL,NULL,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:43:01','2024-08-14 13:43:05',NULL,NULL,'8b8fb4e2-fbf8-4e1a-b164-625d2ee6bdef'),(130,26,NULL,60,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:43:21','2024-08-14 13:43:21',NULL,NULL,'3f6fba36-3f0c-435d-82bb-5541bb2c9940'),(131,117,NULL,61,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:44:51','2024-08-14 13:44:51',NULL,NULL,'03da05b3-6acc-4f6c-b419-d5f09679a4b3'),(132,26,NULL,62,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:45:18','2024-08-14 13:45:18',NULL,NULL,'a9b3276f-4a5c-4788-8342-7171e3b7e601'),(133,117,NULL,63,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:47:57','2024-08-14 13:47:57',NULL,NULL,'74a869c5-7b47-4a57-94ff-162bbe8865dc'),(134,NULL,46,NULL,15,'craft\\elements\\Category',1,0,'2024-08-14 13:49:13','2024-08-14 13:49:13',NULL,NULL,'a83c3ecf-3809-40a8-9271-247060602174'),(135,26,NULL,64,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:51:24','2024-08-14 13:51:24',NULL,NULL,'d7d809c2-6b65-4b4d-8f63-a87fb668bcee'),(137,26,NULL,65,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:52:36','2024-08-14 13:52:36',NULL,NULL,'130c9066-aa78-4202-b44f-ca0e14f61517'),(139,117,NULL,66,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:52:44','2024-08-14 13:52:44',NULL,NULL,'6be1ed00-98d2-4ad3-b108-e1279386bb0a'),(141,22,NULL,67,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:52:52','2024-08-14 13:52:52',NULL,NULL,'cb988e47-79ff-47e8-a79a-45cba347e677'),(143,18,NULL,68,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:53:02','2024-08-14 13:53:02',NULL,NULL,'e3bac68a-6767-4702-b99c-cf688f519709'),(145,20,NULL,69,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:53:12','2024-08-14 13:53:12',NULL,NULL,'ce2d0c14-edc2-4d4f-91d7-102b84fa4dd8'),(147,16,NULL,70,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:53:20','2024-08-14 13:53:20',NULL,NULL,'78598a90-ebf5-4d51-9e03-4e73cd397949'),(149,7,NULL,71,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:53:29','2024-08-14 13:53:29',NULL,NULL,'49e528aa-ae00-44a3-9e9e-8b8a4ba6260a'),(151,2,NULL,72,5,'craft\\elements\\Entry',1,0,'2024-08-14 13:53:39','2024-08-14 13:53:39',NULL,NULL,'d6e3c024-8f64-4c88-b2c0-803049a11cb6'),(152,26,NULL,73,5,'craft\\elements\\Entry',1,0,'2024-08-14 14:38:25','2024-08-14 14:38:25',NULL,NULL,'f90f0ba5-c657-4b8f-b55f-70fc4dc27b83'),(153,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-08-15 13:28:49','2024-08-15 16:37:00',NULL,NULL,'e3855ac3-373c-4b0a-b6df-36dd8b90a6da'),(154,153,NULL,74,16,'craft\\elements\\Entry',1,0,'2024-08-15 13:29:00','2024-08-15 13:29:01',NULL,NULL,'f6be6f38-9c15-48ec-9357-1dea157c4747'),(155,18,NULL,75,5,'craft\\elements\\Entry',0,0,'2024-08-15 13:43:16','2024-08-15 13:43:16',NULL,NULL,'f3960c91-b587-4d5d-a1c8-927f155afc0c'),(156,20,NULL,76,5,'craft\\elements\\Entry',0,0,'2024-08-15 13:43:16','2024-08-15 13:43:16',NULL,NULL,'98dfef03-72a7-4c81-af65-1475edf13cb8'),(157,22,NULL,77,5,'craft\\elements\\Entry',0,0,'2024-08-15 13:43:16','2024-08-15 13:43:17',NULL,NULL,'74d1323b-257b-46bf-a7c5-d48bb4e0a0be'),(158,26,NULL,78,5,'craft\\elements\\Entry',0,0,'2024-08-15 13:43:17','2024-08-15 13:43:17',NULL,NULL,'a5d550fa-b589-4415-b706-0d739d66fa7e'),(159,117,NULL,79,5,'craft\\elements\\Entry',0,0,'2024-08-15 13:43:17','2024-08-15 13:43:17',NULL,NULL,'bb143237-2935-4aa1-a517-13a0081a95f5'),(160,18,NULL,80,5,'craft\\elements\\Entry',1,0,'2024-08-15 13:43:36','2024-08-15 13:43:36',NULL,NULL,'2f90aea7-8728-46b7-b6c3-b72efce93b56'),(161,20,NULL,81,5,'craft\\elements\\Entry',1,0,'2024-08-15 13:43:36','2024-08-15 13:43:37',NULL,NULL,'7dcc15d3-d590-462c-b665-a870ef933ea9'),(162,22,NULL,82,5,'craft\\elements\\Entry',1,0,'2024-08-15 13:43:37','2024-08-15 13:43:37',NULL,NULL,'f16ff311-c425-4b38-ae53-d8feb23cec4e'),(163,26,NULL,83,5,'craft\\elements\\Entry',1,0,'2024-08-15 13:43:37','2024-08-15 13:43:37',NULL,NULL,'94609cbb-a879-4122-8499-56102f32b054'),(164,117,NULL,84,5,'craft\\elements\\Entry',1,0,'2024-08-15 13:43:37','2024-08-15 13:43:37',NULL,NULL,'125028a7-109c-460b-ba58-3d6f2769744b'),(166,153,NULL,85,16,'craft\\elements\\Entry',1,0,'2024-08-15 14:00:35','2024-08-15 14:00:35',NULL,NULL,'e90e617e-539d-42b2-92bf-4bdce3f3b9c7'),(167,153,NULL,86,16,'craft\\elements\\Entry',1,0,'2024-08-15 16:37:00','2024-08-15 16:37:00',NULL,NULL,'c5cecc83-3346-4295-9202-0965422c517e'),(169,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:48:41','2024-08-15 18:48:41',NULL,NULL,'9693b6bc-b41e-4651-b5f6-ed3c6409e20b'),(170,26,NULL,87,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:48:45','2024-08-15 18:48:45',NULL,NULL,'ab00a82d-6c13-4040-ae4b-ffd249e307d8'),(172,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:50:28','2024-08-15 18:50:28',NULL,NULL,'d1e4d41b-b945-4cd8-a2d3-21a1ab66a2f5'),(173,26,NULL,88,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:50:30','2024-08-15 18:50:30',NULL,NULL,'fdec1029-a375-4635-a834-7a43f21e6ec6'),(175,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:50:47','2024-08-15 18:50:47',NULL,NULL,'052b24c4-47c5-4b1a-9e25-e273015627df'),(176,117,NULL,89,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:50:49','2024-08-15 18:50:49',NULL,NULL,'e47ac549-309a-4094-8717-06fe46f8d647'),(178,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:50:59','2024-08-15 18:50:59',NULL,NULL,'6d4a8f06-f82b-466f-90f3-2ca168a59a2f'),(179,22,NULL,90,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:51:01','2024-08-15 18:51:01',NULL,NULL,'ccca3132-66e9-4224-898f-07fab5ac9a85'),(181,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:51:10','2024-08-15 18:51:10',NULL,NULL,'a2dbf0d8-763e-4528-9d75-d1b1d5f94f46'),(182,18,NULL,91,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:51:12','2024-08-15 18:51:12',NULL,NULL,'7746557e-9cf7-4265-93f6-1955ebf18b17'),(184,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:51:23','2024-08-15 18:51:23',NULL,NULL,'b830ca23-f007-45b7-9e1a-c836149dbfd6'),(185,20,NULL,92,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:51:25','2024-08-15 18:51:25',NULL,NULL,'3a7f5f4b-bda6-4365-bb7c-62ead3237ce9'),(187,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:51:34','2024-08-15 18:51:34',NULL,NULL,'63f8530f-c255-4ee0-b959-16aaf204afe4'),(188,16,NULL,93,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:51:43','2024-08-15 18:51:43',NULL,NULL,'b14e6ca6-b39e-45c8-b315-2f672e9c202d'),(190,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:51:51','2024-08-15 18:51:51',NULL,NULL,'2fcfc871-1283-4260-9a1f-bbda6c1310f6'),(191,7,NULL,94,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:51:53','2024-08-15 18:51:53',NULL,NULL,'65341605-5a07-4416-b7cf-26afacaa8d51'),(193,NULL,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2024-08-15 18:52:04','2024-08-15 18:52:04',NULL,NULL,'479a01ef-5442-4b21-872f-600dff0a3957'),(194,2,NULL,95,5,'craft\\elements\\Entry',1,0,'2024-08-15 18:52:06','2024-08-15 18:52:06',NULL,NULL,'1e1e29eb-b9fd-40ad-9791-c9594f2dc401');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2024-01-06 09:36:55','2024-01-06 09:36:55','bf0f010e-3bb8-4e38-87e7-83ecc5899107'),(2,2,1,'mojito','drinks/mojito',1,'2024-01-10 09:52:58','2024-01-10 09:54:45','0c4d6508-21d0-4cd0-a4fd-cf9233f8f2a1'),(3,3,1,'mojito','drinks/mojito',1,'2024-01-10 09:56:40','2024-01-10 09:56:40','bb2a83fc-8ae7-4f1a-825f-1ef715e63297'),(4,4,1,NULL,NULL,1,'2024-01-10 10:10:11','2024-01-10 10:10:11','b5b75b70-6b88-498f-854e-c03b97fd1b7a'),(6,6,1,'mojito','drinks/mojito',1,'2024-01-10 10:14:19','2024-01-10 10:14:19','a06aadc3-c0b0-4509-b355-bf9616a13d26'),(7,7,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-01-10 12:03:30','2024-01-10 12:03:53','bb0551a0-ef0a-4646-87df-a18650de2089'),(8,8,1,NULL,NULL,1,'2024-01-10 12:04:42','2024-01-10 12:04:42','493653f1-275d-407f-9554-529ef5f2c86f'),(9,9,1,NULL,NULL,1,'2024-01-10 12:04:47','2024-01-10 12:04:47','c221606b-6564-4c15-969e-d094eb7919b9'),(10,10,1,NULL,NULL,1,'2024-01-10 12:04:50','2024-01-10 12:04:50','e04c8b5e-2b82-4964-828b-aeec1d935fae'),(11,11,1,NULL,NULL,1,'2024-01-10 12:04:55','2024-01-10 12:04:55','1089dfc7-5c2d-43d1-87e2-fdb8b08c51e1'),(12,12,1,NULL,NULL,1,'2024-01-10 12:05:22','2024-01-10 12:05:22','0e5dd5e3-c846-4f8e-a9a1-f31d13426dc9'),(13,13,1,NULL,NULL,1,'2024-01-10 12:05:27','2024-01-10 12:05:27','9e5df91b-102b-4fe7-9d10-1252197736f5'),(14,14,1,NULL,NULL,1,'2024-01-10 12:05:34','2024-01-10 12:05:34','04cc3ca6-886b-4588-a4c6-d321899cae5a'),(15,15,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-01-10 12:05:44','2024-01-10 12:05:44','e1280fa5-bcce-40ba-a90b-4e9da296b73b'),(16,16,1,'bloody-mary','drinks/bloody-mary',1,'2024-01-10 12:32:54','2024-01-10 12:33:12','f4fad77a-fa68-4b69-a7bd-35e019801e97'),(17,17,1,'bloody-mary','drinks/bloody-mary',1,'2024-01-10 12:33:42','2024-01-10 12:33:42','2a916965-16c2-4fff-9ab1-4e05e05120ee'),(18,18,1,'long-island','drinks/long-island',1,'2024-01-10 12:35:24','2024-01-10 12:35:39','740f8d39-e305-41f8-ab1a-bd355ef70bd6'),(19,19,1,'long-island','drinks/long-island',1,'2024-01-10 12:36:08','2024-01-10 12:36:08','ecdd8915-2f46-4e57-904b-3122e797856d'),(20,20,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-01-10 12:36:11','2024-01-10 12:36:24','5f70cecb-309c-4a84-9a08-21407655bc1c'),(21,21,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-01-10 12:36:44','2024-01-10 12:36:44','f0ab5a1b-1d4f-422f-9180-293f34e9ceb6'),(22,22,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-01-10 12:36:47','2024-01-10 12:36:59','9c09fa15-c54f-484a-a19d-72448b841e45'),(23,23,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-01-10 12:37:20','2024-01-10 12:37:20','f9b00ea1-b4c1-4d82-b4b3-5a1ea3610a1c'),(24,24,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 12:37:22','2024-01-10 12:37:37','752e3933-1615-482b-bfce-a3e5e11456bd'),(25,25,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 12:38:09','2024-01-10 12:38:09','146598fc-3e51-4cc1-a708-4fba1ff74f14'),(26,26,1,'caipirinha','drinks/caipirinha',1,'2024-01-10 12:38:13','2024-01-10 12:38:24','f7a16c47-86b0-4c0e-a6fe-db0792bc8b7f'),(27,27,1,'caipirinha','drinks/caipirinha',1,'2024-01-10 12:38:44','2024-01-10 12:38:44','b8e485f8-848b-4e0f-a47d-3d3353582bcb'),(28,28,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 12:39:53','2024-01-10 12:39:53','881644fd-6e32-4907-aaf7-108d104cbb57'),(30,30,1,'caipirinha','drinks/caipirinha',1,'2024-01-10 12:40:05','2024-01-10 12:40:05','13efbff3-dc7a-4f81-9aa3-7517b25db6ef'),(31,31,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-01-10 12:40:09','2024-01-10 12:40:09','8807d4c8-76c3-41b7-9878-5daa8381bafd'),(32,32,1,'long-island','drinks/long-island',1,'2024-01-10 12:40:12','2024-01-10 12:40:12','accfcff5-606e-41e4-b719-f4fdac68010d'),(33,33,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-01-10 12:40:15','2024-01-10 12:40:15','95450cbc-dd1f-460e-9350-5d485584b84d'),(34,34,1,'bloody-mary','drinks/bloody-mary',1,'2024-01-10 12:40:19','2024-01-10 12:40:19','1cb4c75d-8355-45bf-8652-232cc54a5d24'),(35,35,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-01-10 12:40:22','2024-01-10 12:40:22','3fac7a3c-f2e6-46ee-bd3e-25677e351e79'),(36,36,1,'mojito','drinks/mojito',1,'2024-01-10 12:40:26','2024-01-10 12:40:26','e25f0e53-fd26-4361-8566-68cc128cc957'),(37,37,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 12:40:55','2024-01-10 12:40:55','e50e2025-b81d-4895-904c-8894da71598c'),(38,38,1,'caipirinha','drinks/caipirinha',1,'2024-01-10 12:41:02','2024-01-10 12:41:02','3b9895e1-3736-48c8-93c9-8a422aa49ada'),(39,39,1,'long-island','drinks/long-island',1,'2024-01-10 12:41:07','2024-01-10 12:41:07','39697b04-e102-45ca-a55f-3f9b27fb79f3'),(41,41,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 12:41:17','2024-01-10 12:41:17','6842e5ab-f108-43ac-8c43-5d4b365cf633'),(43,43,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 12:41:49','2024-01-10 12:41:49','51e1b19f-dabc-423e-bbbc-88b6bdca21e6'),(46,46,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 14:14:05','2024-01-10 14:14:05','a0f1ab1a-af6d-4198-9d26-5579ecce8b75'),(47,47,1,'search','search',1,'2024-01-10 14:50:54','2024-01-10 14:50:54','49f5e590-9389-4292-9bc8-be60c1243556'),(48,48,1,'search','search',1,'2024-01-10 14:50:54','2024-01-10 14:50:54','c42b0140-09f1-4bfb-bea6-37de5bf6f3a4'),(49,49,1,'search','search',1,'2024-01-10 14:50:54','2024-01-10 14:50:54','24ea4307-34bf-4376-b6c4-530e9e98a5a0'),(50,50,1,'above-4-stars','above-4-stars/above-4-stars',1,'2024-01-10 15:32:04','2024-01-10 15:32:29','af12d6a2-f4f6-4a49-856b-38bb84788d8d'),(52,52,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-10 15:37:00','2024-01-10 15:37:00','99a164d3-572f-4a70-82d2-4e5b19aef6c9'),(54,54,1,'header','header',1,'2024-01-10 18:59:34','2024-01-10 18:59:34','8e62362c-c43e-4805-9e0c-37372dde5af0'),(55,55,1,'header','header',1,'2024-01-10 18:59:34','2024-01-10 18:59:34','5a6d77b2-e791-4010-b8d4-ad43fdd6108f'),(56,56,1,'header','header',1,'2024-01-10 18:59:34','2024-01-10 18:59:34','62a35a96-5160-46d7-90d7-a3365ac3be5a'),(57,57,1,'header','header',1,'2024-01-10 19:00:17','2024-01-10 19:00:17','c0ef6f1e-8b3c-4cd4-af6e-a815088d608d'),(58,58,1,NULL,NULL,1,'2024-01-10 19:01:00','2024-01-10 19:01:00','5fb2f67b-4bac-4c01-92e4-98fd32e37bad'),(60,60,1,'header','header',1,'2024-01-10 19:01:09','2024-01-10 19:01:09','efd7bbd2-9100-4367-8760-691d690a2e50'),(62,62,1,'caipirinha','drinks/caipirinha',1,'2024-01-10 19:31:00','2024-01-10 19:31:00','df55e8bf-d6dd-4378-a023-1314b7ec7b9e'),(63,63,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-01-10 19:31:05','2024-01-10 19:31:05','0507ca69-434e-45b4-9037-c03c64692866'),(65,65,1,'long-island','drinks/long-island',1,'2024-01-10 19:31:14','2024-01-10 19:31:14','beb2f346-1a7c-4353-882b-a0b9b863cd40'),(67,67,1,'bloody-mary','drinks/bloody-mary',1,'2024-01-10 19:31:22','2024-01-10 19:31:22','41706d15-3962-4e3b-a106-7422d56e0fbb'),(69,69,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-01-10 19:31:35','2024-01-10 19:31:35','228d9d7d-874e-4f96-88fd-615b26be6538'),(71,71,1,'mojito','drinks/mojito',1,'2024-01-10 19:31:42','2024-01-10 19:31:42','ad482f8b-f6e2-43e8-9175-b635749671e9'),(72,72,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-11 14:53:03','2024-01-11 14:53:03','f7aeed9d-b96f-4109-97d2-fa08bbba4c42'),(74,74,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-11 14:53:17','2024-01-11 14:53:17','090ea365-a851-44ab-8bc2-48553a8c784b'),(76,76,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-11 14:55:53','2024-01-11 14:55:53','03d68137-099a-4faa-aad7-69401af8ca25'),(78,78,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-11 14:56:07','2024-01-11 14:56:07','2197f50c-c425-4620-ade5-584d531ad1f7'),(80,80,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-11 15:38:51','2024-01-11 15:38:51','28d0d743-1813-4bc0-bb7c-40ce96dbec6f'),(82,82,1,'cuba-libre','drinks/cuba-libre',1,'2024-01-11 15:39:15','2024-01-11 15:39:15','33fef5b0-6529-4d52-8b63-446b22b6ca6c'),(83,83,1,'vakken','drinks/vakken',1,'2024-01-15 12:23:53','2024-08-13 12:43:43','2a2cb075-6c91-49b6-9b68-4e60f822baf8'),(84,84,1,'cuba-libre','drinks/cuba-libre',1,'2024-08-13 10:04:16','2024-08-13 10:04:16','c726b7e5-890d-4dec-9f0c-aad8892d3cf5'),(86,86,1,'cuba-libre','drinks/cuba-libre',1,'2024-08-13 11:42:23','2024-08-13 11:42:23','b16e97be-00a4-4241-84e0-b512cb220d06'),(87,87,1,NULL,NULL,1,'2024-08-13 11:42:58','2024-08-13 11:42:58','b05918ad-7b15-4537-9601-3095fcbd8bbd'),(88,88,1,NULL,NULL,1,'2024-08-13 11:42:58','2024-08-13 11:42:58','c342777b-bf03-4b75-904d-1c4ad5582d48'),(89,89,1,NULL,NULL,1,'2024-08-13 11:43:00','2024-08-13 11:43:00','123222c5-dd9b-40ba-b221-5f33100c265f'),(90,90,1,NULL,NULL,1,'2024-08-13 11:43:00','2024-08-13 11:43:00','4be4ab9e-393b-4d82-9927-2380a00332ec'),(91,91,1,NULL,NULL,1,'2024-08-13 11:43:00','2024-08-13 11:43:00','627f854f-a3cd-4025-94dc-d4f11a07ef5a'),(92,92,1,NULL,NULL,1,'2024-08-13 11:43:02','2024-08-13 11:43:02','9ef92b70-f18e-430a-b745-fbd740a84ddc'),(93,93,1,NULL,NULL,1,'2024-08-13 11:43:03','2024-08-13 11:43:03','6433e1d6-0c17-497f-9165-1c1c6f1d3c24'),(94,94,1,NULL,NULL,1,'2024-08-13 11:43:04','2024-08-13 11:43:04','2c1144a2-6fbe-4770-8d33-204de0494e09'),(95,95,1,NULL,NULL,1,'2024-08-13 11:43:05','2024-08-13 11:43:05','263d1729-5b61-4bcf-bd3f-62bfb148d66b'),(96,96,1,NULL,NULL,1,'2024-08-13 11:43:08','2024-08-13 11:43:08','7e8020d8-a21b-46f9-a16f-f379700c700b'),(97,97,1,NULL,NULL,1,'2024-08-13 11:43:08','2024-08-13 11:43:08','27f21bc2-c490-445b-8537-b0987141d040'),(99,99,1,'cuba-libre','drinks/cuba-libre',1,'2024-08-13 11:44:25','2024-08-13 11:44:25','111a70c6-aa9f-452b-bd4b-ece5afefbe93'),(100,100,1,'vakken','drinks/vakken',1,'2024-08-13 12:43:45','2024-08-13 12:43:45','602b0105-65e7-4350-a4be-a7fc99229b7e'),(102,102,1,'caipirinha','drinks/caipirinha',1,'2024-08-13 12:54:51','2024-08-13 12:54:51','9c7b79c1-7823-4f66-b053-4f201fb89382'),(104,104,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-08-13 12:55:46','2024-08-13 12:55:46','471d2d52-c988-414b-ae8a-18dcc20669c7'),(106,106,1,'long-island','drinks/long-island',1,'2024-08-13 12:56:51','2024-08-13 12:56:51','42dc2e39-4bc8-44ce-afab-5fb201489c08'),(107,107,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-08-13 13:06:39','2024-08-13 13:06:39','5baca6c9-757f-4e82-a13b-e981390ab6f7'),(108,108,1,'long-island','drinks/long-island',1,'2024-08-13 13:14:28','2024-08-13 13:14:28','a0256bdf-fa63-43df-a6fc-6877f2eb3b40'),(110,110,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-08-13 13:15:08','2024-08-13 13:15:08','7d8e5ade-9c99-476a-825f-23849beb27ed'),(112,112,1,'bloody-mary','drinks/bloody-mary',1,'2024-08-13 13:16:42','2024-08-13 13:16:42','71138d02-e4fc-4d02-b3a3-3e6dc6930bcb'),(114,114,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-08-13 13:17:50','2024-08-13 13:17:50','68359af4-df35-492b-b862-d98bee2f94ae'),(116,116,1,'mojito','drinks/mojito',1,'2024-08-13 13:18:24','2024-08-13 13:18:24','3a9beb76-7d19-4e5c-9f56-771cbbd145af'),(117,117,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-14 09:37:47','2024-08-14 09:37:47','7c60282e-3401-4097-98f9-e314b983fdbd'),(118,118,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-14 09:37:47','2024-08-14 09:37:47','7540eb96-53ae-43fc-bdfa-2a9606bec624'),(119,119,1,NULL,NULL,1,'2024-08-14 11:24:01','2024-08-14 11:24:01','9e55f769-dbf3-4db9-86ba-0af2a2cf0945'),(120,120,1,'__temp_vwtezohikmugdoiacnfxgzvhfbzvxfodndbo','productcategorieen/__temp_vwtezohikmugdoiacnfxgzvhfbzvxfodndbo',1,'2024-08-14 13:31:15','2024-08-14 13:31:15','b9aec547-3fa9-40a4-9537-578770614e86'),(121,121,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:31:25','2024-08-14 13:31:25','d49c8a22-c2ee-44a8-b1cd-76562309c87c'),(122,122,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:32:38','2024-08-14 13:32:38','876f98ca-902f-4c5b-96db-9a1b154d9efe'),(123,123,1,'__temp_emfodxevuvnijkccreqbqguupxxkgphpncwm','productcategorieen/__temp_emfodxevuvnijkccreqbqguupxxkgphpncwm',1,'2024-08-14 13:40:52','2024-08-14 13:40:52','564d1c7e-5803-4077-8d22-cb7801af3fbb'),(124,124,1,'__temp_feartjzjcyopouiwagukfhnackwozvlppbtw','productcategorieen/__temp_feartjzjcyopouiwagukfhnackwozvlppbtw',1,'2024-08-14 13:40:58','2024-08-14 13:40:58','f6976edd-259d-44b2-8c4c-f1a2abff35ca'),(125,125,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:41:35','2024-08-14 13:41:35','10248d08-9c01-43e9-b232-60615a89a069'),(126,126,1,'__temp_hrsfvsdhazlzjlwoqwlojsgldhhyfonfshdn','productcategorieen/__temp_hrsfvsdhazlzjlwoqwlojsgldhhyfonfshdn',1,'2024-08-14 13:41:44','2024-08-14 13:41:44','fab7c609-288d-45f6-a9be-42dab984f656'),(127,127,1,'kasten','productcategorieen/kasten',1,'2024-08-14 13:42:17','2024-08-14 13:42:21','9712a9fe-5862-4e78-a7f6-b5a81b1a41df'),(128,128,1,'stoelen','productcategorieen/stoelen',1,'2024-08-14 13:42:52','2024-08-14 13:42:57','caae790f-2e79-4bbf-84b3-d715f66200d8'),(129,129,1,'tafels','productcategorieen/tafels',1,'2024-08-14 13:43:01','2024-08-14 13:43:05','10a9394a-9d4e-4681-850c-1ceb407fd9a5'),(130,130,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:43:21','2024-08-14 13:43:21','cf1cc739-bd98-4600-9173-5dedcc46a086'),(131,131,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-14 13:44:51','2024-08-14 13:44:51','5ed3b431-2a17-4420-abb4-44b625e05149'),(132,132,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:45:18','2024-08-14 13:45:18','f0ad4617-3785-4704-8cd8-289fe9befaa5'),(133,133,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-14 13:47:57','2024-08-14 13:47:57','677c7a27-f28b-4528-bba3-6b8484602cc2'),(134,134,1,'__temp_ydwobyvopikdzezdeyneaauieunmnwwxzflk','productcategorieen/__temp_ydwobyvopikdzezdeyneaauieunmnwwxzflk',1,'2024-08-14 13:49:13','2024-08-14 13:49:13','1e837384-c472-4f3f-aab8-85383e21b556'),(135,135,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:51:24','2024-08-14 13:51:24','a3865ac2-df17-40d7-bae8-7d1285f97e69'),(137,137,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 13:52:36','2024-08-14 13:52:36','082859ff-39db-4358-a662-0cc241ff4309'),(139,139,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-14 13:52:44','2024-08-14 13:52:44','a3f2a0e7-ef1f-4d3e-8362-daf21487c80a'),(141,141,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-08-14 13:52:52','2024-08-14 13:52:52','999eaafb-9599-460b-8ac9-747daf913e7b'),(143,143,1,'long-island','drinks/long-island',1,'2024-08-14 13:53:02','2024-08-14 13:53:02','3830a2bd-0c61-482f-8044-472dbe0ae5c6'),(145,145,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-08-14 13:53:12','2024-08-14 13:53:12','92f0fbf4-f785-4bef-a12b-22b2853eb621'),(147,147,1,'bloody-mary','drinks/bloody-mary',1,'2024-08-14 13:53:20','2024-08-14 13:53:20','4cf40d0e-f4c4-44e7-a54f-2ee5709608db'),(149,149,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-08-14 13:53:29','2024-08-14 13:53:29','9f33ace3-2190-4718-b575-fc9c19c1225b'),(151,151,1,'mojito','drinks/mojito',1,'2024-08-14 13:53:39','2024-08-14 13:53:39','d4e0d50b-729d-48a9-9690-8da4e1ead47b'),(152,152,1,'caipirinha','drinks/caipirinha',1,'2024-08-14 14:38:25','2024-08-14 14:38:25','aac7b79e-e946-49e2-9e4b-747e609eb7ef'),(153,153,1,'furniture',NULL,1,'2024-08-15 13:28:49','2024-08-15 16:37:00','b52dbf5c-0b5d-43fa-a56f-114ae028d047'),(154,154,1,'furniture','header/furniture',1,'2024-08-15 13:29:01','2024-08-15 13:29:01','42b0defa-b8d6-4538-9784-ccaea5673b7d'),(155,155,1,'long-island','drinks/long-island',1,'2024-08-15 13:43:16','2024-08-15 13:43:16','73a6f1ac-687a-4bdc-bd35-c4647dcae748'),(156,156,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-08-15 13:43:16','2024-08-15 13:43:16','48b0e4a9-91c1-4e05-87ea-7c416e4767d4'),(157,157,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-08-15 13:43:17','2024-08-15 13:43:17','31e26a68-2033-4631-8931-faff0da656f1'),(158,158,1,'caipirinha','drinks/caipirinha',1,'2024-08-15 13:43:17','2024-08-15 13:43:17','2ce8f596-ade5-42f6-b778-ffe3961e2ba5'),(159,159,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-15 13:43:17','2024-08-15 13:43:17','fde3c6b4-6999-4882-b445-b04d1d70cdcb'),(160,160,1,'long-island','drinks/long-island',1,'2024-08-15 13:43:36','2024-08-15 13:43:36','fe852ad3-b5e1-4a00-a63e-36b2b873ee82'),(161,161,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-08-15 13:43:37','2024-08-15 13:43:37','92218593-e934-4efe-9163-a343857be8da'),(162,162,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-08-15 13:43:37','2024-08-15 13:43:37','aef82380-f06a-4b14-8204-a62b9b8452b6'),(163,163,1,'caipirinha','drinks/caipirinha',1,'2024-08-15 13:43:37','2024-08-15 13:43:37','387b27a9-fe33-44c9-8895-2f80cb85cd86'),(164,164,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-15 13:43:37','2024-08-15 13:43:37','88b8ab04-3ddc-4a20-bdbf-b155e7de8827'),(166,166,1,'furniture','header/furniture',1,'2024-08-15 14:00:35','2024-08-15 14:00:35','ee5df2a9-467c-40a1-9c53-1506461a9329'),(167,167,1,'furniture',NULL,1,'2024-08-15 16:37:00','2024-08-15 16:37:00','c896409f-ec63-4893-962e-43fb3c0826f7'),(169,169,1,NULL,NULL,1,'2024-08-15 18:48:41','2024-08-15 18:48:41','19a18b90-addd-4bd0-ac01-3c03c925f92d'),(170,170,1,'caipirinha','drinks/caipirinha',1,'2024-08-15 18:48:45','2024-08-15 18:48:45','6931a12c-1bc4-49d0-b0f4-fda65d4da884'),(172,172,1,NULL,NULL,1,'2024-08-15 18:50:28','2024-08-15 18:50:28','ee0c0694-6fb6-4a0d-80dc-f89947b60697'),(173,173,1,'caipirinha','drinks/caipirinha',1,'2024-08-15 18:50:30','2024-08-15 18:50:30','ec83a003-c302-49ae-934a-9c3004ba2335'),(175,175,1,NULL,NULL,1,'2024-08-15 18:50:47','2024-08-15 18:50:47','9d8c4658-ecff-4319-9c28-ac9becb8f9be'),(176,176,1,'cuba-libre-2','drinks/cuba-libre-2',1,'2024-08-15 18:50:49','2024-08-15 18:50:49','b96c64f4-74f4-4909-a05d-35876e9b809f'),(178,178,1,NULL,NULL,1,'2024-08-15 18:50:59','2024-08-15 18:50:59','a6e5da99-ea57-4660-96ea-35a10a76065f'),(179,179,1,'sex-on-the-beach','drinks/sex-on-the-beach',1,'2024-08-15 18:51:01','2024-08-15 18:51:01','52c25392-4d3f-4bb2-8371-c82f34337ed3'),(181,181,1,NULL,NULL,1,'2024-08-15 18:51:10','2024-08-15 18:51:10','a71fb605-b175-4609-85f4-0374ec6b7c6d'),(182,182,1,'long-island','drinks/long-island',1,'2024-08-15 18:51:12','2024-08-15 18:51:12','2b03690d-02e2-45a2-b45a-82b09630c207'),(184,184,1,NULL,NULL,1,'2024-08-15 18:51:23','2024-08-15 18:51:23','427bcb0c-146f-4912-9e39-879b48740627'),(185,185,1,'tequila-sunrise','drinks/tequila-sunrise',1,'2024-08-15 18:51:25','2024-08-15 18:51:25','6916e7be-4564-467b-be8b-bf52c5540d15'),(187,187,1,NULL,NULL,1,'2024-08-15 18:51:34','2024-08-15 18:51:34','d0b1eb59-00e1-4f7a-a744-b65a9a82a503'),(188,188,1,'bloody-mary','drinks/bloody-mary',1,'2024-08-15 18:51:43','2024-08-15 18:51:43','8fd85007-a1b8-46d8-97ba-abcfa3b5085d'),(190,190,1,NULL,NULL,1,'2024-08-15 18:51:51','2024-08-15 18:51:51','021d744e-2a65-4b52-b0d6-85b090bf17ab'),(191,191,1,'blue-lagoon','drinks/blue-lagoon',1,'2024-08-15 18:51:53','2024-08-15 18:51:53','7a70bc16-53b1-480e-9a1d-1bf211739786'),(193,193,1,NULL,NULL,1,'2024-08-15 18:52:04','2024-08-15 18:52:04','d5732990-d92a-4380-a7ce-624eb8ea6cbb'),(194,194,1,'mojito','drinks/mojito',1,'2024-08-15 18:52:06','2024-08-15 18:52:06','27f7a72a-f5da-43c0-a4ce-5d92efa43b53');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-01-10 09:52:58','2024-01-10 09:56:39'),(3,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-01-10 09:56:40','2024-01-10 09:56:40'),(6,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-01-10 10:14:19','2024-01-10 10:14:19'),(7,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-01-10 12:03:30','2024-01-10 12:05:44'),(15,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-01-10 12:05:44','2024-01-10 12:05:44'),(16,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-01-10 12:32:54','2024-01-10 12:33:42'),(17,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-01-10 12:33:42','2024-01-10 12:33:42'),(18,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:35:24','2024-01-10 12:36:08'),(19,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:36:08','2024-01-10 12:36:08'),(20,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:36:11','2024-01-10 12:36:44'),(21,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:36:44','2024-01-10 12:36:44'),(22,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-01-10 12:36:47','2024-01-10 12:37:20'),(23,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-01-10 12:37:20','2024-01-10 12:37:20'),(24,4,NULL,5,1,'2024-01-10 12:38:00',NULL,0,'2024-01-10 12:37:22','2024-01-10 12:38:09'),(25,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:38:09','2024-01-10 12:38:09'),(26,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:38:13','2024-01-10 12:38:44'),(27,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:38:44','2024-01-10 12:38:44'),(28,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:39:53','2024-01-10 12:39:53'),(30,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:40:05','2024-01-10 12:40:05'),(31,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-01-10 12:40:09','2024-01-10 12:40:09'),(32,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:40:12','2024-01-10 12:40:12'),(33,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:40:15','2024-01-10 12:40:15'),(34,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-01-10 12:40:19','2024-01-10 12:40:19'),(35,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-01-10 12:40:22','2024-01-10 12:40:22'),(36,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-01-10 12:40:26','2024-01-10 12:40:26'),(37,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:40:55','2024-01-10 12:40:55'),(38,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:41:02','2024-01-10 12:41:02'),(39,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 12:41:07','2024-01-10 12:41:07'),(41,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:41:17','2024-01-10 12:41:17'),(43,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 12:41:49','2024-01-10 12:41:49'),(46,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 14:14:05','2024-01-10 14:14:05'),(47,5,NULL,6,NULL,'2024-01-10 14:50:00',NULL,1,'2024-01-10 14:50:54','2024-01-10 14:50:54'),(48,5,NULL,6,NULL,'2024-01-10 14:50:00',NULL,NULL,'2024-01-10 14:50:54','2024-01-10 14:50:54'),(49,5,NULL,6,NULL,'2024-01-10 14:50:00',NULL,NULL,'2024-01-10 14:50:54','2024-01-10 14:50:54'),(52,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 15:37:00','2024-01-10 15:37:00'),(54,6,NULL,7,NULL,'2024-01-10 18:59:00',NULL,1,'2024-01-10 18:59:34','2024-01-10 18:59:34'),(55,6,NULL,7,NULL,'2024-01-10 18:59:00',NULL,NULL,'2024-01-10 18:59:34','2024-01-10 18:59:34'),(56,6,NULL,7,NULL,'2024-01-10 18:59:00',NULL,NULL,'2024-01-10 18:59:34','2024-01-10 18:59:34'),(57,6,NULL,7,NULL,'2024-01-10 18:59:00',NULL,NULL,'2024-01-10 19:00:17','2024-01-10 19:00:17'),(60,6,NULL,7,NULL,'2024-01-10 18:59:00',NULL,NULL,'2024-01-10 19:01:09','2024-01-10 19:01:09'),(62,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-10 19:31:00','2024-01-10 19:31:00'),(63,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-01-10 19:31:05','2024-01-10 19:31:05'),(65,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-01-10 19:31:14','2024-01-10 19:31:14'),(67,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-01-10 19:31:22','2024-01-10 19:31:22'),(69,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-01-10 19:31:35','2024-01-10 19:31:35'),(71,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-01-10 19:31:42','2024-01-10 19:31:42'),(72,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-11 14:53:03','2024-01-11 14:53:03'),(74,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-11 14:53:17','2024-01-11 14:53:17'),(76,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-11 14:55:53','2024-01-11 14:55:53'),(78,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-11 14:56:07','2024-01-11 14:56:07'),(80,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-11 15:38:51','2024-01-11 15:38:51'),(82,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-01-11 15:39:15','2024-01-11 15:39:15'),(83,4,NULL,5,1,'2024-08-13 12:43:00',NULL,0,'2024-01-15 12:23:53','2024-08-13 12:43:44'),(84,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-13 10:04:16','2024-08-13 10:04:16'),(86,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-13 11:42:23','2024-08-13 11:42:23'),(99,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-13 11:44:25','2024-08-13 11:44:25'),(100,4,NULL,5,1,'2024-08-13 12:43:00',NULL,NULL,'2024-08-13 12:43:45','2024-08-13 12:43:45'),(102,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-13 12:54:51','2024-08-13 12:54:51'),(104,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-08-13 12:55:46','2024-08-13 12:55:46'),(106,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-13 12:56:51','2024-08-13 12:56:51'),(107,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-13 13:06:39','2024-08-13 13:06:39'),(108,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-13 13:14:28','2024-08-13 13:14:28'),(110,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-13 13:15:08','2024-08-13 13:15:08'),(112,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-08-13 13:16:42','2024-08-13 13:16:42'),(114,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-08-13 13:17:50','2024-08-13 13:17:50'),(116,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-08-13 13:18:24','2024-08-13 13:18:24'),(117,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 09:37:47','2024-08-14 09:37:47'),(118,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 09:37:47','2024-08-14 09:37:47'),(121,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:31:25','2024-08-14 13:31:25'),(122,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:32:38','2024-08-14 13:32:38'),(125,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:41:35','2024-08-14 13:41:35'),(130,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:43:21','2024-08-14 13:43:21'),(131,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:44:51','2024-08-14 13:44:51'),(132,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:45:18','2024-08-14 13:45:18'),(133,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:47:57','2024-08-14 13:47:57'),(135,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:51:24','2024-08-14 13:51:24'),(137,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:52:36','2024-08-14 13:52:36'),(139,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 13:52:44','2024-08-14 13:52:44'),(141,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-08-14 13:52:52','2024-08-14 13:52:52'),(143,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-14 13:53:02','2024-08-14 13:53:02'),(145,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-14 13:53:12','2024-08-14 13:53:12'),(147,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-08-14 13:53:20','2024-08-14 13:53:20'),(149,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-08-14 13:53:29','2024-08-14 13:53:29'),(151,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-08-14 13:53:39','2024-08-14 13:53:39'),(152,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-14 14:38:25','2024-08-14 14:38:25'),(153,10,NULL,11,NULL,'2024-08-15 13:29:00',NULL,NULL,'2024-08-15 13:28:49','2024-08-15 16:37:00'),(154,10,NULL,11,NULL,'2024-08-15 13:29:00',NULL,NULL,'2024-08-15 13:29:01','2024-08-15 16:37:01'),(155,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-15 13:43:16','2024-08-15 13:43:16'),(156,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-15 13:43:16','2024-08-15 13:43:16'),(157,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-08-15 13:43:17','2024-08-15 13:43:17'),(158,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 13:43:17','2024-08-15 13:43:17'),(159,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 13:43:17','2024-08-15 13:43:17'),(160,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-15 13:43:36','2024-08-15 13:43:36'),(161,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-15 13:43:37','2024-08-15 13:43:37'),(162,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-08-15 13:43:37','2024-08-15 13:43:37'),(163,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 13:43:37','2024-08-15 13:43:37'),(164,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 13:43:37','2024-08-15 13:43:37'),(166,10,NULL,11,NULL,'2024-08-15 13:29:00',NULL,NULL,'2024-08-15 14:00:35','2024-08-15 16:37:01'),(167,10,NULL,11,NULL,'2024-08-15 13:29:00',NULL,NULL,'2024-08-15 16:37:00','2024-08-15 16:37:00'),(170,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 18:48:45','2024-08-15 18:48:45'),(173,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 18:50:30','2024-08-15 18:50:30'),(176,4,NULL,5,1,'2024-01-10 12:38:00',NULL,NULL,'2024-08-15 18:50:49','2024-08-15 18:50:49'),(179,4,NULL,5,1,'2024-01-10 12:37:00',NULL,NULL,'2024-08-15 18:51:01','2024-08-15 18:51:01'),(182,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-15 18:51:12','2024-08-15 18:51:12'),(185,4,NULL,5,1,'2024-01-10 12:36:00',NULL,NULL,'2024-08-15 18:51:25','2024-08-15 18:51:25'),(188,4,NULL,5,1,'2024-01-10 12:33:00',NULL,NULL,'2024-08-15 18:51:43','2024-08-15 18:51:43'),(191,4,NULL,5,1,'2024-01-10 12:05:00',NULL,NULL,'2024-08-15 18:51:53','2024-08-15 18:51:53'),(194,4,NULL,5,1,'2024-01-10 09:56:00',NULL,NULL,'2024-08-15 18:52:06','2024-08-15 18:52:06');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'producten','default',1,'site',NULL,NULL,'site',NULL,1,1,'2024-01-06 14:15:47','2024-01-06 14:17:27','2024-01-10 09:33:17','614b95d2-07e1-4d80-b7db-fab1c7ee566d'),(2,1,2,'categorieën','categorieen',1,'site',NULL,NULL,'site',NULL,1,2,'2024-01-06 14:16:34','2024-01-06 14:16:34','2024-01-06 14:16:46','b60f8357-478b-4a08-9182-7c029874bb0d'),(3,2,3,'Default','default',1,'site',NULL,NULL,'site',NULL,1,1,'2024-01-06 14:18:01','2024-01-06 14:18:01','2024-01-06 14:18:36','aa2a51c3-66d4-4779-9f33-e1e9d65117f7'),(4,3,4,'detail','default',1,'site',NULL,NULL,'site',NULL,1,1,'2024-01-06 14:20:52','2024-01-06 14:21:32','2024-01-10 09:33:15','116d5008-ddf7-4d4c-b067-b5e36349b13d'),(5,4,5,'meubels','meubels',1,'site',NULL,NULL,'site',NULL,1,1,'2024-01-10 09:36:35','2024-08-13 12:32:42',NULL,'1a746295-d744-470d-bfb7-0cb596b068af'),(6,5,7,'search','search',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-01-10 14:50:54','2024-01-10 14:50:54','2024-01-10 15:03:36','93a266e5-df73-4e81-90db-c240f7f07365'),(7,6,10,'header','header',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-01-10 18:59:34','2024-01-10 18:59:34','2024-01-10 19:31:55','e23ddaf9-0c5f-4ebb-824d-b76e1263bfbc'),(8,7,11,'stoel','stoel',1,'site',NULL,NULL,'site',NULL,1,1,'2024-08-14 09:28:59','2024-08-14 09:29:29','2024-08-15 13:19:31','aa720e70-212b-431e-a0fd-eeaf7f2b9fde'),(9,8,12,'tafel','tafel',1,'site',NULL,NULL,'site',NULL,1,1,'2024-08-14 09:30:27','2024-08-14 09:30:45','2024-08-15 13:19:34','f661f918-a1cb-4564-b1d0-346469ecdc6e'),(10,9,13,'kast','kast',1,'site',NULL,NULL,'site',NULL,1,1,'2024-08-14 09:33:37','2024-08-14 09:33:52','2024-08-15 13:19:28','44de1e44-4207-4340-bc66-6a40077a7718'),(11,10,16,'header','header',1,'site',NULL,NULL,'site',NULL,1,1,'2024-08-15 13:28:21','2024-08-15 13:28:40',NULL,'8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2024-01-06 09:36:55','2024-01-06 09:36:55',NULL,'ffc5b93d-e571-4d92-a564-280a8db6237e'),(2,'meubels','2024-01-10 09:39:40','2024-08-13 11:47:27',NULL,'9603d0d8-6306-462f-a967-b1719be59cd2'),(3,'styles','2024-01-10 15:30:23','2024-01-10 15:30:23','2024-01-11 14:52:11','80d44d64-266c-413b-a01d-0e3047db7381');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (2,1,3,2,0,1,'2024-01-06 14:17:27','2024-01-06 14:17:27','f3d1a08b-f1c6-455d-b7a7-a829e34969ba'),(31,10,20,10,0,0,'2024-01-10 19:00:17','2024-01-10 19:00:17','5955bf6f-4970-4eaa-87d4-ef50834d5bb3'),(35,11,25,2,0,1,'2024-08-14 09:30:10','2024-08-14 09:30:10','57da69e2-7a8a-4c16-a889-90c71a3be754'),(36,11,25,10,0,2,'2024-08-14 09:30:10','2024-08-14 09:30:10','ba402081-a411-45be-bcdf-05c23a93eaed'),(37,11,25,9,0,3,'2024-08-14 09:30:10','2024-08-14 09:30:10','b4c4733b-d407-429f-b104-ad52f1b47bd9'),(38,12,27,2,0,1,'2024-08-14 09:30:45','2024-08-14 09:30:45','8b725c21-d1eb-4a14-8379-f0ad80b16924'),(39,12,27,10,0,2,'2024-08-14 09:30:45','2024-08-14 09:30:45','e795ed6a-d9e4-456e-97f5-aff0ea66786c'),(40,12,27,9,0,3,'2024-08-14 09:30:45','2024-08-14 09:30:45','9946f72b-c6d3-429a-9db0-38c5f3e76dba'),(41,13,29,2,0,1,'2024-08-14 09:33:51','2024-08-14 09:33:51','455a8ddb-fd15-483d-b467-e781dc5d2e49'),(42,13,29,10,0,2,'2024-08-14 09:33:51','2024-08-14 09:33:51','38224519-cd9b-46ff-bbe1-4ec79a20aba6'),(43,13,29,9,0,3,'2024-08-14 09:33:51','2024-08-14 09:33:51','4b05eb5a-7302-465b-826d-37f3fad880a6'),(44,14,31,15,0,0,'2024-08-14 11:26:16','2024-08-14 11:26:16','fbb6bdfd-61d3-45f6-b427-e2f08eafac51'),(45,14,31,16,0,1,'2024-08-14 11:26:16','2024-08-14 11:26:16','464a6a18-b5ca-49b3-b8d4-367d9e5c26c7'),(46,14,31,17,0,2,'2024-08-14 11:26:16','2024-08-14 11:26:16','c048faf7-1688-4507-9cbe-9294e77e9fe9'),(64,5,38,9,0,0,'2024-08-14 13:52:06','2024-08-14 13:52:06','82ee0218-c9d0-4e28-8d50-31e0858a7baa'),(65,5,38,10,0,1,'2024-08-14 13:52:06','2024-08-14 13:52:06','8c745e12-d55f-44d8-837f-91c150d08806'),(66,5,38,22,0,3,'2024-08-14 13:52:06','2024-08-14 13:52:06','99f84025-14e0-4335-92b0-90cc82bf9bfa'),(67,5,38,2,0,4,'2024-08-14 13:52:06','2024-08-14 13:52:06','bc56b605-1210-4ce2-bb2c-d75e9f9395ee'),(68,15,39,22,0,1,'2024-08-14 14:44:56','2024-08-14 14:44:56','fd217e28-e66e-49c0-ae56-53c8c6752d82');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2024-01-06 14:15:47','2024-01-06 14:15:47','2024-01-10 09:33:17','c6ba6d0a-ebc9-40b2-946c-32f34b994ba1'),(2,'craft\\elements\\Entry','2024-01-06 14:16:34','2024-01-06 14:16:34','2024-01-06 14:16:46','43e2b1e8-9f7c-41cb-a14d-2f8d5ab86008'),(3,'craft\\elements\\Entry','2024-01-06 14:18:01','2024-01-06 14:18:01','2024-01-06 14:18:36','7ef037fa-e320-406d-abc4-ddb4bb511cec'),(4,'craft\\elements\\Entry','2024-01-06 14:20:52','2024-01-06 14:20:52','2024-01-10 09:33:15','080142bc-09d2-4885-94c5-103ac577b2ee'),(5,'craft\\elements\\Entry','2024-01-10 09:36:35','2024-01-10 09:36:35',NULL,'a5451bb8-01ea-47ca-ae22-0b1d182720d8'),(6,'craft\\elements\\Asset','2024-01-10 10:07:42','2024-01-10 10:07:42',NULL,'b98d6397-56db-4190-8264-c3433ab0bbf1'),(7,'craft\\elements\\Entry','2024-01-10 14:50:54','2024-01-10 14:50:54','2024-01-10 15:03:36','7cfdc18b-ed01-4f64-a2f9-e779e89bbe6f'),(8,'craft\\elements\\Category','2024-01-10 15:29:34','2024-01-10 15:29:34','2024-08-14 13:27:04','03f99326-af45-4d40-ad80-5cc101273dd0'),(9,'craft\\elements\\Category','2024-01-10 15:39:30','2024-01-10 15:39:30','2024-08-14 13:27:06','918bed31-4427-49ac-9a1d-789e15fc1b22'),(10,'craft\\elements\\Entry','2024-01-10 18:59:34','2024-01-10 18:59:34','2024-01-10 19:31:55','c4e58581-ee68-4577-bb42-792b0b5d8efd'),(11,'craft\\elements\\Entry','2024-08-14 09:28:59','2024-08-14 09:28:59','2024-08-15 13:19:31','f021f9d7-d99d-4b34-a6af-8f2ba9f48f29'),(12,'craft\\elements\\Entry','2024-08-14 09:30:27','2024-08-14 09:30:27','2024-08-15 13:19:34','8a52ccf8-81f6-4173-bd5c-c44ad90b8e34'),(13,'craft\\elements\\Entry','2024-08-14 09:33:37','2024-08-14 09:33:37','2024-08-15 13:19:28','028da39e-5a98-423e-a003-1265baca19c8'),(14,'craft\\elements\\GlobalSet','2024-08-14 11:24:01','2024-08-14 11:24:01',NULL,'178c18a4-61e1-476c-80bd-066394a35161'),(15,'craft\\elements\\Category','2024-08-14 13:28:08','2024-08-14 13:28:08',NULL,'a392b45d-15d7-46c7-93a9-0e1f33e641c0'),(16,'craft\\elements\\Entry','2024-08-15 13:28:21','2024-08-15 13:28:21',NULL,'1921cb29-dd5a-40dd-b559-dbe7be225021');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (2,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"82e910c4-9408-4371-871e-b2924bfdf2ae\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-06 14:16:34','2024-01-06 14:16:34','5c3550ba-7be8-4494-b35d-8e9f61f3ccf7'),(3,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"09259aeb-3bc7-4a63-a75a-3d472916ad7d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5f889c0f-1308-4967-852e-103d467cda79\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c6822df0-7610-483a-9aad-da5d88833347\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"14004384-f7d8-482a-a0fd-00d8c56b5c8f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"863e876f-8402-4ffe-94fc-80bd2234484a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c063d3de-51cb-43d9-8faa-21013e0b9a7a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"63ffcdee-6bd1-48ae-9086-f859e984ab0e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7a4c2d7b-7bd6-473c-b427-3ee0c5f70aa7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"08e1a996-90e1-47b4-833b-9b8b4b0ea3d6\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-06 14:17:27','2024-01-06 14:17:27','f0f46e21-4239-47e8-8015-8ea1ff2039e5'),(4,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"ae0e438d-f305-4ad0-934e-8431f0a64d59\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-06 14:18:01','2024-01-06 14:18:01','bf743c16-7347-4ada-bbfe-0d74cf3a87cd'),(6,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"50249889-5cf2-4b72-8fbb-be30b46c9783\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ec09ea7d-2f4f-4230-bd9e-4902ca6c9b0e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5f889c0f-1308-4967-852e-103d467cda79\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"201a76bc-a1d8-4445-90aa-f0f9c76e347a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c063d3de-51cb-43d9-8faa-21013e0b9a7a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"092166fa-511e-4bf2-8b1d-76c99dee33cd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c194330d-2332-4f49-85f3-07980dc57d83\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"62d9f83e-7ae0-4045-8097-a9129e496988\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7a4c2d7b-7bd6-473c-b427-3ee0c5f70aa7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b337f697-977b-449f-b04d-76313d53bf6a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c7101e07-76b0-4c1c-9703-e10de24dcfeb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"13bec786-e52b-4b4d-900e-5e8f63d0f76b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c17b3a37-2a46-4509-8e04-96da2875846a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8e7eac03-7360-4534-8f05-38eff571dd1f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"495f788b-c25a-4026-8e13-403c161f36e5\"}]',1,'2024-01-06 14:21:31','2024-01-06 14:21:31','c319042a-1091-4c29-970c-3f68fe510bcb'),(12,7,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4028feae-cd0c-49a9-a091-b38bd098c8ae\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-10 14:50:54','2024-01-10 14:50:54','92591e07-ae7e-4083-afc1-0174c2ee5a21'),(14,8,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5c7b8ab9-f54c-4efe-b00a-326ba78dd171\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7d9314be-5b6f-4d41-9894-f4979d7e7b9c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"c7c77012-f6d5-46cc-992e-ca7bb229920d\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-10 15:31:48','2024-01-10 15:31:48','2892279e-a3cf-4654-9d8e-1a7acfef153c'),(16,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"005d4839-eca1-4c5f-ac86-42d47db37ead\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-10 15:39:30','2024-01-10 15:39:30','f64099ea-5faf-46f1-bf44-e3d3b2f6d542'),(20,10,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d848a9a1-8b6f-4bea-a94b-aebcf278c764\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"03727efa-ff38-40c7-806c-c335632b6f1e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"34ee891a-8bd8-46fb-85a1-2d4e9ac1d37b\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-01-10 19:00:17','2024-01-10 19:00:17','7bcfde3b-7b54-49c0-989b-c825bfd0fe2d'),(22,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"47b69dff-2552-48d1-b7c9-cbbc19bf087c\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-08-13 12:35:42','2024-08-13 12:35:42','9f8455d6-db97-4efc-8d4d-26b9484ddb4a'),(25,11,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"7c5eea97-8833-44f7-ad79-c4bb19e6cc1a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2b25312d-9783-427b-b145-1d7d2626583c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"14004384-f7d8-482a-a0fd-00d8c56b5c8f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5a408e23-826a-4f8f-960f-39ccd8a8e19a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"03727efa-ff38-40c7-806c-c335632b6f1e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"cb46fc30-1a22-4983-9af0-061333113530\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cc200480-e5ff-46b1-b444-92d3798e09c8\"}]',1,'2024-08-14 09:30:10','2024-08-14 09:30:10','7f341e38-e38c-4f34-b518-5eb985ff4bbe'),(27,12,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"aacbd29e-2ddf-42c7-a74b-1969d25ef9ca\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"50518bc8-0d3e-4513-8e12-68743fcb7222\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"14004384-f7d8-482a-a0fd-00d8c56b5c8f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"176332c0-5242-471a-8774-63669cf283c8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"03727efa-ff38-40c7-806c-c335632b6f1e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8fb42d81-5654-4079-98cd-cb19765196eb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cc200480-e5ff-46b1-b444-92d3798e09c8\"}]',1,'2024-08-14 09:30:45','2024-08-14 09:30:45','0b460a16-1fd0-4fe1-b8d7-0fd9e3f75c4f'),(29,13,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"ebb9a75a-9ab0-4b9e-b4d7-8873520b280e\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f8d4015e-684f-4c65-bb66-fdaaf873c63d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"14004384-f7d8-482a-a0fd-00d8c56b5c8f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c4503987-cd44-4384-b4fd-c23bc77ba2f4\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"03727efa-ff38-40c7-806c-c335632b6f1e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b9a7d18f-f18a-4042-951a-a9f687da6703\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cc200480-e5ff-46b1-b444-92d3798e09c8\"}]',1,'2024-08-14 09:33:51','2024-08-14 09:33:51','0959376b-ef7e-44a6-b3af-553601c129a1'),(31,14,'kleur','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b683fef3-b7bb-4911-98e5-35bfb6ad6239\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7402ea87-64ac-4830-8443-55224c25a6e2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"11f256f4-07f1-42de-ba39-bb5d7cd89ad9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"73298fc0-1360-40e5-9779-65679d8b687f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"408fcff8-346f-4bf0-91de-4a3ec0e8daec\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9c8665f7-e2f0-4f43-8468-f3d31c375024\"}]',1,'2024-08-14 11:26:16','2024-08-14 11:26:16','2cca6dbe-82fe-4b9f-83ec-1d94ef0ea686'),(38,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ed9e1877-ada4-4d87-b117-9d7c2b709109\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cc200480-e5ff-46b1-b444-92d3798e09c8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"59617603-8d80-4e10-9ea2-496c56e11e21\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"03727efa-ff38-40c7-806c-c335632b6f1e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"67acd255-39ff-46f6-829e-e16dfd806e3a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c2937e98-ad1d-4586-b3ba-bbf68b1bab9c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ae7581b7-0a02-409f-aeab-de5ba0d6eb81\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"63530d6e-7a46-430f-88a9-fa3531ba29e6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"14004384-f7d8-482a-a0fd-00d8c56b5c8f\"}]',1,'2024-08-14 13:52:06','2024-08-14 13:52:06','78748bfb-90fe-4e65-bca2-fe4538d6ad3c'),(39,15,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"7d9da910-fded-4f84-b7a3-e7f2113aa8b4\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2b8e6ce3-20ae-40c4-8317-cf4b928c771b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ae7581b7-0a02-409f-aeab-de5ba0d6eb81\"}]',1,'2024-08-14 14:44:56','2024-08-14 14:44:56','7a1312b2-cce4-4d43-b906-a90d2931e771'),(41,16,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"264ce268-e5eb-489e-b0aa-d1238c69da92\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-08-15 13:28:40','2024-08-15 13:28:40','4bd720e4-7517-4017-b274-fec9a28bbbd0');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (2,1,'prijs','prijs','global','uvymsfej',NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":2,\"defaultValue\":null,\"max\":99999,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":5,\"suffix\":null}','2024-01-06 14:11:56','2024-08-14 14:38:16','14004384-f7d8-482a-a0fd-00d8c56b5c8f'),(9,2,'beschrijving','beschrijving','global','pgfoymjv','korte beschrijving van de meubel',1,'none',NULL,'craft\\fields\\PlainText','{\"uiMode\":\"normal\",\"placeholder\":null,\"code\":false,\"multiline\":false,\"initialRows\":4,\"charLimit\":500,\"byteLimit\":null,\"columnType\":null}','2024-01-10 09:45:50','2024-08-14 14:36:05','cc200480-e5ff-46b1-b444-92d3798e09c8'),(10,2,'meubel Image','meubelImage','global',NULL,'plaats een nieuwe afbeelding',0,'site',NULL,'craft\\fields\\Assets','{\"restrictLocation\":false,\"restrictedLocationSource\":\"volume:538cba14-d0f8-4365-9d15-694d4b417ee0\",\"restrictedLocationSubpath\":null,\"allowSubfolders\":false,\"restrictedDefaultUploadSubpath\":null,\"defaultUploadLocationSource\":\"volume:538cba14-d0f8-4365-9d15-694d4b417ee0\",\"defaultUploadLocationSubpath\":null,\"allowUploads\":true,\"restrictFiles\":true,\"allowedKinds\":[\"image\",\"video\"],\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"previewMode\":\"full\",\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":\"meubel foto toevoegen\",\"showSiteMenu\":true,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\",\"maintainHierarchy\":false,\"branchLimit\":null}','2024-01-10 10:12:48','2024-08-15 16:40:24','03727efa-ff38-40c7-806c-c335632b6f1e'),(15,1,'primair','primair','global','ykpxmovf','kies een kleur, deze gaat het meest voorkomen op de website.',0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":null}','2024-08-14 11:24:41','2024-08-14 14:41:27','7402ea87-64ac-4830-8443-55224c25a6e2'),(16,1,'secundair','secundair','global','esbuwhni','kies een kleur, dit is de 2e meest voorkomende kleur. ',0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":null}','2024-08-14 11:25:06','2024-08-14 14:42:43','73298fc0-1360-40e5-9779-65679d8b687f'),(17,1,'zwart','zwart','global','xcfhxgvw','dit is de standaard zwart kleur, alles wat zwart is veranderd dan.',0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":null}','2024-08-14 11:25:39','2024-08-14 14:43:25','9c8665f7-e2f0-4f43-8468-f3d31c375024'),(22,1,'categorien','categorien','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Categories','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"source\":\"group:5a1d0dff-e9b9-4313-af3b-69517129c377\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2024-08-14 13:51:01','2024-08-14 14:36:31','ae7581b7-0a02-409f-aeab-de5ba0d6eb81');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (119,'kleuren','kleuren',14,1,'2024-08-14 11:24:01','2024-08-14 11:24:01','81cec9b8-d078-4d2d-9966-301f621d9ee3');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2024-08-13 10:24:21','2024-08-13 10:24:21','d18e0f7b-f2f7-43ab-9cf8-34769f47adcc');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (1,'medium','medium','letterbox','center-center',200,200,NULL,NULL,'none','transparent',1,'2024-08-15 18:50:13','2024-01-10 12:26:35','2024-08-15 18:50:13','0ff5a263-8c10-4c1b-a77c-896c4d48e41e');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.11.3','4.5.3.0',0,'djxycdvmelwo','3@bhsrhatnpc','2024-01-06 09:36:55','2024-08-15 18:50:13','3f4eb698-3c9f-494c-a29e-a3526c170fe7');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','1d9f619c-2302-4a3f-9078-53c9f3ce1fde'),(2,'craft','m210121_145800_asset_indexing_changes','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','7378a998-74f0-453c-b912-bc785c83c367'),(3,'craft','m210624_222934_drop_deprecated_tables','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','80087942-22d4-4ad3-a715-a52ecb493c50'),(4,'craft','m210724_180756_rename_source_cols','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','d5d80292-5324-46d2-bf88-09518c603151'),(5,'craft','m210809_124211_remove_superfluous_uids','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','afcb91f8-229b-4607-8150-4136c3b9ba8a'),(6,'craft','m210817_014201_universal_users','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','6f88eb70-b8f7-44a9-a4df-b1e1bc38c39d'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','e75555ba-252b-4eb0-8f84-71387ef6082c'),(8,'craft','m211115_135500_image_transformers','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','81ea863e-248d-4784-93be-0243e0acfaf0'),(9,'craft','m211201_131000_filesystems','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','5ac39ec1-58b4-4574-865d-22f5142500ac'),(10,'craft','m220103_043103_tab_conditions','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','e64ce70c-0299-4413-91dd-406649316009'),(11,'craft','m220104_003433_asset_alt_text','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','8f4486cf-ea50-453d-a45f-1a2e284d8a42'),(12,'craft','m220123_213619_update_permissions','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','34751db4-2c60-42f9-867c-8048af4432d2'),(13,'craft','m220126_003432_addresses','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','188a34a6-6ed4-42e5-b855-8d0d0ea41a51'),(14,'craft','m220209_095604_add_indexes','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','b7b1e191-261d-4e24-8c89-2350ec09d8a9'),(15,'craft','m220213_015220_matrixblocks_owners_table','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','970f7c4c-c90d-441a-a245-c4074c5e96a6'),(16,'craft','m220214_000000_truncate_sessions','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','13c2269a-0edc-44c2-8ba0-7102357be625'),(17,'craft','m220222_122159_full_names','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','a5e3cfa8-6100-40fb-8c78-f4a5a41e3efb'),(18,'craft','m220223_180559_nullable_address_owner','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','dca499f0-0f0d-4bc5-9aed-753cc3b1cfd0'),(19,'craft','m220225_165000_transform_filesystems','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','9419c519-8491-44c9-bc35-6383b1e88583'),(20,'craft','m220309_152006_rename_field_layout_elements','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','71105b99-e14a-4c40-911e-7918d146fbea'),(21,'craft','m220314_211928_field_layout_element_uids','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','183ea81f-4845-44b1-b197-d30e2ec8f003'),(22,'craft','m220316_123800_transform_fs_subpath','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','aa88756c-92eb-4487-9611-94b07ce4c386'),(23,'craft','m220317_174250_release_all_jobs','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','9de92305-f55e-46a5-9ce2-e3c02e8ab149'),(24,'craft','m220330_150000_add_site_gql_schema_components','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','49923127-7c32-4c77-9924-feaafddd3da8'),(25,'craft','m220413_024536_site_enabled_string','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','64100be9-7305-4c06-93f1-332148a31ba6'),(26,'craft','m221027_160703_add_image_transform_fill','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','a8889220-73b0-41b4-a267-6c006d58b994'),(27,'craft','m221028_130548_add_canonical_id_index','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','1a0632ff-29f0-4bfd-9127-068ef207677b'),(28,'craft','m221118_003031_drop_element_fks','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','1b3f485c-2789-4b04-878f-9f678886bdb2'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','7d40eaa7-4e28-4ce7-967c-65233bb7a4a2'),(30,'craft','m230226_013114_drop_plugin_license_columns','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','a240fb36-facf-4f1b-8cc5-d7c79ae86b98'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','4d005efb-3f85-462e-be83-f2ca519b7815'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','368d2ba3-89f8-430e-a9dc-d3bb00f0bd44'),(33,'craft','m230710_162700_element_activity','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','c8d20fb1-7ac4-4e66-8c98-8f23217b040a'),(34,'craft','m230820_162023_fix_cache_id_type','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','8ee9555f-2245-49f8-8453-72937f931c6e'),(35,'craft','m230826_094050_fix_session_id_type','2024-01-06 09:36:56','2024-01-06 09:36:56','2024-01-06 09:36:56','2a1058b2-f8e6-476f-84f9-269c1b49819a');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'element-api','3.0.1.1','1.0.0','2024-01-10 19:03:43','2024-01-10 19:03:43','2024-01-10 19:03:43','1aa96dc1-4041-4029-a590-2665b74d1c5b'),(2,'altify','v1.0.0','1.0.0','2024-08-13 10:13:49','2024-08-13 10:13:49','2024-08-13 10:13:49','15058982-866d-418d-8022-8973ab91db8f'),(3,'dumper','5.0.1','1.0.0','2024-08-15 18:32:49','2024-08-15 18:32:49','2024-08-15 18:32:49','6fa9e212-e397-4bdc-a588-de211d678fa2');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.defaultPlacement','\"end\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elementCondition','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.autocomplete','false'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.autocorrect','true'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.class','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.disabled','false'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.elementCondition','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.id','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.inputType','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.instructions','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.label','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.max','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.min','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.name','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.orientation','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.placeholder','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.readonly','false'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.requirable','false'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.size','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.step','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.tip','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.title','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.uid','\"7d9da910-fded-4f84-b7a3-e7f2113aa8b4\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.userCondition','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.warning','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.0.width','100'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.elementCondition','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.fieldUid','\"ae7581b7-0a02-409f-aeab-de5ba0d6eb81\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.instructions','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.label','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.required','false'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.tip','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.uid','\"2b8e6ce3-20ae-40c4-8317-cf4b928c771b\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.userCondition','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.warning','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.elements.1.width','100'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.name','\"Content\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.uid','\"7a1312b2-cce4-4d43-b906-a90d2931e771\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.fieldLayouts.a392b45d-15d7-46c7-93a9-0e1f33e641c0.tabs.0.userCondition','null'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.handle','\"productcategorieen\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.name','\"Productcategorieën\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.hasUrls','true'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.template','\"productcategorieen/_category.twig\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.uriFormat','\"productcategorieen/{slug}\"'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.structure.maxLevels','4'),('categoryGroups.5a1d0dff-e9b9-4313-af3b-69517129c377.structure.uid','\"6aab9b82-176f-44f5-b974-ad333916521e\"'),('dateModified','1723747813'),('email.fromEmail','\"r0952480@student.thomasmore.be\"'),('email.fromName','\"examen-Jonas-van-roy\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elementCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.elementCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.fieldUid','\"cc200480-e5ff-46b1-b444-92d3798e09c8\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.instructions','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.label','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.required','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.tip','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.uid','\"ed9e1877-ada4-4d87-b117-9d7c2b709109\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.userCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.warning','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.0.width','100'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.elementCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.fieldUid','\"03727efa-ff38-40c7-806c-c335632b6f1e\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.instructions','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.label','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.required','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.tip','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.uid','\"59617603-8d80-4e10-9ea2-496c56e11e21\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.userCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.warning','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.1.width','100'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.autocapitalize','true'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.autocomplete','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.autocorrect','true'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.class','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.disabled','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.elementCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.id','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.inputType','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.instructions','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.label','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.max','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.min','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.name','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.orientation','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.placeholder','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.readonly','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.requirable','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.size','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.step','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.tip','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.title','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.uid','\"67acd255-39ff-46f6-829e-e16dfd806e3a\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.userCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.warning','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.2.width','100'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.elementCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.fieldUid','\"ae7581b7-0a02-409f-aeab-de5ba0d6eb81\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.instructions','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.label','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.required','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.tip','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.uid','\"c2937e98-ad1d-4586-b3ba-bbf68b1bab9c\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.userCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.warning','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.3.width','100'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.elementCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.fieldUid','\"14004384-f7d8-482a-a0fd-00d8c56b5c8f\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.instructions','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.label','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.required','false'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.tip','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.uid','\"63530d6e-7a46-430f-88a9-fa3531ba29e6\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.userCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.warning','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.elements.4.width','100'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.name','\"Content\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.uid','\"78748bfb-90fe-4e65-bca2-fe4538d6ad3c\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.fieldLayouts.a5451bb8-01ea-47ca-ae22-0b1d182720d8.tabs.0.userCondition','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.handle','\"meubels\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.hasTitleField','true'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.name','\"meubels\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.section','\"7191d1fe-0469-4222-8421-739013ce3494\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.showStatusField','true'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.slugTranslationKeyFormat','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.slugTranslationMethod','\"site\"'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.sortOrder','1'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.titleFormat','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.titleTranslationKeyFormat','null'),('entryTypes.1a746295-d744-470d-bfb7-0cb596b068af.titleTranslationMethod','\"site\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elementCondition','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.autocapitalize','true'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.autocomplete','false'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.autocorrect','true'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.class','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.disabled','false'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.elementCondition','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.id','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.inputType','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.instructions','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.label','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.max','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.min','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.name','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.orientation','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.placeholder','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.readonly','false'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.requirable','false'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.size','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.step','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.tip','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.title','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.uid','\"264ce268-e5eb-489e-b0aa-d1238c69da92\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.userCondition','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.warning','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.elements.0.width','100'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.name','\"Content\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.uid','\"4bd720e4-7517-4017-b274-fec9a28bbbd0\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.fieldLayouts.1921cb29-dd5a-40dd-b559-dbe7be225021.tabs.0.userCondition','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.handle','\"header\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.hasTitleField','true'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.name','\"header\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.section','\"73eeabaf-f915-409a-9a3b-691c8e1c24a5\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.showStatusField','true'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.slugTranslationKeyFormat','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.slugTranslationMethod','\"site\"'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.sortOrder','1'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.titleFormat','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.titleTranslationKeyFormat','null'),('entryTypes.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6.titleTranslationMethod','\"site\"'),('fieldGroups.9603d0d8-6306-462f-a967-b1719be59cd2.name','\"meubels\"'),('fieldGroups.ffc5b93d-e571-4d92-a564-280a8db6237e.name','\"Common\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.columnSuffix','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.contentColumnType','\"string\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.fieldGroup','\"9603d0d8-6306-462f-a967-b1719be59cd2\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.handle','\"meubelImage\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.instructions','\"plaats een nieuwe afbeelding\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.name','\"meubel Image\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.searchable','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.allowedKinds.0','\"image\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.allowedKinds.1','\"video\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.allowSelfRelations','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.allowSubfolders','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.allowUploads','true'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.branchLimit','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.defaultUploadLocationSource','\"volume:538cba14-d0f8-4365-9d15-694d4b417ee0\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.defaultUploadLocationSubpath','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.localizeRelations','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.maintainHierarchy','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.maxRelations','1'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.minRelations','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.previewMode','\"full\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.restrictedDefaultUploadSubpath','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.restrictedLocationSource','\"volume:538cba14-d0f8-4365-9d15-694d4b417ee0\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.restrictedLocationSubpath','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.restrictFiles','true'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.restrictLocation','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.selectionLabel','\"meubel foto toevoegen\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.showSiteMenu','true'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.showUnpermittedFiles','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.showUnpermittedVolumes','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.sources','\"*\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.targetSiteId','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.validateRelatedElements','false'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.settings.viewMode','\"large\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.translationKeyFormat','null'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.translationMethod','\"site\"'),('fields.03727efa-ff38-40c7-806c-c335632b6f1e.type','\"craft\\\\fields\\\\Assets\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.columnSuffix','\"uvymsfej\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.contentColumnType','\"decimal(7,2)\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.fieldGroup','\"ffc5b93d-e571-4d92-a564-280a8db6237e\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.handle','\"prijs\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.instructions','null'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.name','\"prijs\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.searchable','false'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.decimals','2'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.defaultValue','null'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.max','99999'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.min','0'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.prefix','null'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.previewCurrency','null'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.previewFormat','\"decimal\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.size','5'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.settings.suffix','null'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.translationKeyFormat','null'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.translationMethod','\"none\"'),('fields.14004384-f7d8-482a-a0fd-00d8c56b5c8f.type','\"craft\\\\fields\\\\Number\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.columnSuffix','\"esbuwhni\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.contentColumnType','\"char(7)\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.fieldGroup','\"ffc5b93d-e571-4d92-a564-280a8db6237e\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.handle','\"secundair\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.instructions','\"kies een kleur, dit is de 2e meest voorkomende kleur. \"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.name','\"secundair\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.searchable','false'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.settings.defaultColor','null'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.translationKeyFormat','null'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.translationMethod','\"none\"'),('fields.73298fc0-1360-40e5-9779-65679d8b687f.type','\"craft\\\\fields\\\\Color\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.columnSuffix','\"ykpxmovf\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.contentColumnType','\"char(7)\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.fieldGroup','\"ffc5b93d-e571-4d92-a564-280a8db6237e\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.handle','\"primair\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.instructions','\"kies een kleur, deze gaat het meest voorkomen op de website.\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.name','\"primair\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.searchable','false'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.settings.defaultColor','null'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.translationKeyFormat','null'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.translationMethod','\"none\"'),('fields.7402ea87-64ac-4830-8443-55224c25a6e2.type','\"craft\\\\fields\\\\Color\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.columnSuffix','\"xcfhxgvw\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.contentColumnType','\"char(7)\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.fieldGroup','\"ffc5b93d-e571-4d92-a564-280a8db6237e\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.handle','\"zwart\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.instructions','\"dit is de standaard zwart kleur, alles wat zwart is veranderd dan.\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.name','\"zwart\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.searchable','false'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.settings.defaultColor','null'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.translationKeyFormat','null'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.translationMethod','\"none\"'),('fields.9c8665f7-e2f0-4f43-8468-f3d31c375024.type','\"craft\\\\fields\\\\Color\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.columnSuffix','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.contentColumnType','\"string\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.fieldGroup','\"ffc5b93d-e571-4d92-a564-280a8db6237e\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.handle','\"categorien\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.instructions','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.name','\"categorien\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.searchable','false'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.allowSelfRelations','false'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.branchLimit','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.localizeRelations','false'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.maintainHierarchy','false'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.maxRelations','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.minRelations','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.selectionLabel','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.showSiteMenu','true'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.source','\"group:5a1d0dff-e9b9-4313-af3b-69517129c377\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.targetSiteId','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.validateRelatedElements','false'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.settings.viewMode','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.translationKeyFormat','null'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.translationMethod','\"site\"'),('fields.ae7581b7-0a02-409f-aeab-de5ba0d6eb81.type','\"craft\\\\fields\\\\Categories\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.columnSuffix','\"pgfoymjv\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.contentColumnType','\"text\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.fieldGroup','\"9603d0d8-6306-462f-a967-b1719be59cd2\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.handle','\"beschrijving\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.instructions','\"korte beschrijving van de meubel\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.name','\"beschrijving\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.searchable','true'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.byteLimit','null'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.charLimit','500'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.code','false'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.columnType','null'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.initialRows','4'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.multiline','false'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.placeholder','null'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.settings.uiMode','\"normal\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.translationKeyFormat','null'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.translationMethod','\"none\"'),('fields.cc200480-e5ff-46b1-b444-92d3798e09c8.type','\"craft\\\\fields\\\\PlainText\"'),('fs.images.hasUrls','true'),('fs.images.name','\"images\"'),('fs.images.settings.path','\"@webroot/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"@web/images\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elementCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.elementCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.fieldUid','\"7402ea87-64ac-4830-8443-55224c25a6e2\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.instructions','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.label','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.required','false'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.tip','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.uid','\"b683fef3-b7bb-4911-98e5-35bfb6ad6239\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.userCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.warning','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.0.width','100'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.elementCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.fieldUid','\"73298fc0-1360-40e5-9779-65679d8b687f\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.instructions','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.label','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.required','false'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.tip','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.uid','\"11f256f4-07f1-42de-ba39-bb5d7cd89ad9\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.userCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.warning','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.1.width','100'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.elementCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.fieldUid','\"9c8665f7-e2f0-4f43-8468-f3d31c375024\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.instructions','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.label','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.required','false'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.tip','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.uid','\"408fcff8-346f-4bf0-91de-4a3ec0e8daec\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.userCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.warning','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.elements.2.width','100'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.name','\"kleur\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.uid','\"2cca6dbe-82fe-4b9f-83ec-1d94ef0ea686\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.fieldLayouts.178c18a4-61e1-476c-80bd-066394a35161.tabs.0.userCondition','null'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.handle','\"kleuren\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.name','\"kleuren\"'),('globalSets.81cec9b8-d078-4d2d-9966-301f621d9ee3.sortOrder','1'),('graphql.schemas.d18e0f7b-f2f7-43ab-9cf8-34769f47adcc.isPublic','true'),('graphql.schemas.d18e0f7b-f2f7-43ab-9cf8-34769f47adcc.name','\"Public Schema\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.fill','\"transparent\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.format','null'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.handle','\"medium\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.height','200'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.interlace','\"none\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.mode','\"letterbox\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.name','\"medium\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.position','\"center-center\"'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.quality','null'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.upscale','true'),('imageTransforms.0ff5a263-8c10-4c1b-a77c-896c4d48e41e.width','200'),('meta.__names__.03727efa-ff38-40c7-806c-c335632b6f1e','\"meubel Image\"'),('meta.__names__.0ff5a263-8c10-4c1b-a77c-896c4d48e41e','\"medium\"'),('meta.__names__.14004384-f7d8-482a-a0fd-00d8c56b5c8f','\"prijs\"'),('meta.__names__.1a746295-d744-470d-bfb7-0cb596b068af','\"meubels\"'),('meta.__names__.538cba14-d0f8-4365-9d15-694d4b417ee0','\"meubels\"'),('meta.__names__.5a1d0dff-e9b9-4313-af3b-69517129c377','\"Productcategorieën\"'),('meta.__names__.6c94ac7a-b785-4446-a27b-beeecd5ff68b','\"examen-Jonas-van-roy\"'),('meta.__names__.7191d1fe-0469-4222-8421-739013ce3494','\"meubels\"'),('meta.__names__.73298fc0-1360-40e5-9779-65679d8b687f','\"secundair\"'),('meta.__names__.73eeabaf-f915-409a-9a3b-691c8e1c24a5','\"header\"'),('meta.__names__.7402ea87-64ac-4830-8443-55224c25a6e2','\"primair\"'),('meta.__names__.75d00fd6-59d1-4155-8a76-00491194e8ff','\"examen-Jonas-van-roy\"'),('meta.__names__.81cec9b8-d078-4d2d-9966-301f621d9ee3','\"kleuren\"'),('meta.__names__.8f9949a3-ec4d-4266-8aa2-f8a69dbe9ac6','\"header\"'),('meta.__names__.9603d0d8-6306-462f-a967-b1719be59cd2','\"meubels\"'),('meta.__names__.9c8665f7-e2f0-4f43-8468-f3d31c375024','\"zwart\"'),('meta.__names__.ae7581b7-0a02-409f-aeab-de5ba0d6eb81','\"categorien\"'),('meta.__names__.cc200480-e5ff-46b1-b444-92d3798e09c8','\"beschrijving\"'),('meta.__names__.d18e0f7b-f2f7-43ab-9cf8-34769f47adcc','\"Public Schema\"'),('meta.__names__.ffc5b93d-e571-4d92-a564-280a8db6237e','\"Common\"'),('plugins.altify.edition','\"standard\"'),('plugins.altify.enabled','true'),('plugins.altify.schemaVersion','\"1.0.0\"'),('plugins.altify.settings.altTextGenerator','null'),('plugins.altify.settings.altTextTranslator','null'),('plugins.altify.settings.deeplApiKey','null'),('plugins.altify.settings.huggingFaceApiToken','\"F&DGDD63I9Z!N+PV1AQYJW6&KY2%ESIIL54D6GVF$Q6M9EQWN+ JC49A%$7RT91=C9+S&E!E#F4Y9M$QCYKD*2M%TN/T/L5=48G&2 WWHJKEC#HA8KC!8/!4BHC3R$L4QY4XR#U$0X$015H173#BA8=W Q2K%L6R=KAG0MMHF*VHBOBUBDJHR4SPBTVC1E/K65/^LZGS^WD YJD/+7V5LVHJ!RLYK5$DLAS=%D#46YZPNY%3HMWT7$0/37X=3!\"'),('plugins.altify.settings.wordsBlackList.0','\"arafed\"'),('plugins.altify.settings.wordsBlackList.1','\"araffes\"'),('plugins.altify.settings.wordsBlackList.2','\"araffe\"'),('plugins.dumper.edition','\"standard\"'),('plugins.dumper.enabled','true'),('plugins.dumper.schemaVersion','\"1.0.0\"'),('plugins.element-api.edition','\"standard\"'),('plugins.element-api.enabled','true'),('plugins.element-api.schemaVersion','\"1.0.0\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.defaultPlacement','\"end\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.enableVersioning','true'),('sections.7191d1fe-0469-4222-8421-739013ce3494.handle','\"meubels\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.name','\"meubels\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.propagationMethod','\"all\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.enabledByDefault','true'),('sections.7191d1fe-0469-4222-8421-739013ce3494.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.hasUrls','true'),('sections.7191d1fe-0469-4222-8421-739013ce3494.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.template','\"drinks/_entry\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.uriFormat','\"drinks/{slug}\"'),('sections.7191d1fe-0469-4222-8421-739013ce3494.type','\"channel\"'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.defaultPlacement','\"end\"'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.enableVersioning','true'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.handle','\"header\"'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.name','\"header\"'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.propagationMethod','\"all\"'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.enabledByDefault','true'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.hasUrls','false'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.template','null'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.siteSettings.75d00fd6-59d1-4155-8a76-00491194e8ff.uriFormat','null'),('sections.73eeabaf-f915-409a-9a3b-691c8e1c24a5.type','\"single\"'),('siteGroups.6c94ac7a-b785-4446-a27b-beeecd5ff68b.name','\"examen-Jonas-van-roy\"'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.handle','\"default\"'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.hasUrls','true'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.language','\"en-US\"'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.name','\"examen-Jonas-van-roy\"'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.primary','true'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.siteGroup','\"6c94ac7a-b785-4446-a27b-beeecd5ff68b\"'),('sites.75d00fd6-59d1-4155-8a76-00491194e8ff.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"examen-Jonas-van-roy\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elementCondition','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.autocapitalize','true'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.autocomplete','false'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.autocorrect','true'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.class','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.disabled','false'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.elementCondition','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.id','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.inputType','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.instructions','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.label','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.max','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.min','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.name','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.orientation','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.placeholder','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.readonly','false'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.requirable','false'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.size','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.step','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.tip','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.title','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.uid','\"47b69dff-2552-48d1-b7c9-cbbc19bf087c\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.userCondition','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.warning','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.elements.0.width','100'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.name','\"Content\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.uid','\"9f8455d6-db97-4efc-8d4d-26b9484ddb4a\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fieldLayouts.b98d6397-56db-4190-8264-c3433ab0bbf1.tabs.0.userCondition','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.fs','\"images\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.handle','\"meubels\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.name','\"meubels\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.sortOrder','1'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.titleTranslationKeyFormat','null'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.titleTranslationMethod','\"site\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.transformFs','\"\"'),('volumes.538cba14-d0f8-4365-9d15-694d4b417ee0.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `queue` VALUES (454,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:169;}','Generate alt text',1723747722,300,0,1024,'2024-08-15 18:48:42',1723747722,0,NULL,1,1,'2024-08-15 18:48:43','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(462,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:172;}','Generate alt text',1723747829,300,0,1024,'2024-08-15 18:50:29',1723747829,0,NULL,1,1,'2024-08-15 18:50:30','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(470,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:175;}','Generate alt text',1723747848,300,0,1024,'2024-08-15 18:50:48',1723747848,0,NULL,1,1,'2024-08-15 18:50:49','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(477,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:178;}','Generate alt text',1723747859,300,0,1024,'2024-08-15 18:51:00',1723747860,0,NULL,1,1,'2024-08-15 18:51:02','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(484,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:181;}','Generate alt text',1723747871,300,0,1024,'2024-08-15 18:51:11',1723747871,0,NULL,1,1,'2024-08-15 18:51:12','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(491,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:184;}','Generate alt text',1723747883,300,0,1024,'2024-08-15 18:51:23',1723747883,0,NULL,1,1,'2024-08-15 18:51:24','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(498,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:187;}','Generate alt text',1723747899,300,0,1024,'2024-08-15 18:51:39',1723747899,0,NULL,1,1,'2024-08-15 18:51:43','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(505,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:190;}','Generate alt text',1723747912,300,0,1024,'2024-08-15 18:51:52',1723747912,0,NULL,1,1,'2024-08-15 18:51:55','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n'),(512,'queue','O:32:\"fork\\altify\\jobs\\GenerateAltText\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:7:\"assetId\";i:193;}','Generate alt text',1723747924,300,0,1024,'2024-08-15 18:52:04',1723747924,0,NULL,1,1,'2024-08-15 18:52:05','Client error: `POST https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large` resulted in a `400 Bad Request` response:\n{\"error\":\"Authorization header is correct, but the token seems invalid\"}\n');
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (3,10,6,NULL,4,1,'2024-01-10 10:14:19','2024-01-10 10:14:19','105a3046-94f8-4441-9451-f897624092f4'),(5,10,15,NULL,8,1,'2024-01-10 12:05:44','2024-01-10 12:05:44','e3efea4c-a998-4d5d-8baf-c46ec72e2c2f'),(7,10,17,NULL,10,1,'2024-01-10 12:33:42','2024-01-10 12:33:42','0a0f9c9d-e1b6-4e03-8293-1c3ae2e89c38'),(9,10,19,NULL,12,1,'2024-01-10 12:36:08','2024-01-10 12:36:08','c4ae3739-bfdf-46c2-ac8a-a9aed729c38d'),(11,10,21,NULL,13,1,'2024-01-10 12:36:44','2024-01-10 12:36:44','3fc5f51c-603f-4e3e-9734-7f6bd90325bf'),(13,10,23,NULL,14,1,'2024-01-10 12:37:20','2024-01-10 12:37:20','e6229527-0845-4eeb-a977-ffba3923a965'),(15,10,25,NULL,11,1,'2024-01-10 12:38:09','2024-01-10 12:38:09','0241f9a3-a4d3-4069-898c-fea30e0e6eb0'),(16,10,28,NULL,11,1,'2024-01-10 12:39:53','2024-01-10 12:39:53','5ff51458-f722-4160-84aa-eb5611941baf'),(19,10,30,NULL,9,1,'2024-01-10 12:40:05','2024-01-10 12:40:05','29a1f551-291b-493a-a7e2-b6229920f807'),(20,10,31,NULL,14,1,'2024-01-10 12:40:09','2024-01-10 12:40:09','723027c1-1b70-46d1-875e-357b721e2fe8'),(21,10,32,NULL,12,1,'2024-01-10 12:40:12','2024-01-10 12:40:12','eef3625b-8108-4ea0-9085-71a03fe915ff'),(22,10,33,NULL,13,1,'2024-01-10 12:40:15','2024-01-10 12:40:15','9d093de4-25e7-4212-93d5-1ecaaaab6112'),(23,10,34,NULL,10,1,'2024-01-10 12:40:19','2024-01-10 12:40:19','3c66d6f4-bde6-42fa-bffb-b817bf57434a'),(24,10,35,NULL,8,1,'2024-01-10 12:40:23','2024-01-10 12:40:23','27a2ae93-d00b-4fad-80f4-c115cd775f72'),(25,10,36,NULL,4,1,'2024-01-10 12:40:26','2024-01-10 12:40:26','f148207b-ed28-4c9c-970f-6ef375309813'),(26,10,37,NULL,11,1,'2024-01-10 12:40:55','2024-01-10 12:40:55','6c1ac417-a0d9-4fc2-bdd6-927c63472052'),(27,10,38,NULL,9,1,'2024-01-10 12:41:02','2024-01-10 12:41:02','de3de4f4-4789-4487-a2f2-59e6b46b710a'),(28,10,39,NULL,12,1,'2024-01-10 12:41:07','2024-01-10 12:41:07','6638c9de-580c-42ff-9200-3d978cbea1b2'),(30,10,41,NULL,11,1,'2024-01-10 12:41:17','2024-01-10 12:41:17','d95ce853-4cbb-44ce-8bcf-73c716effe7b'),(32,10,43,NULL,11,1,'2024-01-10 12:41:49','2024-01-10 12:41:49','3bb9c323-ee66-4473-8e94-661f744d6d79'),(34,10,46,NULL,11,1,'2024-01-10 14:14:05','2024-01-10 14:14:05','7a207dc6-6f4e-4731-b3b8-f4f29b70f3d8'),(39,10,52,NULL,11,1,'2024-01-10 15:37:00','2024-01-10 15:37:00','7eccb828-4ec3-492a-b820-1dad3dc102c6'),(46,10,54,NULL,58,1,'2024-01-10 19:01:09','2024-01-10 19:01:09','8bd74ef0-c650-454f-a94e-66b856ee941a'),(47,10,60,NULL,58,1,'2024-01-10 19:01:09','2024-01-10 19:01:09','cf3f92d5-65f4-41ed-a7e6-88d45381556c'),(49,10,62,NULL,9,1,'2024-01-10 19:31:00','2024-01-10 19:31:00','509fd802-7018-46ad-9b54-45463f61b41e'),(50,10,63,NULL,14,1,'2024-01-10 19:31:05','2024-01-10 19:31:05','21654a52-374a-46dd-8774-21c6b070e3cb'),(52,10,65,NULL,12,1,'2024-01-10 19:31:14','2024-01-10 19:31:14','c917416f-d04d-47fe-847a-0f933c319731'),(54,10,67,NULL,10,1,'2024-01-10 19:31:22','2024-01-10 19:31:22','87987aca-f6db-4e97-88f0-692429c42a2e'),(56,10,69,NULL,8,1,'2024-01-10 19:31:35','2024-01-10 19:31:35','f46fe5de-73af-456e-95d6-9a92cd6179b3'),(58,10,71,NULL,4,1,'2024-01-10 19:31:42','2024-01-10 19:31:42','ec38c72e-3cdc-4314-b95e-679878c9844a'),(59,10,72,NULL,11,1,'2024-01-11 14:53:03','2024-01-11 14:53:03','981357ed-0d8d-4d70-bf41-d6e8a9eb9a32'),(61,10,74,NULL,11,1,'2024-01-11 14:53:17','2024-01-11 14:53:17','1fdbc563-ea7d-45dc-b478-ba77bd15e45c'),(63,10,76,NULL,11,1,'2024-01-11 14:55:53','2024-01-11 14:55:53','5c77a260-0823-47d9-8221-abf1c0be690f'),(65,10,78,NULL,11,1,'2024-01-11 14:56:07','2024-01-11 14:56:07','c9048f6a-2f61-4e65-a63a-29cfa30dc57e'),(67,10,80,NULL,11,1,'2024-01-11 15:38:51','2024-01-11 15:38:51','24d50fcc-c673-4af5-9297-45509d5e4e09'),(69,10,82,NULL,11,1,'2024-01-11 15:39:15','2024-01-11 15:39:15','899e284a-24c2-4484-bd33-d95d4523e549'),(70,10,84,NULL,11,1,'2024-08-13 10:04:16','2024-08-13 10:04:16','cd55e10f-27fc-4d28-a897-bba5798fc231'),(73,10,24,NULL,90,1,'2024-08-13 11:44:25','2024-08-13 11:44:25','ffeef8e8-1551-476d-ada1-91b0a3a3ba7c'),(74,10,99,NULL,90,1,'2024-08-13 11:44:25','2024-08-13 11:44:25','efa2ec4b-5d98-42f8-bbad-12fe66b207f8'),(75,10,83,NULL,97,1,'2024-08-13 12:43:33','2024-08-13 12:43:33','e659b2bf-e88e-4106-9ba0-0bda7f724c95'),(76,10,100,NULL,97,1,'2024-08-13 12:43:45','2024-08-13 12:43:45','04aee1e5-f1dc-4872-b75c-0be9252ce1d1'),(80,10,102,NULL,87,1,'2024-08-13 12:54:51','2024-08-13 12:54:51','aa8cd5e0-5f9a-42b5-9257-7b0f5cd9fff1'),(84,10,104,NULL,97,1,'2024-08-13 12:55:46','2024-08-13 12:55:46','74b69bf3-bf75-41da-95a0-89605aee0b60'),(88,10,106,NULL,88,1,'2024-08-13 12:56:51','2024-08-13 12:56:51','48966a59-197f-471b-a2eb-c5bead7a22f0'),(89,10,107,NULL,13,1,'2024-08-13 13:06:39','2024-08-13 13:06:39','55583610-d40b-4a12-acdd-be4aa1665103'),(90,10,108,NULL,88,1,'2024-08-13 13:14:28','2024-08-13 13:14:28','f29e6864-1bac-4da2-948a-d340eeb11cc7'),(94,10,110,NULL,93,1,'2024-08-13 13:15:08','2024-08-13 13:15:08','03cfda0f-d0d7-4f37-b348-b344fa8ff36e'),(98,10,112,NULL,95,1,'2024-08-13 13:16:42','2024-08-13 13:16:42','19a034a3-c0b6-4068-a173-6e6c8973a7e9'),(102,10,114,NULL,91,1,'2024-08-13 13:17:50','2024-08-13 13:17:50','5b7aa178-09f1-4d33-886c-6f5f52f9c3c2'),(106,10,116,NULL,89,1,'2024-08-13 13:18:24','2024-08-13 13:18:24','fd7851e2-49c2-4275-8372-dfda2ba84726'),(108,10,118,NULL,90,1,'2024-08-14 09:37:47','2024-08-14 09:37:47','686fb8c2-7018-4250-851d-78f6e1958937'),(109,10,121,NULL,87,1,'2024-08-14 13:31:25','2024-08-14 13:31:25','805045dd-1b14-4ab1-9b94-4c0507f10beb'),(110,10,122,NULL,87,1,'2024-08-14 13:32:38','2024-08-14 13:32:38','e6328943-6626-40a4-8017-413e32e67769'),(111,10,125,NULL,87,1,'2024-08-14 13:41:35','2024-08-14 13:41:35','d8de8a4f-3ee8-42da-885f-100f564878f4'),(112,10,130,NULL,87,1,'2024-08-14 13:43:21','2024-08-14 13:43:21','dd1e5fb6-2fa4-4847-97b1-660d21e6fcd8'),(113,10,131,NULL,90,1,'2024-08-14 13:44:51','2024-08-14 13:44:51','ee2ff9e4-7b1f-45bc-a028-6e162eae194d'),(114,10,132,NULL,87,1,'2024-08-14 13:45:18','2024-08-14 13:45:18','85b21d90-e779-47f6-8244-6a6b0abd4f4a'),(115,10,133,NULL,90,1,'2024-08-14 13:47:57','2024-08-14 13:47:57','574a18b7-34b4-411c-ab61-573a76364666'),(116,10,135,NULL,87,1,'2024-08-14 13:51:24','2024-08-14 13:51:24','eade78c8-c76b-4ddc-a3cb-64da8e7e574d'),(119,22,26,NULL,128,1,'2024-08-14 13:52:36','2024-08-14 13:52:36','31ce77bd-4056-4803-9e42-c7fdc3c1f9fc'),(120,10,137,NULL,87,1,'2024-08-14 13:52:36','2024-08-14 13:52:36','6de139f7-6e20-454f-9f22-66ecb46874e7'),(121,22,137,NULL,128,1,'2024-08-14 13:52:36','2024-08-14 13:52:36','a30133ca-c4c0-438a-9345-318b47309789'),(124,22,117,NULL,128,1,'2024-08-14 13:52:44','2024-08-14 13:52:44','013fe63d-3b5c-45f0-8b95-b6c77176b072'),(125,10,139,NULL,90,1,'2024-08-14 13:52:44','2024-08-14 13:52:44','a4461454-4c61-40c8-8b4d-fbbdc7e72608'),(126,22,139,NULL,128,1,'2024-08-14 13:52:44','2024-08-14 13:52:44','9d29c115-dec1-4f4d-a581-b19f98b86936'),(129,22,22,NULL,127,1,'2024-08-14 13:52:52','2024-08-14 13:52:52','ae9a300e-416d-4246-8f29-d001a104eb4f'),(130,10,141,NULL,97,1,'2024-08-14 13:52:52','2024-08-14 13:52:52','219bc782-6b8d-4ce5-aa1e-7ba86c785f3b'),(131,22,141,NULL,127,1,'2024-08-14 13:52:52','2024-08-14 13:52:52','3d279e34-b5e8-4a9d-b9e6-0959e1d9fae9'),(134,22,18,NULL,129,1,'2024-08-14 13:53:02','2024-08-14 13:53:02','438d647c-4531-478e-85e9-fe077834d960'),(135,10,143,NULL,88,1,'2024-08-14 13:53:02','2024-08-14 13:53:02','a72064eb-e712-4a65-aa8b-e0d397fc93f0'),(136,22,143,NULL,129,1,'2024-08-14 13:53:02','2024-08-14 13:53:02','9e30cc6a-7997-4d4c-8941-344b7d2b6b8e'),(139,22,20,NULL,128,1,'2024-08-14 13:53:12','2024-08-14 13:53:12','ff374105-f005-4ea1-9133-35890a43fe96'),(140,10,145,NULL,93,1,'2024-08-14 13:53:12','2024-08-14 13:53:12','bba1ce11-d820-4a7c-8ce1-8977b17bc248'),(141,22,145,NULL,128,1,'2024-08-14 13:53:12','2024-08-14 13:53:12','06938764-c442-42e5-b283-a4285e0c4dca'),(144,22,16,NULL,128,1,'2024-08-14 13:53:20','2024-08-14 13:53:20','259ec1f4-4838-4465-8b0f-decaa43a9c13'),(145,10,147,NULL,95,1,'2024-08-14 13:53:20','2024-08-14 13:53:20','61dadcf3-d897-4264-bd11-9a6bd2aac920'),(146,22,147,NULL,128,1,'2024-08-14 13:53:20','2024-08-14 13:53:20','01e83b9f-82b6-4721-8fae-2a13a26c7b42'),(149,22,7,NULL,127,1,'2024-08-14 13:53:29','2024-08-14 13:53:29','70ec9198-03ce-4fbc-84fc-70189251886d'),(150,10,149,NULL,91,1,'2024-08-14 13:53:29','2024-08-14 13:53:29','3f19a326-1c97-492a-b2b0-33aa86424381'),(151,22,149,NULL,127,1,'2024-08-14 13:53:29','2024-08-14 13:53:29','1cfb721b-d915-43e6-9415-7a7718bf2bdf'),(154,22,2,NULL,129,1,'2024-08-14 13:53:39','2024-08-14 13:53:39','e53b57d1-501a-4eb8-b50b-f21c8f757b8d'),(155,10,151,NULL,89,1,'2024-08-14 13:53:39','2024-08-14 13:53:39','0596a780-c16c-4752-b1f0-9d905ffda8b9'),(156,22,151,NULL,129,1,'2024-08-14 13:53:39','2024-08-14 13:53:39','5513c7d6-d735-4d8d-be29-da08ca8d3631'),(157,10,152,NULL,87,1,'2024-08-14 14:38:25','2024-08-14 14:38:25','377af4fa-1596-4748-b80b-9bccbb49b127'),(158,22,152,NULL,128,1,'2024-08-14 14:38:25','2024-08-14 14:38:25','2a829b68-a9aa-444a-9828-6938a2633849'),(159,10,155,NULL,88,1,'2024-08-15 13:43:16','2024-08-15 13:43:16','c3c685c9-3cd0-4046-b2be-72bb06916f2b'),(160,22,155,NULL,129,1,'2024-08-15 13:43:16','2024-08-15 13:43:16','1e6fbad6-4df8-4b12-b622-9d709e60668d'),(161,10,156,NULL,93,1,'2024-08-15 13:43:16','2024-08-15 13:43:16','05f6f97d-2cdb-4de7-b6ba-de5ccca8543a'),(162,22,156,NULL,128,1,'2024-08-15 13:43:16','2024-08-15 13:43:16','b39bf34d-e0c4-4285-b36d-3fa4dbdf1756'),(163,10,157,NULL,97,1,'2024-08-15 13:43:17','2024-08-15 13:43:17','8012a922-c481-4e06-8e67-2ce83cdf9656'),(164,22,157,NULL,127,1,'2024-08-15 13:43:17','2024-08-15 13:43:17','cdf6fff2-7cf5-4858-9329-2c795a387ede'),(165,10,158,NULL,87,1,'2024-08-15 13:43:17','2024-08-15 13:43:17','12f9cedf-5e05-471b-bccd-cf27bfe5df58'),(166,22,158,NULL,128,1,'2024-08-15 13:43:17','2024-08-15 13:43:17','99675869-566e-45c6-8679-fd2ebc2b4746'),(167,10,159,NULL,90,1,'2024-08-15 13:43:17','2024-08-15 13:43:17','814018dd-0e51-47a5-b27c-269e2b59392a'),(168,22,159,NULL,128,1,'2024-08-15 13:43:17','2024-08-15 13:43:17','515f0873-7448-49ef-af94-4e514805c298'),(169,10,160,NULL,88,1,'2024-08-15 13:43:36','2024-08-15 13:43:36','e57719f9-90ab-4e75-8ace-852e56b63e69'),(170,22,160,NULL,129,1,'2024-08-15 13:43:36','2024-08-15 13:43:36','e8c6f9a2-7e25-43cd-994e-13e394138c6a'),(171,10,161,NULL,93,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','6cb7217c-e1a0-4a1f-98de-f5d7d84a44d6'),(172,22,161,NULL,128,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','5524466a-c766-4d1c-abc3-550834d5cfe7'),(173,10,162,NULL,97,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','7207148e-9494-4665-897c-5c89d839d57e'),(174,22,162,NULL,127,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','1045dbf8-846c-4b1f-b28d-6a51eb48f129'),(175,10,163,NULL,87,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','54b80f3f-dcd4-42eb-b6da-8d7c4ca602eb'),(176,22,163,NULL,128,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','8b934e36-423b-4f0a-967b-10bbb180a4e7'),(177,10,164,NULL,90,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','d2d2240c-d270-4a66-8a9d-f01e1659e56c'),(178,22,164,NULL,128,1,'2024-08-15 13:43:37','2024-08-15 13:43:37','9b9dd38a-4dad-4382-a0f2-599f39463b2d'),(183,10,170,NULL,169,1,'2024-08-15 18:48:45','2024-08-15 18:48:45','5de1a31d-fe2b-41dc-9be3-5ff146cccc88'),(184,22,170,NULL,128,1,'2024-08-15 18:48:45','2024-08-15 18:48:45','969200cc-b9f2-4051-adc9-6eb5abbea5da'),(188,10,26,NULL,172,1,'2024-08-15 18:50:30','2024-08-15 18:50:30','bec37001-33ad-432d-b66d-449848951cb3'),(189,10,173,NULL,172,1,'2024-08-15 18:50:30','2024-08-15 18:50:30','907d9593-81de-44fc-be61-b316e5dd1d3b'),(190,22,173,NULL,128,1,'2024-08-15 18:50:30','2024-08-15 18:50:30','ed3c1c02-99ff-4605-927e-0355fb25aad2'),(194,10,117,NULL,175,1,'2024-08-15 18:50:49','2024-08-15 18:50:49','8ced947a-896a-4e9f-a630-df9487defbd6'),(195,10,176,NULL,175,1,'2024-08-15 18:50:49','2024-08-15 18:50:49','07272e86-d000-484e-ae5f-7d71d79c7242'),(196,22,176,NULL,128,1,'2024-08-15 18:50:49','2024-08-15 18:50:49','2e6905a8-d795-42cc-9fdf-508ae766701d'),(200,10,22,NULL,178,1,'2024-08-15 18:51:01','2024-08-15 18:51:01','62640741-06f8-421a-875c-bec14905e4e0'),(201,10,179,NULL,178,1,'2024-08-15 18:51:01','2024-08-15 18:51:01','d70c5782-8d46-4e25-95f9-1bbae8decd46'),(202,22,179,NULL,127,1,'2024-08-15 18:51:01','2024-08-15 18:51:01','ec168a6e-31c2-44a7-ab59-e12d19f19056'),(206,10,18,NULL,181,1,'2024-08-15 18:51:12','2024-08-15 18:51:12','5912247b-0e9b-470d-8a95-ab27ca655479'),(207,10,182,NULL,181,1,'2024-08-15 18:51:12','2024-08-15 18:51:12','b31533c4-3d01-4c23-a4ea-6b238eb3b752'),(208,22,182,NULL,129,1,'2024-08-15 18:51:12','2024-08-15 18:51:12','585a7133-3e61-48e9-96a7-40135ed0a251'),(212,10,20,NULL,184,1,'2024-08-15 18:51:25','2024-08-15 18:51:25','3ef74241-8a51-4eda-8862-843f7f44b9a2'),(213,10,185,NULL,184,1,'2024-08-15 18:51:25','2024-08-15 18:51:25','eee25bd8-b035-48e5-aeb3-bd764e117e1e'),(214,22,185,NULL,128,1,'2024-08-15 18:51:25','2024-08-15 18:51:25','c82269dd-67ce-409e-90ec-179c17c17eca'),(218,10,16,NULL,187,1,'2024-08-15 18:51:43','2024-08-15 18:51:43','c5161558-1441-4d97-b29c-09e7398bb74c'),(219,10,188,NULL,187,1,'2024-08-15 18:51:43','2024-08-15 18:51:43','c53114a9-91e1-455d-bd42-72ddcb92b579'),(220,22,188,NULL,128,1,'2024-08-15 18:51:43','2024-08-15 18:51:43','4e6fd0fd-e412-4387-a282-80e793776687'),(224,10,7,NULL,190,1,'2024-08-15 18:51:53','2024-08-15 18:51:53','7ac01700-1b63-4a24-a849-a37291b330f7'),(225,10,191,NULL,190,1,'2024-08-15 18:51:53','2024-08-15 18:51:53','1076fc0e-a97e-4a90-8f8c-2fbaf2bca120'),(226,22,191,NULL,127,1,'2024-08-15 18:51:53','2024-08-15 18:51:53','bac27c9f-b4a1-4743-97c7-802e44957bf5'),(230,10,2,NULL,193,1,'2024-08-15 18:52:06','2024-08-15 18:52:06','44bd5201-eead-4753-9a46-71f2328f4d20'),(231,10,194,NULL,193,1,'2024-08-15 18:52:06','2024-08-15 18:52:06','93392468-a4ef-43d7-aa45-5837bd4d24c5'),(232,22,194,NULL,129,1,'2024-08-15 18:52:06','2024-08-15 18:52:06','04600b91-9c11-467d-9008-77adfa09983f');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,2,1,2,'Applied “Draft 1”'),(3,7,1,1,''),(4,16,1,1,''),(5,18,1,1,''),(6,20,1,1,''),(7,22,1,1,''),(8,24,1,1,''),(9,26,1,1,''),(10,24,1,2,''),(11,26,1,2,'Applied “Draft 1”'),(12,22,1,2,''),(13,18,1,2,''),(14,20,1,2,''),(15,16,1,2,''),(16,7,1,2,''),(17,2,1,3,''),(18,24,1,3,''),(19,26,1,3,''),(20,18,1,3,''),(21,24,1,4,'Applied “Draft 1”'),(22,24,1,5,'Applied “Draft 1”'),(23,24,1,6,'Applied “Draft 1”'),(24,47,1,1,NULL),(25,47,1,2,NULL),(26,24,1,7,'Applied “Draft 1”'),(27,54,1,1,NULL),(28,54,1,2,NULL),(29,54,1,3,NULL),(30,54,1,4,'Applied “Draft 1”'),(31,26,1,4,'Applied “Draft 1”'),(32,22,1,3,''),(33,18,1,4,'Applied “Draft 1”'),(34,16,1,3,'Applied “Draft 1”'),(35,7,1,3,'Applied “Draft 1”'),(36,2,1,4,''),(37,24,1,8,'Applied “Draft 1”'),(38,24,1,9,'Applied “Draft 1”'),(39,24,1,10,''),(40,24,1,11,''),(41,24,1,12,'Applied “Draft 1”'),(42,24,1,13,'Applied “Draft 1”'),(43,24,1,14,''),(44,24,1,15,'Applied “Draft 1”'),(45,24,1,16,'Applied “Draft 1”'),(46,83,1,1,''),(47,26,1,5,'Applied “Draft 1”'),(48,22,1,4,'Applied “Draft 1”'),(49,18,1,5,'Applied “Draft 1”'),(50,20,1,3,''),(51,18,1,6,''),(52,20,1,4,'Applied “Draft 1”'),(53,16,1,4,'Applied “Draft 1”'),(54,7,1,4,'Applied “Draft 1”'),(55,2,1,5,'Applied “Draft 1”'),(56,117,1,1,NULL),(57,26,1,6,''),(58,26,1,7,''),(59,26,1,8,''),(60,26,1,9,''),(61,117,1,2,''),(62,26,1,10,''),(63,117,1,3,''),(64,26,1,11,''),(65,26,1,12,'Applied “Draft 1”'),(66,117,1,4,'Applied “Draft 1”'),(67,22,1,5,'Applied “Draft 1”'),(68,18,1,7,'Applied “Draft 1”'),(69,20,1,5,'Applied “Draft 1”'),(70,16,1,5,'Applied “Draft 1”'),(71,7,1,5,'Applied “Draft 1”'),(72,2,1,6,'Applied “Draft 1”'),(73,26,1,13,''),(74,153,1,1,''),(75,18,1,8,NULL),(76,20,1,6,NULL),(77,22,1,6,NULL),(78,26,1,14,NULL),(79,117,1,5,NULL),(80,18,1,9,NULL),(81,20,1,7,NULL),(82,22,1,7,NULL),(83,26,1,15,NULL),(84,117,1,6,NULL),(85,153,1,2,''),(86,153,1,3,NULL),(87,26,1,16,'Applied “Draft 1”'),(88,26,1,17,'Applied “Draft 1”'),(89,117,1,7,'Applied “Draft 1”'),(90,22,1,8,'Applied “Draft 1”'),(91,18,1,10,'Applied “Draft 1”'),(92,20,1,8,'Applied “Draft 1”'),(93,16,1,6,'Applied “Draft 1”'),(94,7,1,6,'Applied “Draft 1”'),(95,2,1,7,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' r0952480 student thomasmore be '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'field',9,1,' the poet desk by nordic tales was designed by martin d christensen it is an ode to classic handmade scandinavian furniture with an emphasis on high quality materials and attention to details one of the designers wishes was to play with the construction and focus on the use of wedges the wedges gave him the opportunity to create a sturdy and elegant desk without the use of nails screws or glue the wedges also make it possible to take the desk apart '),(2,'slug',0,1,' mojito '),(2,'title',0,1,' poet desk bureau '),(4,'alt',0,1,''),(4,'extension',0,1,' png '),(4,'filename',0,1,' mojito png '),(4,'kind',0,1,' image '),(4,'slug',0,1,''),(4,'title',0,1,' mojito '),(7,'field',9,1,' discover sustainable and functional designs from the danish brand menu uncomplicated tactile design for a scandinavian inspired home that will make everyday life a little more beautiful '),(7,'slug',0,1,' blue lagoon '),(7,'title',0,1,' curiosity cupboard '),(8,'alt',0,1,''),(8,'extension',0,1,' png '),(8,'filename',0,1,' bluelagoon png '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' blue lagoon '),(9,'alt',0,1,''),(9,'extension',0,1,' png '),(9,'filename',0,1,' caipirinha png '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' caipirinha '),(10,'alt',0,1,''),(10,'extension',0,1,' png '),(10,'filename',0,1,' bloody mary png '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' bloody mary '),(11,'alt',0,1,''),(11,'extension',0,1,' png '),(11,'filename',0,1,' cubalibre png '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' cubalibre '),(12,'alt',0,1,''),(12,'extension',0,1,' png '),(12,'filename',0,1,' long island png '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' long island '),(13,'alt',0,1,''),(13,'extension',0,1,' png '),(13,'filename',0,1,' tequilasunrise png '),(13,'kind',0,1,' image '),(13,'slug',0,1,''),(13,'title',0,1,' tequilasunrise '),(14,'alt',0,1,''),(14,'extension',0,1,' png '),(14,'filename',0,1,' sexonthebeach png '),(14,'kind',0,1,' image '),(14,'slug',0,1,''),(14,'title',0,1,' sexonthebeach '),(16,'field',9,1,' the boxit sofas convince with their comfort modularity precision and fit best with your interior the boxit design sofa with armrests looks modern and at the same time appears light and stable thanks to the curved legs thanks to optional corner elements boxit products can be placed in any configuration '),(16,'slug',0,1,' bloody mary '),(16,'title',0,1,' boxit 2 seater '),(18,'field',9,1,' inspired by designer editions nord desk this scandinavian style desk with 2 drawers and attractive curved legs is perfect setting up your computer and small office station for professional practical and stylish looks complete with shelf space for easy storage and access to your documents and papers '),(18,'slug',0,1,' long island '),(18,'title',0,1,' bureau noord walnoot '),(20,'field',9,1,' the moods chair has an extremely customizable concept depending on your interior or mood the moods model can be customized as desired chair with or without armrests fixed or swiveling on a metal or wooden base and in many different fabrics plain or two tone or in artificial leather '),(20,'slug',0,1,' tequila sunrise '),(20,'title',0,1,' stoel mood 91 '),(22,'field',9,1,' beautiful composition in our collection of hanging shelving units finished in the color ral 9003 and with three doors in birch plywood the cabinet also has three different depths 25 35 and 35 cm making it a very attractive piece of furniture from a spatial perspective '),(22,'slug',0,1,' sex on the beach '),(22,'title',0,1,' vakkenkast 180470 '),(24,'field',9,1,' the leolux caruzzo is a top class wing chair a lot of attention has been paid to the design and seating comfort thanks to the high curved backrest the armchair closes you off from your surroundings allowing you the ultimate in relaxation in addition this designer armchair is also a classic addition to your interior '),(24,'slug',0,1,' cuba libre '),(24,'title',0,1,' leolux caruzzo '),(26,'field',9,1,' the rolf benz 684 is a distinctly compact armchair this armchair is an ideal side armchair because of its unique design it always has a beautiful appearance the 684 stands on a swivel base and is also available with a comfortable footstool '),(26,'slug',0,1,' caipirinha '),(26,'title',0,1,' rolf benz 684 fauteuil '),(47,'slug',0,1,' search '),(47,'title',0,1,' search '),(50,'field',11,1,' hier staat alles boven de 4 sterren '),(50,'slug',0,1,' above 4 stars '),(50,'title',0,1,' above 4 stars '),(54,'slug',0,1,' header '),(54,'title',0,1,' header '),(58,'alt',0,1,''),(58,'extension',0,1,' jpg '),(58,'filename',0,1,' alcohol drinks jpg '),(58,'kind',0,1,' image '),(58,'slug',0,1,''),(58,'title',0,1,' alcohol drinks '),(83,'field',9,1,' vakkenkast '),(83,'slug',0,1,' vakken '),(83,'title',0,1,' vakken '),(87,'alt',0,1,''),(87,'extension',0,1,' png '),(87,'filename',0,1,' benz png '),(87,'kind',0,1,' image '),(87,'slug',0,1,''),(87,'title',0,1,' benz '),(88,'alt',0,1,''),(88,'extension',0,1,' png '),(88,'filename',0,1,' bureau png '),(88,'kind',0,1,' image '),(88,'slug',0,1,''),(88,'title',0,1,' bureau '),(89,'alt',0,1,''),(89,'extension',0,1,' png '),(89,'filename',0,1,' bureau2 png '),(89,'kind',0,1,' image '),(89,'slug',0,1,''),(89,'title',0,1,' bureau2 '),(90,'alt',0,1,''),(90,'extension',0,1,' png '),(90,'filename',0,1,' geel png '),(90,'kind',0,1,' image '),(90,'slug',0,1,''),(90,'title',0,1,' geel '),(91,'alt',0,1,''),(91,'extension',0,1,' png '),(91,'filename',0,1,' kast png '),(91,'kind',0,1,' image '),(91,'slug',0,1,''),(91,'title',0,1,' kast '),(92,'alt',0,1,''),(92,'extension',0,1,' webp '),(92,'filename',0,1,' leolux caruzzo 1 600x450 jpg webp '),(92,'kind',0,1,' image '),(92,'slug',0,1,''),(92,'title',0,1,' leolux caruzzo 1 600x450 jpg '),(93,'alt',0,1,''),(93,'extension',0,1,' png '),(93,'filename',0,1,' mood png '),(93,'kind',0,1,' image '),(93,'slug',0,1,''),(93,'title',0,1,' mood '),(94,'alt',0,1,''),(94,'extension',0,1,' webp '),(94,'filename',0,1,' rb684 005 600x450 jpg webp '),(94,'kind',0,1,' image '),(94,'slug',0,1,''),(94,'title',0,1,' rb684 005 600x450 jpg '),(95,'alt',0,1,''),(95,'extension',0,1,' png '),(95,'filename',0,1,' sofa2 png '),(95,'kind',0,1,' image '),(95,'slug',0,1,''),(95,'title',0,1,' sofa2 '),(96,'alt',0,1,''),(96,'extension',0,1,' webp '),(96,'filename',0,1,' sofas webp '),(96,'kind',0,1,' image '),(96,'slug',0,1,''),(96,'title',0,1,' sofas '),(97,'alt',0,1,''),(97,'extension',0,1,' png '),(97,'filename',0,1,' vakkenkast png '),(97,'kind',0,1,' image '),(97,'slug',0,1,''),(97,'title',0,1,' vakkenkast '),(117,'field',9,1,' the leolux caruzzo is a top class wing chair a lot of attention has been paid to the design and seating comfort thanks to the high curved backrest the armchair closes you off from your surroundings allowing you the ultimate in relaxation in addition this designer armchair is also a classic addition to your interior '),(117,'slug',0,1,' cuba libre 2 '),(117,'title',0,1,' leolux caruzzo '),(119,'slug',0,1,''),(120,'slug',0,1,' temp vwtezohikmugdoiacnfxgzvhfbzvxfodndbo '),(120,'title',0,1,''),(123,'slug',0,1,' temp emfodxevuvnijkccreqbqguupxxkgphpncwm '),(123,'title',0,1,''),(124,'slug',0,1,' temp feartjzjcyopouiwagukfhnackwozvlppbtw '),(124,'title',0,1,''),(126,'slug',0,1,' temp hrsfvsdhazlzjlwoqwlojsgldhhyfonfshdn '),(126,'title',0,1,''),(127,'slug',0,1,' kasten '),(127,'title',0,1,' kasten '),(128,'slug',0,1,' stoelen '),(128,'title',0,1,' stoelen '),(129,'slug',0,1,' tafels '),(129,'title',0,1,' tafels '),(134,'slug',0,1,' temp ydwobyvopikdzezdeyneaauieunmnwwxzflk '),(134,'title',0,1,''),(153,'slug',0,1,' furniture '),(153,'title',0,1,' furniture '),(169,'alt',0,1,''),(169,'extension',0,1,' png '),(169,'filename',0,1,' benz 2024 08 15 184841 peim png '),(169,'kind',0,1,' image '),(169,'slug',0,1,''),(169,'title',0,1,' benz '),(172,'alt',0,1,''),(172,'extension',0,1,' png '),(172,'filename',0,1,' benz 2024 08 15 185028 jqur png '),(172,'kind',0,1,' image '),(172,'slug',0,1,''),(172,'title',0,1,' benz '),(175,'alt',0,1,''),(175,'extension',0,1,' png '),(175,'filename',0,1,' geel 2024 08 15 185047 ydnt png '),(175,'kind',0,1,' image '),(175,'slug',0,1,''),(175,'title',0,1,' geel '),(178,'alt',0,1,''),(178,'extension',0,1,' png '),(178,'filename',0,1,' vakkenkast 2024 08 15 185059 gfyb png '),(178,'kind',0,1,' image '),(178,'slug',0,1,''),(178,'title',0,1,' vakkenkast '),(181,'alt',0,1,''),(181,'extension',0,1,' png '),(181,'filename',0,1,' bureau 2024 08 15 185110 ujui png '),(181,'kind',0,1,' image '),(181,'slug',0,1,''),(181,'title',0,1,' bureau '),(184,'alt',0,1,''),(184,'extension',0,1,' png '),(184,'filename',0,1,' mood 2024 08 15 185123 truu png '),(184,'kind',0,1,' image '),(184,'slug',0,1,''),(184,'title',0,1,' mood '),(187,'alt',0,1,''),(187,'extension',0,1,' png '),(187,'filename',0,1,' sofa2 2024 08 15 185134 egxy png '),(187,'kind',0,1,' image '),(187,'slug',0,1,''),(187,'title',0,1,' sofa2 '),(190,'alt',0,1,''),(190,'extension',0,1,' png '),(190,'filename',0,1,' kast 2024 08 15 185151 fbqg png '),(190,'kind',0,1,' image '),(190,'slug',0,1,''),(190,'title',0,1,' kast '),(193,'alt',0,1,''),(193,'extension',0,1,' png '),(193,'filename',0,1,' bureau2 2024 08 15 185204 qeuz png '),(193,'kind',0,1,' image '),(193,'slug',0,1,''),(193,'title',0,1,' bureau2 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'producten','producten','channel',1,'all','end',NULL,'2024-01-06 14:15:47','2024-01-06 14:15:47','2024-01-10 09:33:17','70740227-1048-4e15-ac6f-b0e24fc43e86'),(2,NULL,'Catgorieën','catgorieen','channel',1,'all','end',NULL,'2024-01-06 14:18:01','2024-01-06 14:18:01','2024-01-06 14:18:36','4a56a6f0-1045-4816-b010-a12d9149419a'),(3,NULL,'meer detail','meerDetail','channel',1,'all','end',NULL,'2024-01-06 14:20:52','2024-01-06 14:20:52','2024-01-10 09:33:15','c839c49c-9179-4a65-b202-14af4eafa8c4'),(4,NULL,'meubels','meubels','channel',1,'all','end',NULL,'2024-01-10 09:36:35','2024-08-13 12:32:23',NULL,'7191d1fe-0469-4222-8421-739013ce3494'),(5,NULL,'search','search','single',1,'all','end',NULL,'2024-01-10 14:50:54','2024-01-10 14:50:54','2024-01-10 15:03:36','283ab241-99e2-4e68-98f7-44e306ec92d2'),(6,NULL,'header','header','single',1,'all','end',NULL,'2024-01-10 18:59:34','2024-01-10 18:59:34','2024-01-10 19:31:55','3ca88fe1-04dc-4af5-a92d-d61b6e603b74'),(7,NULL,'stoel','stoel','channel',1,'all','end',NULL,'2024-08-14 09:28:59','2024-08-14 09:28:59','2024-08-15 13:19:31','f66ba2f3-c595-421b-8828-6f32eb59b5e1'),(8,NULL,'tafel','tafel','channel',1,'all','end',NULL,'2024-08-14 09:30:27','2024-08-14 09:30:27','2024-08-15 13:19:34','2a357276-674a-489f-9343-89fc60b06732'),(9,NULL,'kast','kast','channel',1,'all','end',NULL,'2024-08-14 09:33:37','2024-08-14 09:33:37','2024-08-15 13:19:28','f382ef1f-e28f-4cd5-b8cf-36149db721a5'),(10,NULL,'header','header','single',1,'all','end',NULL,'2024-08-15 13:28:21','2024-08-15 16:37:00',NULL,'73eeabaf-f915-409a-9a3b-691c8e1c24a5');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'producten/{slug}','producten/_entry',1,'2024-01-06 14:15:47','2024-01-06 14:15:47','71c7b575-d26b-49c7-aa7b-adcc89b25b9a'),(2,2,1,1,'catgorieen/{slug}','catgorieen/_entry',1,'2024-01-06 14:18:01','2024-01-06 14:18:01','012aa659-1c93-4198-851b-376ae12e9268'),(3,3,1,1,'meer-detail/{slug}','meer-detail/_entry',1,'2024-01-06 14:20:52','2024-01-06 14:20:52','ef6e8182-5b81-41bd-bb1e-2844dea3903e'),(4,4,1,1,'drinks/{slug}','drinks/_entry',1,'2024-01-10 09:36:35','2024-01-10 09:36:35','78b8c5b8-0858-42cf-805a-1539d58d144a'),(5,5,1,1,'search','search/_entry',1,'2024-01-10 14:50:54','2024-01-10 14:50:54','b05c2b4c-481c-454f-bc85-961b59a7224f'),(6,6,1,1,'header','header/_entry',1,'2024-01-10 18:59:34','2024-01-10 18:59:34','9817a480-8172-4028-a3a7-0a9c46e29456'),(7,7,1,1,'stoel/{slug}','stoel/_entry.twig',1,'2024-08-14 09:28:59','2024-08-14 09:28:59','64ef8268-24d6-4313-a43b-7f9274f2e536'),(8,8,1,1,'tafel/{slug}','tafel/_entry.twig',1,'2024-08-14 09:30:27','2024-08-14 09:30:27','d365a634-7ab3-4d38-86d9-e8fb85e3f3e3'),(9,9,1,1,'kast/{slug}','kast/_entry.twig',1,'2024-08-14 09:33:37','2024-08-14 09:33:37','bf4f2fd0-cc18-4eef-83e9-5a0be97c3bb7'),(10,10,1,0,NULL,NULL,1,'2024-08-15 13:28:21','2024-08-15 16:37:00','dd1b1ae7-a8c4-4c11-b04f-293c970c2b53');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'examen-Jonas-van-roy','2024-01-06 09:36:55','2024-01-06 09:36:55',NULL,'6c94ac7a-b785-4446-a27b-beeecd5ff68b');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','examen-Jonas-van-roy','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-01-06 09:36:55','2024-01-06 09:36:55',NULL,'75d00fd6-59d1-4155-8a76-00491194e8ff');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,4,0,'2024-01-10 15:32:04','2024-01-10 15:32:04','a4bbdb8e-c5c5-4470-907c-77d6f21b093d'),(2,1,50,1,2,3,1,'2024-01-10 15:32:04','2024-01-10 15:32:04','ec3107d6-f0a5-4dbd-96ea-14c70953c85a'),(3,3,NULL,3,1,18,0,'2024-08-14 13:31:15','2024-08-14 13:49:13','90b584a0-ba3d-4ab4-8bf7-6705e9f0ba43'),(4,3,120,3,2,3,1,'2024-08-14 13:31:15','2024-08-14 13:31:15','c471a57e-88a3-41ea-8113-2d866159fe16'),(5,3,123,3,4,5,1,'2024-08-14 13:40:52','2024-08-14 13:40:52','f6f756fe-476d-45b1-afda-d926b3f0e3fb'),(6,3,124,3,6,7,1,'2024-08-14 13:40:58','2024-08-14 13:40:58','5b4a1f9e-cab9-4e30-b0ec-2addb9bfcc5d'),(7,3,126,3,8,9,1,'2024-08-14 13:41:44','2024-08-14 13:41:44','9dfa8245-23c6-4101-96ec-b9f95f4fc447'),(8,3,127,3,10,11,1,'2024-08-14 13:42:17','2024-08-14 13:42:17','7bb24941-f057-4e4a-88f9-01b79601f0c4'),(9,3,128,3,12,13,1,'2024-08-14 13:42:52','2024-08-14 13:42:52','009ccded-ec96-41a0-a4e4-b8f308b7fe8c'),(10,3,129,3,14,15,1,'2024-08-14 13:43:01','2024-08-14 13:43:01','01ffde05-058f-4a8c-a1cc-042b578b26d0'),(11,3,134,3,16,17,1,'2024-08-14 13:49:13','2024-08-14 13:49:13','0e6c9cd8-12a7-4d34-a8ff-7c10d96d1a4c');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,5,'2024-01-10 15:29:34','2024-01-10 15:29:34','2024-08-14 13:27:04','418018bb-d677-4f2b-ae31-c2e31bcbf64e'),(2,NULL,'2024-01-10 15:39:30','2024-01-10 15:39:30','2024-08-14 13:27:06','a848d493-f8cb-4652-b8b8-0521872293e0'),(3,4,'2024-08-14 13:28:08','2024-08-14 14:44:56',NULL,'6aab9b82-176f-44f5-b974-ad333916521e');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'r0952480@student.thomasmore.be','$2y$13$icCUIPZPmPPyWzCm/A06h.VPNJzhiD3c6DhGbeAgH5mTdnadkDpwq','2024-08-15 20:26:06',NULL,NULL,NULL,'2024-08-13 09:51:06',NULL,1,NULL,NULL,NULL,0,'2024-01-06 09:36:56','2024-01-06 09:36:56','2024-08-15 20:26:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'meubels',NULL,'2024-01-10 10:07:42','2024-08-13 12:35:42','dae515a8-072c-4dc9-bd09-5bf91fa7c841'),(2,NULL,NULL,'Temporary filesystem',NULL,'2024-01-10 10:09:14','2024-01-10 10:09:14','ae01e998-fb5c-42cc-81c3-5cff90ae23b4'),(3,2,NULL,'user_1','user_1/','2024-01-10 10:09:14','2024-01-10 10:09:14','3a534127-604e-4acf-b369-4bf025e9fa24');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,6,'meubels','meubels','images','','','site',NULL,1,'2024-01-10 10:07:42','2024-08-13 12:35:42',NULL,'538cba14-d0f8-4365-9d15-694d4b417ee0');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-01-06 09:39:32','2024-01-06 09:39:32','64ce9415-9dff-4b88-935c-5b4282ef504a'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-01-06 09:39:32','2024-01-06 09:39:32','5bbbb1d3-b241-4d5f-a35e-86ac1016da49'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-01-06 09:39:32','2024-01-06 09:39:32','3bb894de-6003-4779-b7c7-577d2c70a443'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-01-06 09:39:32','2024-01-06 09:39:32','d2f316a3-b553-4735-a0b5-d12d9f9a2cba');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 20:27:07
