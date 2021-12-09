BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "foodblog_tag" (
	"id"	integer NOT NULL,
	"tag"	varchar(50) NOT NULL,
	"count"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "foodblog_textblock" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"content"	text NOT NULL,
	"image"	varchar(100),
	"name"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "foodblog_post" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"excerpt"	varchar(200),
	"content"	text NOT NULL,
	"pub_date"	datetime NOT NULL,
	"thumbnail"	varchar(100) NOT NULL,
	"slug"	varchar(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "foodblog_post_tags" (
	"id"	integer NOT NULL,
	"post_id"	bigint NOT NULL,
	"tag_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("tag_id") REFERENCES "foodblog_tag"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("post_id") REFERENCES "foodblog_post"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2021-11-29 08:06:48.192242');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2021-11-29 08:06:48.365627');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2021-11-29 08:06:48.525342');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2021-11-29 08:06:48.633558');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2021-11-29 08:06:48.742636');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2021-11-29 08:06:48.841262');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2021-11-29 08:06:48.956910');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2021-11-29 08:06:49.053982');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2021-11-29 08:06:49.157442');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2021-11-29 08:06:49.252029');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2021-11-29 08:06:49.334806');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2021-11-29 08:06:49.418327');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2021-11-29 08:06:49.509445');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2021-11-29 08:06:49.617428');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2021-11-29 08:06:49.720702');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2021-11-29 08:06:49.818637');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2021-11-29 08:06:49.911592');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2021-11-29 08:06:50.070120');
INSERT INTO "django_migrations" VALUES (19,'foodblog','0001_initial','2021-11-29 08:22:55.363707');
INSERT INTO "django_migrations" VALUES (20,'foodblog','0002_auto_20211129_1620','2021-11-29 09:20:30.206468');
INSERT INTO "django_migrations" VALUES (21,'foodblog','0003_auto_20211129_1634','2021-11-29 09:35:01.847545');
INSERT INTO "django_migrations" VALUES (22,'foodblog','0004_auto_20211129_1637','2021-11-29 09:37:13.946283');
INSERT INTO "django_migrations" VALUES (23,'foodblog','0005_textblock_name','2021-11-29 09:49:29.533916');
INSERT INTO "django_migrations" VALUES (24,'foodblog','0006_alter_post_slug','2021-12-01 09:09:31.198138');
INSERT INTO "django_migrations" VALUES (25,'foodblog','0007_post_tags','2021-12-01 14:31:21.599549');
INSERT INTO "auth_group_permissions" VALUES (1,1,40);
INSERT INTO "auth_group_permissions" VALUES (2,1,37);
INSERT INTO "auth_group_permissions" VALUES (3,1,38);
INSERT INTO "auth_group_permissions" VALUES (4,1,25);
INSERT INTO "auth_group_permissions" VALUES (5,1,26);
INSERT INTO "auth_group_permissions" VALUES (6,1,28);
INSERT INTO "auth_user_groups" VALUES (1,2,1);
INSERT INTO "django_admin_log" VALUES (1,'2021-11-29 08:37:10.634990','1','The Perfect Sandwich, A Real NYC Classic','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2021-11-29 08:46:40.212187','2','Let Me Tell You About This Steak','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2021-11-29 08:47:19.507204','3','Cherries, interrupted','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2021-11-29 08:48:26.033879','4','Once Again, Robust Wine and Vegetable Pasta','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (5,'2021-11-29 08:49:54.936693','5','About Me, The Food Man','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2021-11-29 08:51:13.384725','6','All I Need Is a Popsicle','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2021-11-29 08:51:41.067983','7','Salmon For Your Skin','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (8,'2021-11-29 08:52:26.441734','8','The Perfect Sandwich, A Real Classic','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (9,'2021-11-29 08:53:33.432646','9','Le French','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (10,'2021-11-29 08:54:02.033772','10','Lorem Sed mattis nunc','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (11,'2021-11-29 08:54:50.535694','11','Ipsum Praes tinci sed','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (12,'2021-11-29 09:00:34.476880','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Content"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (13,'2021-11-29 09:02:37.604932','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Pub date"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (14,'2021-11-29 09:02:48.346886','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Content", "Pub date"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (15,'2021-11-29 09:08:22.756267','5','About Me, The Food Man','[{"changed": {"fields": ["Content"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (16,'2021-11-29 09:11:39.164718','5','About Me, The Food Man','',7,1,3);
INSERT INTO "django_admin_log" VALUES (17,'2021-11-29 09:22:04.720103','1','TextBlock object (1)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (18,'2021-11-29 09:22:25.361501','2','TextBlock object (2)','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (19,'2021-11-29 09:37:59.057048','1','travel','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (20,'2021-11-29 09:38:07.279901','2','New York','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (21,'2021-11-29 09:38:16.453384','3','dinner','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (22,'2021-11-29 09:38:24.158718','4','salmon','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (23,'2021-11-29 09:38:28.769636','5','france','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (24,'2021-11-29 09:38:39.574198','6','drink','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (25,'2021-11-29 09:38:43.389832','7','flavor','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (26,'2021-11-29 09:38:47.130837','8','cusine','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (27,'2021-11-29 09:39:09.030352','8','cuisine','[{"changed": {"fields": ["Tag"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (28,'2021-11-29 09:39:23.588434','9','chicken','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (29,'2021-11-29 09:39:27.026432','10','fish','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (30,'2021-11-29 09:39:30.828965','11','duck','[{"added": {}}]',9,1,1);
INSERT INTO "django_admin_log" VALUES (31,'2021-11-29 09:42:06.121651','3','My Food Blog','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (32,'2021-11-29 09:50:13.151186','3','logo','[{"changed": {"fields": ["Name"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (33,'2021-11-29 09:50:41.363088','2','footer','[{"changed": {"fields": ["Name"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (34,'2021-11-29 09:51:02.834983','1','feature','[{"changed": {"fields": ["Name"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (35,'2021-11-29 09:52:01.474850','1','travel','[{"changed": {"fields": ["Count"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (36,'2021-11-29 11:32:12.083611','1','feature','[{"changed": {"fields": ["Content"]}}]',8,1,2);
INSERT INTO "django_admin_log" VALUES (37,'2021-11-30 08:17:28.743472','1','Editors','[{"added": {}}]',3,1,1);
INSERT INTO "django_admin_log" VALUES (38,'2021-11-30 08:22:24.870254','2','foodblogeditor','[{"added": {}}]',4,1,1);
INSERT INTO "django_admin_log" VALUES (39,'2021-11-30 08:24:40.041210','2','foodblogeditor','[{"changed": {"fields": ["Staff status"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (40,'2021-11-30 08:25:50.920391','2','foodblogeditor','[{"changed": {"fields": ["Groups"]}}]',4,1,2);
INSERT INTO "django_admin_log" VALUES (41,'2021-11-30 08:27:20.159452','1','Editors','[{"changed": {"fields": ["Permissions"]}}]',3,1,2);
INSERT INTO "django_admin_log" VALUES (42,'2021-11-30 08:28:00.104051','2','foodblogeditor','[]',4,1,2);
INSERT INTO "django_admin_log" VALUES (43,'2021-12-01 14:47:27.210476','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (44,'2021-12-01 14:48:21.194509','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (45,'2021-12-01 14:48:42.006179','10','Lorem Sed mattis nunc','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (46,'2021-12-01 14:49:22.027870','9','Le French','[{"changed": {"fields": ["Content", "Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (47,'2021-12-01 14:54:15.606469','1','travel','[{"changed": {"fields": ["Count"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (48,'2021-12-01 14:54:30.913946','5','france','[{"changed": {"fields": ["Count"]}}]',9,1,2);
INSERT INTO "django_admin_log" VALUES (49,'2021-12-01 15:10:42.280335','8','The Perfect Sandwich, A Real Classic','[{"changed": {"fields": ["Content", "Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (50,'2021-12-01 15:11:20.800877','8','The Perfect Sandwich, A Real Classic','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (51,'2021-12-01 15:27:47.276156','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (52,'2021-12-01 15:28:02.825225','11','Ipsum Praes tinci sed','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (53,'2021-12-01 15:38:42.248759','7','Salmon For Your Skin','[{"changed": {"fields": ["Content", "Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (54,'2021-12-02 03:53:29.503949','4','Once Again, Robust Wine and Vegetable Pasta','[{"changed": {"fields": ["Content", "Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (55,'2021-12-02 04:07:38.921297','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (56,'2021-12-02 04:19:33.195691','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (57,'2021-12-02 04:27:31.606866','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (58,'2021-12-02 04:54:37.304714','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (59,'2021-12-02 05:13:13.710721','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (60,'2021-12-02 05:18:04.676578','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (61,'2021-12-02 05:25:03.067250','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (62,'2021-12-02 05:37:07.550016','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (63,'2021-12-02 05:58:36.277347','10','Lorem Sed mattis nunc','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (64,'2021-12-02 06:12:37.036310','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (65,'2021-12-02 08:42:14.587985','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (66,'2021-12-02 14:05:17.043265','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (67,'2021-12-02 14:06:02.049491','11','Ipsum Praes tinci sed','[]',7,1,2);
INSERT INTO "django_admin_log" VALUES (68,'2021-12-02 14:09:25.289036','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (69,'2021-12-02 14:11:44.792366','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (70,'2021-12-02 14:16:42.434851','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (71,'2021-12-02 14:17:30.829402','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (72,'2021-12-02 14:18:46.311882','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (73,'2021-12-02 14:19:03.097353','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (74,'2021-12-02 14:19:30.816447','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_admin_log" VALUES (75,'2021-12-02 14:19:58.973117','11','Ipsum Praes tinci sed','[{"changed": {"fields": ["Tags"]}}]',7,1,2);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'foodblog','post');
INSERT INTO "django_content_type" VALUES (8,'foodblog','textblock');
INSERT INTO "django_content_type" VALUES (9,'foodblog','tag');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_post','Can add post');
INSERT INTO "auth_permission" VALUES (26,7,'change_post','Can change post');
INSERT INTO "auth_permission" VALUES (27,7,'delete_post','Can delete post');
INSERT INTO "auth_permission" VALUES (28,7,'view_post','Can view post');
INSERT INTO "auth_permission" VALUES (29,8,'add_textblock','Can add text block');
INSERT INTO "auth_permission" VALUES (30,8,'change_textblock','Can change text block');
INSERT INTO "auth_permission" VALUES (31,8,'delete_textblock','Can delete text block');
INSERT INTO "auth_permission" VALUES (32,8,'view_textblock','Can view text block');
INSERT INTO "auth_permission" VALUES (33,9,'add_tags','Can add tags');
INSERT INTO "auth_permission" VALUES (34,9,'change_tags','Can change tags');
INSERT INTO "auth_permission" VALUES (35,9,'delete_tags','Can delete tags');
INSERT INTO "auth_permission" VALUES (36,9,'view_tags','Can view tags');
INSERT INTO "auth_permission" VALUES (37,7,'add_posts','Can add posts');
INSERT INTO "auth_permission" VALUES (38,7,'change_posts','Can change posts');
INSERT INTO "auth_permission" VALUES (39,7,'delete_posts','Can delete posts');
INSERT INTO "auth_permission" VALUES (40,7,'view_posts','Can view posts');
INSERT INTO "auth_permission" VALUES (41,8,'add_textblocks','Can add text blocks');
INSERT INTO "auth_permission" VALUES (42,8,'change_textblocks','Can change text blocks');
INSERT INTO "auth_permission" VALUES (43,8,'delete_textblocks','Can delete text blocks');
INSERT INTO "auth_permission" VALUES (44,8,'view_textblocks','Can view text blocks');
INSERT INTO "auth_permission" VALUES (45,9,'add_tag','Can add tag');
INSERT INTO "auth_permission" VALUES (46,9,'change_tag','Can change tag');
INSERT INTO "auth_permission" VALUES (47,9,'delete_tag','Can delete tag');
INSERT INTO "auth_permission" VALUES (48,9,'view_tag','Can view tag');
INSERT INTO "auth_group" VALUES (1,'Editors');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$l56aEHQnPYmkgPLdHdmACM$bbkbdCh0GaxubkjWaHO+R5bethJi11C9VyKYKWv7grU=','2021-12-02 02:29:54.192079',1,'cachepso','','truongtronghai@gmail.com',1,1,'2021-11-29 08:07:48.936935','');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$260000$4k8w0RhJY39yu67GI1pvfE$Urb/+S9vh6abdcL/73tJvfu6liDBH+wXA5Qh8SR6xpk=','2021-11-30 08:28:22.019631',0,'foodblogeditor','','',1,1,'2021-11-30 08:22:24','');
INSERT INTO "django_session" VALUES ('62bjvv38jyzaekoww91cnc12d6jzi8t7','.eJxVjDEOwjAMRe-SGUWJ3bQyIztniJzYkAJKpaadEHdHkTrA-t97_20i71uJe9M1zmLOxpvT75Y4P7V2IA-u98XmpW7rnGxX7EGbvS6ir8vh_h0UbqXXE-iYJmTHkCVQBmJ1kHHg5MJN0CtQUAwc1LkR0QvqQIGIPQKi-XwB6Xc3Vw:1msLcs:G1hBENO9_7Om1zH1VufhY4DA5mPOuDQsntbGOO56JQ0','2021-12-15 09:10:06.388325');
INSERT INTO "django_session" VALUES ('gk9d38utx5bpfg737qe6w83hzlxhtey2','.eJxVjDEOwjAMRe-SGUWJ3bQyIztniJzYkAJKpaadEHdHkTrA-t97_20i71uJe9M1zmLOxpvT75Y4P7V2IA-u98XmpW7rnGxX7EGbvS6ir8vh_h0UbqXXE-iYJmTHkCVQBmJ1kHHg5MJN0CtQUAwc1LkR0QvqQIGIPQKi-XwB6Xc3Vw:1msQex:vEO2JBe6wgLw6nrv_WppoRYZPoPj2J11nlvKh-9uDvA','2021-12-15 14:32:35.194017');
INSERT INTO "django_session" VALUES ('oqun7ahz1zfcbw8feddvdjoa5ssz6w1d','.eJxVjDEOwjAMRe-SGUWJ3bQyIztniJzYkAJKpaadEHdHkTrA-t97_20i71uJe9M1zmLOxpvT75Y4P7V2IA-u98XmpW7rnGxX7EGbvS6ir8vh_h0UbqXXE-iYJmTHkCVQBmJ1kHHg5MJN0CtQUAwc1LkR0QvqQIGIPQKi-XwB6Xc3Vw:1msbr8:wuEGas8CCk9xS38Npmyb_eIgB5ZisUV1pORzmeQ2BNs','2021-12-16 02:29:54.309250');
INSERT INTO "foodblog_tag" VALUES (1,'travel',0);
INSERT INTO "foodblog_tag" VALUES (2,'New York',0);
INSERT INTO "foodblog_tag" VALUES (3,'dinner',0);
INSERT INTO "foodblog_tag" VALUES (4,'salmon',0);
INSERT INTO "foodblog_tag" VALUES (5,'france',0);
INSERT INTO "foodblog_tag" VALUES (6,'drink',0);
INSERT INTO "foodblog_tag" VALUES (7,'flavor',0);
INSERT INTO "foodblog_tag" VALUES (8,'cuisine',0);
INSERT INTO "foodblog_tag" VALUES (9,'chicken',0);
INSERT INTO "foodblog_tag" VALUES (10,'fish',0);
INSERT INTO "foodblog_textblock" VALUES (1,'About Me, The Food Man','<h4><strong>I am Who I Am!</strong></h4>

<h6><em>With Passion For Real, Good Food</em></h6>

<p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>','chef_URU1Se6.jpg','feature');
INSERT INTO "foodblog_textblock" VALUES (2,'Footer','<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>','','footer');
INSERT INTO "foodblog_textblock" VALUES (3,'My Food Blog','<p>Title for homepage</p>','','logo');
INSERT INTO "foodblog_post" VALUES (1,'The Perfect Sandwich, A Real NYC Classic','Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.','Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.','2021-11-29 08:36:33','sandwich.jpg','the-perfect-sandwich');
INSERT INTO "foodblog_post" VALUES (2,'Let Me Tell You About This Steak','Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.','Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.','2021-11-29 08:46:27','steak.jpg','let-me-tell-you-about-this-steak');
INSERT INTO "foodblog_post" VALUES (3,'Cherries, interrupted','Lorem ipsum text praesent tincidunt ipsum lipsum.  What else?','Lorem ipsum text praesent tincidunt ipsum lipsum.

What else?','2021-11-29 08:47:08','cherries.jpg','cherries');
INSERT INTO "foodblog_post" VALUES (4,'Once Again, Robust Wine and Vegetable Pasta','Lorem ipsum text praesent tincidunt ipsum lipsum.','<p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>','2021-11-29 08:47:55','wine.jpg','wine-vegetable');
INSERT INTO "foodblog_post" VALUES (6,'All I Need Is a Popsicle','Lorem ipsum text praesent tincidunt ipsum lipsum.','Lorem ipsum text praesent tincidunt ipsum lipsum.','2021-11-29 08:51:04','popsicle.jpg','popsicle');
INSERT INTO "foodblog_post" VALUES (7,'Salmon For Your Skin','Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.','<p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>','2021-11-29 08:51:35','salmon.jpg','salmon');
INSERT INTO "foodblog_post" VALUES (8,'The Perfect Sandwich, A Real Classic','Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.','<p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>','2021-11-29 08:52:12','sandwich_7Xj5tRZ.jpg','real-classic-sandwich');
INSERT INTO "foodblog_post" VALUES (9,'Le French','Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.','<p>Lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>','2021-11-29 08:53:09','croissant.jpg','french');
INSERT INTO "foodblog_post" VALUES (10,'Lorem Sed mattis nunc','Lorem Sed mattis nunc','<p>Lorem Sed mattis nunc</p>','2021-11-28 08:53:54','workshop.jpg','sed-mattis');
INSERT INTO "foodblog_post" VALUES (11,'Ipsum Praes tinci sed','Ipsum Praes tinci sed','<p><strong>Sed blandit gravida diam, in aliquet urna finibus at</strong>. Etiam vel lectus ornare, dignissim dolor eu, lacinia lectus. Curabitur ac tempus justo, vitae condimentum nibh. Sed sollicitudin eu diam ut malesuada. Morbi vel facilisis risus. Duis elementum arcu ante, quis facilisis nisl hendrerit eu. Mauris sed ornare ante. Maecenas vestibulum ex vitae velit suscipit aliquam. Cras pulvinar semper nisi non condimentum. Quisque gravida sem in tempus varius. Mauris at mauris sit amet odio dictum pretium eu et lacus. Proin lorem lectus, aliquet a maximus nec, consequat a dui. Nulla vitae nisi sit amet ligula pulvinar bibendum vitae ut lorem. Nullam id tortor suscipit, mattis libero eu, interdum lorem.</p>

<h2><img alt="" src="/media/uploads/2021/11/29/workshop.jpg" style="float:left; height:147px; margin:5px; width:147px" />Maecenas fermentum imperdiet</h2>

<p>Sed volutpat fringilla dui ac tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque quis elementum eros. Sed quis risus at nulla porta porta. Ut sit amet nisl quis felis blandit efficitur sit amet et urna. Cras vitae auctor felis. Ut finibus elit vel enim varius porttitor. Praesent vitae scelerisque dui, mollis lacinia erat. Maecenas fermentum imperdiet sem, id cursus tellus malesuada id. Aenean libero lorem, placerat et enim a, dignissim tincidunt libero. In molestie suscipit nunc, et faucibus nisi venenatis in. Maecenas eget sollicitudin nisl.</p>','2021-11-28 08:54:43','gondol.jpg','ipsum-praes');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "foodblog_post_slug_47c98c6a" ON "foodblog_post" (
	"slug"
);
CREATE UNIQUE INDEX IF NOT EXISTS "foodblog_post_tags_post_id_tag_id_45bc5817_uniq" ON "foodblog_post_tags" (
	"post_id",
	"tag_id"
);
CREATE INDEX IF NOT EXISTS "foodblog_post_tags_post_id_6a197640" ON "foodblog_post_tags" (
	"post_id"
);
CREATE INDEX IF NOT EXISTS "foodblog_post_tags_tag_id_43bace36" ON "foodblog_post_tags" (
	"tag_id"
);
COMMIT;
