

DROP SEQUENCE IF EXISTS article_idarticle_seq CASCADE;
DROP SEQUENCE IF EXISTS comment_idcomment_seq CASCADE;
DROP SEQUENCE IF EXISTS image_id_seq CASCADE;
DROP SEQUENCE IF EXISTS notification_id_seq CASCADE;
DROP SEQUENCE IF EXISTS rating_id_seq CASCADE;
DROP SEQUENCE IF EXISTS report_id_seq CASCADE;
DROP SEQUENCE IF EXISTS suspension_id_seq CASCADE;
DROP SEQUENCE IF EXISTS tags_id_seq CASCADE;
DROP SEQUENCE IF EXISTS Users_id_seq CASCADE;

DROP TABLE IF EXISTS Article CASCADE;
DROP TABLE IF EXISTS Comment CASCADE;
DROP TABLE IF EXISTS Follower CASCADE;
DROP TABLE IF EXISTS Image CASCADE;
DROP TABLE IF EXISTS LinkTag CASCADE;
DROP TABLE IF EXISTS Notification CASCADE;
DROP TABLE IF EXISTS Rating CASCADE;
DROP TABLE IF EXISTS Report CASCADE;
DROP TABLE IF EXISTS Suspension CASCADE;
DROP TABLE IF EXISTS Tags CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

DROP TYPE IF EXISTS Category;
DROP TYPE IF EXISTS BanLevel;
DROP TYPE IF EXISTS State;
DROP TYPE IF EXISTS Visibility;
DROP TYPE IF EXISTS Permissions;

CREATE SEQUENCE article_idarticle_seq INCREMENT 1 START 1;
CREATE SEQUENCE comment_idcomment_seq INCREMENT 1 START 1;
CREATE SEQUENCE image_id_seq INCREMENT 1 START 1;
CREATE SEQUENCE notification_id_seq INCREMENT 1 START 1;
CREATE SEQUENCE rating_id_seq INCREMENT 1 START 1;
CREATE SEQUENCE report_id_seq INCREMENT 1 START 1;
CREATE SEQUENCE suspension_id_seq INCREMENT 1 START 1;
CREATE SEQUENCE tags_id_seq INCREMENT 1 START 1;
CREATE SEQUENCE Users_id_seq INCREMENT 1 START 1;

CREATE TYPE Category AS ENUM ('Sports', 'Technology', 'Culture', 'Science', 'World', 'Politics', 'Miscellaneous');
CREATE TYPE BanLevel AS ENUM ('Soft', 'Hard');
CREATE TYPE State AS ENUM ('Pending', 'Accepted', 'Ignored');
CREATE TYPE Visibility AS ENUM ('Visible', 'Hidden', 'Moderated');
CREATE TYPE Permissions AS ENUM ('Publisher', 'Moderator', 'Administrator');

CREATE TABLE Article(
	abstract varchar(500)	NOT NULL,
	title varchar(100)	 NOT NULL,
	date timestamp NOT NULL,
	content varchar(12000)	 NOT NULL,
	idArticle integer NOT NULL DEFAULT nextval('article_idarticle_seq'),
	category Category NOT NULL,
	visibility Visibility NOT NULL,
	idUser integer NOT NULL
);

CREATE TABLE Comment(
	date timestamp NOT NULL,
	text varchar(1000)	 NOT NULL,
	idComment integer NOT NULL DEFAULT nextval('comment_idcomment_seq'),
	idArticle integer,
	visibility Visibility NOT NULL,
	idReply integer,
	idUser integer NOT NULL
);

CREATE TABLE Image(
	description varchar(100)	,
	url varchar(100)	NOT NULL,
	idArticle integer NOT NULL,
	id integer NOT NULL DEFAULT nextval('image_id_seq')
);

CREATE TABLE LinkTag(
	idTag integer NOT NULL,
	idArticle integer NOT NULL
);

CREATE TABLE Notification(
	date timestamp NOT NULL,
	description varchar(200)	,
	read boolean,
	id  integer NOT NULL DEFAULT nextval('notification_id_seq'),
	idUser integer	 NOT NULL,
	idArticle integer,
	idComment integer
);

CREATE TABLE Follower(
	idFollowed integer	 NOT NULL,
	idFollower integer	 NOT NULL
);

CREATE TABLE Users(
	name varchar(200)	 NOT NULL,
	email varchar(100)	 UNIQUE NOT NULL,
	password varchar(50)	 NOT NULL,
	photoURL varchar(200)	,
	rating integer DEFAULT 0,
	country varchar(100)	,
	permission Permissions NOT NULL DEFAULT 'Publisher',
	id integer NOT NULL DEFAULT nextval('Users_id_seq')
);

CREATE TABLE Rating(
	date timestamp NOT NULL,
	value integer NOT NULL,
	id  integer NOT NULL DEFAULT nextval('rating_id_seq'),
	idArticle integer,
	idComment integer,
	idUser integer NOT NULL
);

CREATE TABLE Report(
	id  integer NOT NULL DEFAULT nextval('report_id_seq'),
	idArticle integer,
	idComment integer,
	state State NOT NULL,
	idUser integer	 NOT NULL
);

CREATE TABLE Suspension(
	start timestamp NOT NULL,
	terminate timestamp NOT NULL,
	reason varchar(500)	,
	ban BanLevel NOT NULL,
 	idUser integer NOT NULL,
	id integer NOT NULL DEFAULT nextval('suspension_id_seq')
);

CREATE TABLE Tags(
	tag varchar(50)	,
	id integer NOT NULL DEFAULT nextval('tags_id_seq')
);


ALTER TABLE Article ADD CONSTRAINT PK_Article
	PRIMARY KEY (idArticle);

ALTER TABLE Comment ADD CONSTRAINT PK_Comment
	PRIMARY KEY (idComment);

ALTER TABLE Image ADD CONSTRAINT PK_Image
	PRIMARY KEY (id);

ALTER TABLE LinkTag ADD CONSTRAINT PK_LinkTag
	PRIMARY KEY (idArticle,idTag);

ALTER TABLE Notification ADD CONSTRAINT PK_Notification
	PRIMARY KEY (id);

ALTER TABLE Follower ADD CONSTRAINT PK_Follower
	PRIMARY KEY (idFollower,idFollowed);

ALTER TABLE Users ADD CONSTRAINT PK_Users
	PRIMARY KEY (id);

ALTER TABLE Rating ADD CONSTRAINT PK_Rating
	PRIMARY KEY (id);

ALTER TABLE Report ADD CONSTRAINT PK_Report
	PRIMARY KEY (id);

ALTER TABLE Suspension ADD CONSTRAINT PK_Suspension
	PRIMARY KEY (id);

ALTER TABLE Suspension ADD CONSTRAINT Date_Order CHECK (start < terminate);

ALTER TABLE Tags ADD CONSTRAINT PK_Tags
	PRIMARY KEY (id);

ALTER TABLE Article ADD CONSTRAINT FK_Article_Users
	FOREIGN KEY (idUser) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Comment ADD CONSTRAINT FK_Comment_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Comment ADD CONSTRAINT FK_Comment_Comment
	FOREIGN KEY (idReply) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Comment ADD CONSTRAINT FK_Comment_Users
	FOREIGN KEY (idUser) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Image ADD CONSTRAINT FK_Image_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE LinkTag ADD CONSTRAINT FK_LinkTag_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE LinkTag ADD CONSTRAINT FK_LinkTag_Tags
	FOREIGN KEY (idTag) REFERENCES Tags (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Notification ADD CONSTRAINT FK_Notification_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Notification ADD CONSTRAINT FK_Notification_Comment
	FOREIGN KEY (idComment) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Notification ADD CONSTRAINT FK_Notification_Users
	FOREIGN KEY (idUser) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Follower ADD CONSTRAINT FK_Follower_Users
	FOREIGN KEY (idFollowed) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Follower ADD CONSTRAINT FK_Follower_Users_02
	FOREIGN KEY (idFollower) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Comment
	FOREIGN KEY (idComment) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Users
	FOREIGN KEY (idUser) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Report ADD CONSTRAINT FK_Report_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Report ADD CONSTRAINT FK_Report_Comment
	FOREIGN KEY (idComment) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Report ADD CONSTRAINT FK_Report_Users
	FOREIGN KEY (idUser) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Suspension ADD CONSTRAINT FK_Suspension_Users
	FOREIGN KEY (idUser) REFERENCES Users (id) ON DELETE No Action ON UPDATE No Action;
