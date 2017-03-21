

DROP SEQUENCE IF EXISTS article_idarticle_seq CASCADE;
DROP SEQUENCE IF EXISTS comment_idcomment_seq CASCADE;
DROP SEQUENCE IF EXISTS tags_id_seq CASCADE;

DROP TABLE IF EXISTS Article CASCADE;
DROP TABLE IF EXISTS Comment CASCADE;
DROP TABLE IF EXISTS Image CASCADE;
DROP TABLE IF EXISTS LinkTag CASCADE;
DROP TABLE IF EXISTS Notification CASCADE;
DROP TABLE IF EXISTS Publisher CASCADE;
DROP TABLE IF EXISTS Rating CASCADE;
DROP TABLE IF EXISTS Report CASCADE;
DROP TABLE IF EXISTS Suspension CASCADE;
DROP TABLE IF EXISTS Tags CASCADE;


CREATE SEQUENCE article_idarticle_seq INCREMENT 1 START 1;
CREATE SEQUENCE comment_idcomment_seq INCREMENT 1 START 1;
CREATE SEQUENCE tags_id_seq INCREMENT 1 START 1;

CREATE TABLE Article(
	abstract varchar(50)	,
	title varchar(50)	 NOT NULL,
	date timestamp NOT NULL,
	content varchar(50)	 NOT NULL,
	idArticle integer NOT NULL DEFAULT nextval('article_idarticle_seq'),
	email varchar
);

CREATE TABLE Comment(
	date timestamp NOT NULL,
	text varchar(500)	 NOT NULL,
	idComment integer NOT NULL DEFAULT nextval('comment_idcomment_seq'),
	idArticle integer,
	idReply integer
);

CREATE TABLE Image(
	description varchar(50)	,
	idArticle integer NOT NULL
);

CREATE TABLE LinkTag(
	idTag integer NOT NULL,
	idArticle integer NOT NULL
);

CREATE TABLE Notification(
	date timestamp NOT NULL,
	description varchar(50)	,
	read boolean,
	email varchar(50)	 NOT NULL,
	idArticle integer NOT NULL,
	idComment integer NOT NULL
);

CREATE TABLE Publisher(
	name varchar(50)	 NOT NULL,
	email varchar(50)	 NOT NULL,
	password varchar(50)	,
	photoURL varchar(50)	,
	rating integer DEFAULT 0,
	country varchar(50)	,
	moderator boolean,
	administrator boolean
);

CREATE TABLE Rating(
	date timestamp NOT NULL,
	value integer NOT NULL,
	idArticle integer NOT NULL,
	idComment integer NOT NULL,
	email varchar NOT NULL
);

CREATE TABLE Report(
	description varchar(50)	 NOT NULL,
	idArticle integer NOT NULL,
	idComment integer NOT NULL,
	email varchar(50)	 NOT NULL
);

CREATE TABLE Suspension(
	start timestamp NOT NULL,
	terminate timestamp NOT NULL,
	reason varchar(500)	,
	email varchar NOT NULL
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
	PRIMARY KEY (idArticle);

ALTER TABLE LinkTag ADD CONSTRAINT PK_LinkTag
	PRIMARY KEY (idArticle,idTag);

ALTER TABLE Notification ADD CONSTRAINT PK_Notification
	PRIMARY KEY (email,idArticle,idComment);

ALTER TABLE Publisher ADD CONSTRAINT PK_Publisher
	PRIMARY KEY (email);

ALTER TABLE Rating ADD CONSTRAINT PK_Rating
	PRIMARY KEY (idComment,idArticle,email);

ALTER TABLE Report ADD CONSTRAINT PK_Report
	PRIMARY KEY (idArticle,idComment,email);

ALTER TABLE Suspension ADD CONSTRAINT PK_Suspension
	PRIMARY KEY (email);

ALTER TABLE Suspension ADD CONSTRAINT Date_Order CHECK (start < terminate);

ALTER TABLE Tags ADD CONSTRAINT PK_Tags
	PRIMARY KEY (id);

ALTER TABLE Article ADD CONSTRAINT FK_Article_Publisher
	FOREIGN KEY (email) REFERENCES Publisher (email) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Comment ADD CONSTRAINT FK_Comment_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Comment ADD CONSTRAINT FK_Comment_Comment
	FOREIGN KEY (idReply) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

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

ALTER TABLE Notification ADD CONSTRAINT FK_Notification_Publisher
	FOREIGN KEY (email) REFERENCES Publisher (email) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Comment
	FOREIGN KEY (idComment) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Rating ADD CONSTRAINT FK_Rating_Publisher
	FOREIGN KEY (email) REFERENCES Publisher (email) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Report ADD CONSTRAINT FK_Report_Article
	FOREIGN KEY (idArticle) REFERENCES Article (idArticle) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Report ADD CONSTRAINT FK_Report_Comment
	FOREIGN KEY (idComment) REFERENCES Comment (idComment) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Report ADD CONSTRAINT FK_Report_Publisher
	FOREIGN KEY (email) REFERENCES Publisher (email) ON DELETE No Action ON UPDATE No Action;

ALTER TABLE Suspension ADD CONSTRAINT FK_Suspension_Publisher
	FOREIGN KEY (email) REFERENCES Publisher (email) ON DELETE No Action ON UPDATE No Action;
