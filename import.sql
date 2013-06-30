create table questions (
	id integer primary key,
	content text
);

create table answers (
	id integer primary key,
	question_id integer,
	content text,
	right integer
);

