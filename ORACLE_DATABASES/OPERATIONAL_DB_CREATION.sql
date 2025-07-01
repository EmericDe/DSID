-- Généré par Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   à :        2022-11-23 15:21:28 CET
--   site :      Oracle Database 21c
--   type :      Oracle Database 21c



DROP VIEW DSID_BTM_OPE.VIEW_LOCATION CASCADE CONSTRAINTS 
;

DROP VIEW DSID_BTM_OPE.VIEW_REPARATION CASCADE CONSTRAINTS 
;

DROP TABLE dsid_btm_ope.borne CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.client CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.entreprise_reparation CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.etat_borne CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.etat_velo CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.localisation CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.location CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.panne CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.region CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.reparateur CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.reparation CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.station CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.type_velo CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.velo CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_ope.ville CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dsid_btm_ope.borne (
    id_borne      NUMBER NOT NULL,
    id_station    NUMBER NOT NULL,
    id_etat_borne NUMBER NOT NULL,
    code_borne    VARCHAR2(4 CHAR)
);

ALTER TABLE dsid_btm_ope.borne ADD CONSTRAINT borne_pk PRIMARY KEY ( id_borne );

CREATE TABLE dsid_btm_ope.client (
    id_client      NUMBER NOT NULL,
    numero_client  NUMBER,
    prenom_client  VARCHAR2(100 CHAR),
    nom_client     VARCHAR2(100 CHAR),
    date_naissance DATE
);

ALTER TABLE dsid_btm_ope.client ADD CONSTRAINT client_pk PRIMARY KEY ( id_client );

CREATE TABLE dsid_btm_ope.entreprise_reparation (
    id_entreprise      NUMBER NOT NULL,
    raison_sociale     VARCHAR2(200 CHAR),
    numero_siret       NUMBER,
    numero_contrat     NUMBER,
    date_debut_contrat DATE,
    date_fin_cotrat    DATE
);

ALTER TABLE dsid_btm_ope.entreprise_reparation ADD CONSTRAINT entreprise_reparation_pk PRIMARY KEY ( id_entreprise );

CREATE TABLE dsid_btm_ope.etat_borne (
    id_etat_borne      NUMBER NOT NULL,
    code_etat_borne    VARCHAR2(5 CHAR),
    libelle_etat_borne VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.etat_borne ADD CONSTRAINT statut_borne_pk PRIMARY KEY ( id_etat_borne );

CREATE TABLE dsid_btm_ope.etat_velo (
    id_etat_velo      NUMBER NOT NULL,
    code_etat_velo    VARCHAR2(5 CHAR),
    libelle_etat_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.etat_velo ADD CONSTRAINT etat_velo_pk PRIMARY KEY ( id_etat_velo );

CREATE TABLE dsid_btm_ope.localisation (
    id_localisation NUMBER NOT NULL,
    id_ville        NUMBER NOT NULL,
    longitude       NUMBER(9, 6),
    latitude        NUMBER(8, 6)
);

ALTER TABLE dsid_btm_ope.localisation ADD CONSTRAINT localisation_pk PRIMARY KEY ( id_localisation );

CREATE TABLE dsid_btm_ope.location (
    id_location         NUMBER NOT NULL,
    id_velo             NUMBER NOT NULL,
    id_client           NUMBER NOT NULL,
    numero_location     NUMBER,
    date_debut_location DATE,
    date_fin_location   DATE
);

ALTER TABLE dsid_btm_ope.location ADD CONSTRAINT location_pk PRIMARY KEY ( id_location );

CREATE TABLE dsid_btm_ope.panne (
    id_panne      NUMBER NOT NULL,
    id_etat_velo  NUMBER NOT NULL,
    code_panne    VARCHAR2(5 CHAR),
    libelle_panne VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.panne ADD CONSTRAINT panne_pk PRIMARY KEY ( id_panne );

CREATE TABLE dsid_btm_ope.region (
    id_region   NUMBER NOT NULL,
    code_region VARCHAR2(5 CHAR),
    nom_region  VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.region ADD CONSTRAINT region_pk PRIMARY KEY ( id_region );

CREATE TABLE dsid_btm_ope.reparateur (
    id_reparateur     NUMBER NOT NULL,
    id_entreprise     NUMBER NOT NULL,
    prenom_reparateur VARCHAR2(100 CHAR),
    nom_reparateur    VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.reparateur ADD CONSTRAINT reparateur_pk PRIMARY KEY ( id_reparateur );

CREATE TABLE dsid_btm_ope.reparation (
    id_reparation       NUMBER NOT NULL,
    id_velo             NUMBER NOT NULL,
    id_reparateur       NUMBER NOT NULL,
    numero_reparation   NUMBER,
    duree_reparation    NUMBER,
    nombre_km_parcourus NUMBER,
    date_reparation     DATE
);

ALTER TABLE dsid_btm_ope.reparation ADD CONSTRAINT reparation_pk PRIMARY KEY ( id_reparation );

CREATE TABLE dsid_btm_ope.station (
    id_station           NUMBER NOT NULL,
    id_localisation      NUMBER NOT NULL,
    code_station         VARCHAR2(5 CHAR),
    libelle_station      VARCHAR2(100),
    capacite             NUMBER,
    date_mise_en_service DATE
);

ALTER TABLE dsid_btm_ope.station ADD CONSTRAINT station_pk PRIMARY KEY ( id_station );

CREATE TABLE dsid_btm_ope.type_velo (
    id_type_velo      NUMBER NOT NULL,
    code_type_velo    VARCHAR2(5 CHAR),
    libelle_type_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.type_velo ADD CONSTRAINT type_velo_pk PRIMARY KEY ( id_type_velo );

CREATE TABLE dsid_btm_ope.velo (
    id_velo      NUMBER NOT NULL,
    id_borne     NUMBER NOT NULL,
    id_type_velo NUMBER NOT NULL,
    id_etat_velo NUMBER NOT NULL,
    id_panne     NUMBER,
    code_velo    VARCHAR2(10 CHAR),
    libelle_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.velo ADD CONSTRAINT velo_pk PRIMARY KEY ( id_velo );

CREATE TABLE dsid_btm_ope.ville (
    id_ville    NUMBER NOT NULL,
    id_region   NUMBER NOT NULL,
    code_postal VARCHAR2(5 CHAR),
    ville       VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_ope.ville ADD CONSTRAINT ville_pk PRIMARY KEY ( id_ville );

ALTER TABLE dsid_btm_ope.borne
    ADD CONSTRAINT borne_etat_borne_fk FOREIGN KEY ( id_etat_borne )
        REFERENCES dsid_btm_ope.etat_borne ( id_etat_borne );

ALTER TABLE dsid_btm_ope.borne
    ADD CONSTRAINT borne_station_fk FOREIGN KEY ( id_station )
        REFERENCES dsid_btm_ope.station ( id_station );

ALTER TABLE dsid_btm_ope.localisation
    ADD CONSTRAINT localisation_ville_fk FOREIGN KEY ( id_ville )
        REFERENCES dsid_btm_ope.ville ( id_ville );

ALTER TABLE dsid_btm_ope.location
    ADD CONSTRAINT location_client_fk FOREIGN KEY ( id_client )
        REFERENCES dsid_btm_ope.client ( id_client );

ALTER TABLE dsid_btm_ope.location
    ADD CONSTRAINT location_velo_fk FOREIGN KEY ( id_velo )
        REFERENCES dsid_btm_ope.velo ( id_velo );

ALTER TABLE dsid_btm_ope.panne
    ADD CONSTRAINT panne_etat_velo_fk FOREIGN KEY ( id_etat_velo )
        REFERENCES dsid_btm_ope.etat_velo ( id_etat_velo );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_ope.reparateur
    ADD CONSTRAINT reparateur_entreprise_reparation_fk FOREIGN KEY ( id_entreprise )
        REFERENCES dsid_btm_ope.entreprise_reparation ( id_entreprise );

ALTER TABLE dsid_btm_ope.reparation
    ADD CONSTRAINT reparation_reparateur_fk FOREIGN KEY ( id_reparateur )
        REFERENCES dsid_btm_ope.reparateur ( id_reparateur );

ALTER TABLE dsid_btm_ope.reparation
    ADD CONSTRAINT reparation_velo_fk FOREIGN KEY ( id_velo )
        REFERENCES dsid_btm_ope.velo ( id_velo );

ALTER TABLE dsid_btm_ope.station
    ADD CONSTRAINT station_localisation_fk FOREIGN KEY ( id_localisation )
        REFERENCES dsid_btm_ope.localisation ( id_localisation );

ALTER TABLE dsid_btm_ope.velo
    ADD CONSTRAINT velo_borne_fk FOREIGN KEY ( id_borne )
        REFERENCES dsid_btm_ope.borne ( id_borne );

ALTER TABLE dsid_btm_ope.velo
    ADD CONSTRAINT velo_etat_velo_fk FOREIGN KEY ( id_etat_velo )
        REFERENCES dsid_btm_ope.etat_velo ( id_etat_velo );

ALTER TABLE dsid_btm_ope.velo
    ADD CONSTRAINT velo_panne_fk FOREIGN KEY ( id_panne )
        REFERENCES dsid_btm_ope.panne ( id_panne );

ALTER TABLE dsid_btm_ope.velo
    ADD CONSTRAINT velo_type_velo_fk FOREIGN KEY ( id_type_velo )
        REFERENCES dsid_btm_ope.type_velo ( id_type_velo );

ALTER TABLE dsid_btm_ope.ville
    ADD CONSTRAINT ville_region_fk FOREIGN KEY ( id_region )
        REFERENCES dsid_btm_ope.region ( id_region );

CREATE OR REPLACE VIEW VIEW_LOCATION ( id_client, numero_client, prenom_client, nom_client, date_naissance, id_velo, id_etat_velo, code_velo, libelle_velo, code_type_velo, libelle_type_velo, date_mise_en_service, capacite, libelle_station, code_station, id_station, id_ville, ville, code_postal, id_region, code_region, nom_region, date_debut_location, date_fin_location, id_type_velo, id_borne, id_localisation, latitude, longitude ) AS
SELECT
    client.id_client,
    client.numero_client,
    client.prenom_client,
    client.nom_client,
    client.date_naissance,
    velo.id_velo,
    velo.id_etat_velo,
    velo.code_velo,
    velo.libelle_velo,
    type_velo.code_type_velo,
    type_velo.libelle_type_velo,
    station.date_mise_en_service,
    station.capacite,
    station.libelle_station,
    station.code_station,
    station.id_station,
    ville.id_ville,
    ville.ville,
    ville.code_postal,
    region.id_region,
    region.code_region,
    region.nom_region,
    location.date_debut_location,
    location.date_fin_location,
    type_velo.id_type_velo,
    borne.id_borne,
    localisation.id_localisation,
    localisation.latitude,
    localisation.longitude
FROM
    client,
    location,
    velo,
    type_velo,
    borne,
    station,
    localisation,
    ville,
    region
WHERE
        client.id_client = location.id_client
    AND velo.id_velo = location.id_velo
    AND type_velo.id_type_velo = velo.id_type_velo
    AND borne.id_borne = velo.id_borne
    AND station.id_station = borne.id_station
    AND region.id_region = ville.id_region
    AND localisation.id_localisation = station.id_localisation
    AND ville.id_ville = localisation.id_ville 
;

CREATE OR REPLACE VIEW VIEW_REPARATION ( id_velo, id_type_velo, code_velo, libelle_velo, id_reparateur, prenom_reparateur, nom_reparateur, id_entreprise, numero_contrat, numero_siret, raison_sociale, id_station, code_station, libelle_station, id_localisation, longitude, latitude, duree_reparation, date_reparation, nombre_km_parcourus, id_borne, code_borne, id_panne, libelle_panne, code_type_velo, libelle_type_velo, code_panne ) AS
SELECT
    velo.id_velo,
    type_velo.id_type_velo,
    velo.code_velo,
    velo.libelle_velo,
    reparateur.id_reparateur,
    reparateur.prenom_reparateur,
    reparateur.nom_reparateur,
    entreprise_reparation.id_entreprise,
    entreprise_reparation.numero_contrat,
    entreprise_reparation.numero_siret,
    entreprise_reparation.raison_sociale,
    station.id_station,
    station.code_station,
    station.libelle_station,
    localisation.id_localisation,
    localisation.longitude,
    localisation.latitude,
    reparation.duree_reparation,
    reparation.date_reparation,
    reparation.nombre_km_parcourus,
    borne.id_borne,
    borne.code_borne,
    panne.id_panne,
    panne.libelle_panne,
    type_velo.code_type_velo,
    type_velo.libelle_type_velo,
    panne.code_panne
FROM
    velo,
    type_velo,
    reparation,
    reparateur,
    entreprise_reparation,
    borne,
    station,
    localisation,
    panne
WHERE
        type_velo.id_type_velo = velo.id_type_velo
    AND entreprise_reparation.id_entreprise = reparateur.id_entreprise
    AND localisation.id_localisation = station.id_localisation
    AND velo.id_velo = reparation.id_velo
    AND reparateur.id_reparateur = reparation.id_reparateur
    AND borne.id_borne = velo.id_borne
    AND station.id_station = borne.id_station
    AND panne.id_panne = velo.id_panne 
;


DROP SEQUENCE dsid_btm_ope.seq_borne;

DROP SEQUENCE dsid_btm_ope.seq_client;

DROP SEQUENCE dsid_btm_ope.seq_entreprise_reparation;

DROP SEQUENCE dsid_btm_ope.seq_etat_borne;

DROP SEQUENCE dsid_btm_ope.seq_etat_velo;

DROP SEQUENCE dsid_btm_ope.seq_localisation;

DROP SEQUENCE dsid_btm_ope.seq_location;

DROP SEQUENCE dsid_btm_ope.seq_panne;

DROP SEQUENCE dsid_btm_ope.seq_region;

DROP SEQUENCE dsid_btm_ope.seq_reparateur;

DROP SEQUENCE dsid_btm_ope.seq_reparation;

DROP SEQUENCE dsid_btm_ope.seq_station;

DROP SEQUENCE dsid_btm_ope.seq_type_velo;

DROP SEQUENCE dsid_btm_ope.seq_velo;

DROP SEQUENCE dsid_btm_ope.seq_ville;


CREATE SEQUENCE dsid_btm_ope.seq_borne START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_client START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_entreprise_reparation START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_etat_borne START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_etat_velo START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_localisation START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_location START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_panne START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_region START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_reparateur START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_reparation START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_station START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_type_velo START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_velo START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_ope.seq_ville START WITH 1 NOCACHE ORDER;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             30
-- CREATE VIEW                              2
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         15
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0

commit;
