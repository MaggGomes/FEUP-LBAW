

DROP SEQUENCE IF EXISTS article_idarticle_seq CASCADE;
DROP SEQUENCE IF EXISTS comment_idcomment_seq CASCADE;
DROP SEQUENCE IF EXISTS image_id_seq CASCADE;
DROP SEQUENCE IF EXISTS notification_id_seq CASCADE;
DROP SEQUENCE IF EXISTS rating_id_seq CASCADE;
DROP SEQUENCE IF EXISTS report_id_seq CASCADE;
DROP SEQUENCE IF EXISTS suspension_id_seq CASCADE;
DROP SEQUENCE IF EXISTS tags_id_seq CASCADE;
DROP SEQUENCE IF EXISTS Users_id_seq CASCADE;

DROP TABLE IF EXISTS article CASCADE;
DROP TABLE IF EXISTS comment CASCADE;
DROP TABLE IF EXISTS follower CASCADE;
DROP TABLE IF EXISTS image CASCADE;
DROP TABLE IF EXISTS linktag CASCADE;
DROP TABLE IF EXISTS notification CASCADE;
DROP TABLE IF EXISTS rating CASCADE;
DROP TABLE IF EXISTS report CASCADE;
DROP TABLE IF EXISTS suspension CASCADE;
DROP TABLE IF EXISTS tags CASCADE;
DROP TABLE IF EXISTS users CASCADE;

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

CREATE TABLE article (
	abstract varchar(500)	NOT NULL,
	title varchar(100)	 NOT NULL,
	date timestamp NOT NULL,
	content varchar(12000)	 NOT NULL,
	idArticle integer NOT NULL DEFAULT nextval('article_idarticle_seq'),
	category Category NOT NULL,
	visibility Visibility NOT NULL,
	idUser integer NOT NULL
);

CREATE TABLE comment (
	date timestamp NOT NULL,
	text varchar(1000)	 NOT NULL,
	idComment integer NOT NULL DEFAULT nextval('comment_idcomment_seq'),
	idArticle integer,
	visibility Visibility NOT NULL,
	idReply integer,
	idUser integer NOT NULL
);

CREATE TABLE image (
	description varchar(100)	,
	url varchar(100)	NOT NULL,
	idArticle integer NOT NULL,
	id integer NOT NULL DEFAULT nextval('image_id_seq')
);

CREATE TABLE linktag (
	idTag integer NOT NULL,
	idArticle integer NOT NULL
);

CREATE TABLE notification(
	date timestamp NOT NULL,
	read boolean,
	id  integer NOT NULL DEFAULT nextval('notification_id_seq'),
	idUser integer	 NOT NULL,
	idArticle integer,
	idComment integer
);

CREATE TABLE follower(
	idFollowed integer	 NOT NULL,
	idFollower integer	 NOT NULL
);

CREATE TABLE users (
	name varchar(200)	 NOT NULL,
	email varchar(100)	 UNIQUE NOT NULL,
	password varchar(50)	 NOT NULL,
	photoURL varchar(200)	,
	rating integer DEFAULT 0,
	country varchar(100)	,
	permission Permissions NOT NULL DEFAULT 'Publisher',
	id integer NOT NULL DEFAULT nextval('Users_id_seq')
);

CREATE TABLE rating (
	date timestamp NOT NULL,
	value integer NOT NULL,
	id  integer NOT NULL DEFAULT nextval('rating_id_seq'),
	idArticle integer,
	idComment integer,
	idUser integer NOT NULL
);

CREATE TABLE report (
	description varchar(200)	 NOT NULL,
	id  integer NOT NULL DEFAULT nextval('report_id_seq'),
	idArticle integer,
	idComment integer,
	state State NOT NULL,
	idUser integer	 NOT NULL
);

CREATE TABLE suspension (
	start timestamp NOT NULL,
	terminate timestamp NOT NULL,
	reason varchar(500)	,
	ban BanLevel NOT NULL,
 	idUser integer NOT NULL,
	id integer NOT NULL DEFAULT nextval('suspension_id_seq')
);

CREATE TABLE tags (
	tag varchar(50)	,
	id integer NOT NULL DEFAULT nextval('tags_id_seq')
);


ALTER TABLE article ADD CONSTRAINT PK_Article
	PRIMARY KEY (idArticle);

ALTER TABLE comment ADD CONSTRAINT PK_Comment
	PRIMARY KEY (idComment);

ALTER TABLE image ADD CONSTRAINT PK_Image
	PRIMARY KEY (id);

ALTER TABLE linktag ADD CONSTRAINT PK_LinkTag
	PRIMARY KEY (idArticle,idTag);

ALTER TABLE notification ADD CONSTRAINT PK_Notification
	PRIMARY KEY (id);

ALTER TABLE follower ADD CONSTRAINT PK_Follower
	PRIMARY KEY (idFollower,idFollowed);

ALTER TABLE users ADD CONSTRAINT PK_Users
	PRIMARY KEY (id);

ALTER TABLE rating ADD CONSTRAINT PK_Rating
	PRIMARY KEY (id);

ALTER TABLE report ADD CONSTRAINT PK_Report
	PRIMARY KEY (id);

ALTER TABLE suspension ADD CONSTRAINT PK_Suspension
	PRIMARY KEY (id);

ALTER TABLE suspension ADD CONSTRAINT Date_Order CHECK (start < terminate);

ALTER TABLE tags ADD CONSTRAINT PK_Tags
	PRIMARY KEY (id);

ALTER TABLE article ADD CONSTRAINT FK_Article_Users
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE comment ADD CONSTRAINT FK_Comment_Article
	FOREIGN KEY (idArticle) REFERENCES article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE comment ADD CONSTRAINT FK_Comment_Comment
	FOREIGN KEY (idReply) REFERENCES comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE comment ADD CONSTRAINT FK_Comment_Users
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE image ADD CONSTRAINT FK_Image_Article
	FOREIGN KEY (idArticle) REFERENCES article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE linktag ADD CONSTRAINT FK_LinkTag_Article
	FOREIGN KEY (idArticle) REFERENCES article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE linktag ADD CONSTRAINT FK_LinkTag_Tags
	FOREIGN KEY (idTag) REFERENCES tags (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE notification ADD CONSTRAINT FK_Notification_Article
	FOREIGN KEY (idArticle) REFERENCES article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE notification ADD CONSTRAINT FK_Notification_Comment
	FOREIGN KEY (idComment) REFERENCES comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE notification ADD CONSTRAINT FK_Notification_Users
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE follower ADD CONSTRAINT FK_Follower_Users
	FOREIGN KEY (idFollowed) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE follower ADD CONSTRAINT FK_Follower_Users_02
	FOREIGN KEY (idFollower) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE rating ADD CONSTRAINT FK_Rating_Article
	FOREIGN KEY (idArticle) REFERENCES article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE rating ADD CONSTRAINT FK_Rating_Comment
	FOREIGN KEY (idComment) REFERENCES comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE rating ADD CONSTRAINT FK_Rating_Users
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE report ADD CONSTRAINT FK_Report_Article
	FOREIGN KEY (idArticle) REFERENCES article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE report ADD CONSTRAINT FK_Report_Comment
	FOREIGN KEY (idComment) REFERENCES comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE report ADD CONSTRAINT FK_Report_Users
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE suspension ADD CONSTRAINT FK_Suspension_Users
	FOREIGN KEY (idUser) REFERENCES users (id) ON DELETE No Action ON UPDATE No Action;
