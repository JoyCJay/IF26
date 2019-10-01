CREATE TABLE diplome (
  id INTEGER UNSIGNED NOT NULL,
  label VARCHAR(45) NOT NULL,
  specialite VARCHAR(5) NOT NULL,
  niveau INTEGER NOT NULL,
  PRIMARY KEY(id)
);

insert into diplome values (43149,'ingenieur','ISI',6);

create table PERSONNE1 (
    id INTEGER(4) not null,
    nom varchar(30) not null, 
    prenom varchar(30) not null,
    sexe varchar(1) not null check (sexe in ('h', 'f')),
    portable varchar(10) unique,
    email varchar(30) not null,
    date_naissance date,
    date_embauche date,
    enfant INTEGER(3) check (enfant between 0 and 10),
    primary key (id)
);

create table PERSONNE2 (
    id INTEGER(4) not null,
    nom varchar(30) not null, 
    prenom varchar(30) not null,
    sexe varchar(1) not null check (sexe in ('h', 'f')),
    portable varchar(10) unique,
    email varchar(30) not null,
    date_naissance date,
    date_embauche date,
    enfant INTEGER(3) check (enfant between 0 and 10),
    diplome_id INTEGER(10) UNSIGNED not null,
    FOREIGN KEY(diplome_id) REFERENCES diplome(id),
    primary key (id)
);
insert into PERSONNE2(id,nom,prenom,sexe,portable,email,date_naissance,date_embauche,enfant,diplome_id) values (5,'chengjie','ZHANG','h',0787310820,'chengjie.zhang@utt.fr','1996-01-31','2017-09-01',0,43149);
UPDATE personne2 SET id=4 where id = 5;