-- Généré par Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   à :        2022-11-23 19:26:06 CET
--   site :      Oracle Database 21c
--   type :      Oracle Database 21c



DROP TABLE dsid_btm_dm1.dim_client_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_date_debut_location_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_localisation_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_region_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_station_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_type_velo_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_velo_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.dim_ville_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm1.fait_location_f CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_wrk.ods_location CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_wrk.rejet_location CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_wrk.staging_location CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dsid_btm_dm1.dim_client_d (
    id_client      NUMBER NOT NULL,
    id_client_src  NUMBER,
    numero_client  NUMBER,
    prenom_client  VARCHAR2(100 CHAR),
    nom_client     VARCHAR2(100 CHAR),
    date_naissance DATE,
    age            NUMBER
);

ALTER TABLE dsid_btm_dm1.dim_client_d ADD CONSTRAINT dim_client_d_pk PRIMARY KEY ( id_client );

CREATE TABLE dsid_btm_dm1.dim_date_debut_location_d (
    id_date_debut_location NUMBER NOT NULL,
    date_debut_location    DATE,
    date_fin_location      DATE,
    jour_debut_location    VARCHAR2(5 CHAR),
    semaine_debut_location VARCHAR2(5 CHAR),
    mois_debut_location    VARCHAR2(5 CHAR),
    annee_debut_location   VARCHAR2(5 CHAR)
);

ALTER TABLE dsid_btm_dm1.dim_date_debut_location_d ADD CONSTRAINT dim_date_debut_location_d_pk PRIMARY KEY ( id_date_debut_location )
;

CREATE TABLE dsid_btm_dm1.dim_localisation_d (
    id_localisation     NUMBER NOT NULL,
    id_localisation_src NUMBER,
    longitude           NUMBER(9, 6),
    latitude            NUMBER(8, 6)
);

ALTER TABLE dsid_btm_dm1.dim_localisation_d ADD CONSTRAINT dim_localisation_d_pk PRIMARY KEY ( id_localisation );

CREATE TABLE dsid_btm_dm1.dim_region_d (
    id_region     NUMBER NOT NULL,
    id_region_src NUMBER,
    code_region   VARCHAR2(5 CHAR),
    nom_region    VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm1.dim_region_d ADD CONSTRAINT dim_region_d_pk PRIMARY KEY ( id_region );

CREATE TABLE dsid_btm_dm1.dim_station_d (
    id_station           NUMBER NOT NULL,
    id_station_src       NUMBER,
    code_station         VARCHAR2(5 CHAR),
    libelle_station      VARCHAR2(100 CHAR),
    capacite             NUMBER,
    date_mise_en_service DATE
);

ALTER TABLE dsid_btm_dm1.dim_station_d ADD CONSTRAINT dim_station_d_pk PRIMARY KEY ( id_station );

CREATE TABLE dsid_btm_dm1.dim_type_velo_d (
    id_type_velo      NUMBER NOT NULL,
    id_type_velo_src  NUMBER,
    code_type_velo    VARCHAR2(5 CHAR),
    libelle_type_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm1.dim_type_velo_d ADD CONSTRAINT dim_type_velo_d_pk PRIMARY KEY ( id_type_velo );

CREATE TABLE dsid_btm_dm1.dim_velo_d (
    id_velo      NUMBER NOT NULL,
    id_velo_src  NUMBER,
    id_borne     NUMBER,
    code_velo    VARCHAR2(10 CHAR),
    libelle_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm1.dim_velo_d ADD CONSTRAINT dim_velo_d_pk PRIMARY KEY ( id_velo );

CREATE TABLE dsid_btm_dm1.dim_ville_d (
    id_ville     NUMBER NOT NULL,
    id_ville_src NUMBER,
    code_postal  VARCHAR2(5 CHAR),
    ville        VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm1.dim_ville_d ADD CONSTRAINT dim_ville_d_pk PRIMARY KEY ( id_ville );

CREATE TABLE dsid_btm_dm1.fait_location_f (
    id_location            NUMBER NOT NULL,
    id_client              NUMBER NOT NULL,
    id_velo                NUMBER NOT NULL,
    id_type_velo           NUMBER NOT NULL,
    id_station             NUMBER NOT NULL,
    id_localisation        NUMBER NOT NULL,
    id_region              NUMBER NOT NULL,
    id_ville               NUMBER NOT NULL,
    id_date_debut_location NUMBER NOT NULL,
    temps_location         LONG,
    montant_location       NUMBER,
    date_traitement        DATE
);

ALTER TABLE dsid_btm_dm1.fait_location_f ADD CONSTRAINT fait_location_f_pk PRIMARY KEY ( id_location );

CREATE TABLE dsid_btm_wrk.ods_location (
    id_ods_location      NUMBER NOT NULL,
    id_client            NUMBER,
    numero_client        NUMBER,
    prenom_client        VARCHAR2(100 CHAR),
    nom_client           VARCHAR2(100 CHAR),
    date_naissance       DATE,
    id_velo              NUMBER,
    id_borne             NUMBER,
    code_velo            VARCHAR2(10 CHAR),
    libelle_velo         VARCHAR2(100 CHAR),
    id_type_velo         NUMBER,
    code_type_velo       VARCHAR2(5 CHAR),
    libelle_type_velo    VARCHAR2(100 CHAR),
    id_station           NUMBER,
    code_station         VARCHAR2(5 CHAR),
    libelle_station      VARCHAR2(100 CHAR),
    capacite             NUMBER,
    date_mise_en_service DATE,
    id_localisation      NUMBER,
    longitude            NUMBER(9, 6),
    latitude             NUMBER(8, 6),
    id_region            NUMBER,
    code_region          VARCHAR2(5 CHAR),
    nom_region           VARCHAR2(100 CHAR),
    id_ville             NUMBER,
    code_postal          VARCHAR2(5 CHAR),
    ville                VARCHAR2(100 CHAR),
    date_debut_location  DATE,
    date_fin_location    DATE,
    date_traitement      DATE
);

ALTER TABLE dsid_btm_wrk.ods_location ADD CONSTRAINT ods_location_pk PRIMARY KEY ( id_ods_location );

CREATE TABLE dsid_btm_wrk.rejet_location (
    id_rejet_location    NUMBER NOT NULL,
    id_client            NUMBER,
    numero_client        NUMBER,
    prenom_client        VARCHAR2(100 CHAR),
    nom_client           VARCHAR2(100 CHAR),
    date_naissance       DATE,
    id_velo              NUMBER,
    id_borne             NUMBER,
    code_velo            VARCHAR2(10 CHAR),
    libelle_velo         VARCHAR2(100 CHAR),
    id_type_velo         NUMBER,
    code_type_velo       VARCHAR2(5 CHAR),
    libelle_type_velo    VARCHAR2(100 CHAR),
    id_station           NUMBER,
    code_station         VARCHAR2(5 CHAR),
    libelle_station      VARCHAR2(100 CHAR),
    capacite             NUMBER,
    date_mise_en_service DATE,
    id_localisation      NUMBER,
    longitude            NUMBER(9, 6),
    latitude             NUMBER(8, 6),
    id_region            NUMBER,
    code_region          VARCHAR2(5 CHAR),
    nom_region           VARCHAR2(100 CHAR),
    id_ville             NUMBER,
    code_postal          VARCHAR2(5 CHAR),
    ville                VARCHAR2(100 CHAR),
    date_debut_location  DATE,
    date_fin_location    DATE,
    date_traitement      DATE,
    log                  VARCHAR2(300 CHAR),
    type_rejet           VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_wrk.rejet_location ADD CONSTRAINT rejet_location_pk PRIMARY KEY ( id_rejet_location );

CREATE TABLE dsid_btm_wrk.staging_location (
    id_staging_location  NUMBER NOT NULL,
    id_client            NUMBER,
    numero_client        NUMBER,
    prenom_client        VARCHAR2(100 CHAR),
    nom_client           VARCHAR2(100 CHAR),
    date_naissance       DATE,
    id_velo              NUMBER,
    id_borne             NUMBER,
    code_velo            VARCHAR2(10 CHAR),
    libelle_velo         VARCHAR2(100 CHAR),
    id_type_velo         NUMBER,
    code_type_velo       VARCHAR2(5 CHAR),
    libelle_type_velo    VARCHAR2(100 CHAR),
    id_station           NUMBER,
    code_station         VARCHAR2(5 CHAR),
    libelle_station      VARCHAR2(100 CHAR),
    capacite             NUMBER,
    date_mise_en_service DATE,
    id_localisation      NUMBER,
    longitude            NUMBER(9, 6),
    latitude             NUMBER(8, 6),
    id_region            NUMBER,
    code_region          VARCHAR2(5 CHAR),
    nom_region           VARCHAR2(100 CHAR),
    id_ville             NUMBER,
    code_postal          VARCHAR2(5 CHAR),
    ville                VARCHAR2(100 CHAR),
    date_debut_location  DATE,
    date_fin_location    DATE,
    date_traitement      DATE
);

ALTER TABLE dsid_btm_wrk.staging_location ADD CONSTRAINT staging_location_pk PRIMARY KEY ( id_staging_location );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_client_d_fk FOREIGN KEY ( id_client )
        REFERENCES dsid_btm_dm1.dim_client_d ( id_client );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_date_debut_location_d_fk FOREIGN KEY ( id_date_debut_location )
        REFERENCES dsid_btm_dm1.dim_date_debut_location_d ( id_date_debut_location );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_localisation_d_fk FOREIGN KEY ( id_localisation )
        REFERENCES dsid_btm_dm1.dim_localisation_d ( id_localisation );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_region_d_fk FOREIGN KEY ( id_region )
        REFERENCES dsid_btm_dm1.dim_region_d ( id_region );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_station_d_fk FOREIGN KEY ( id_station )
        REFERENCES dsid_btm_dm1.dim_station_d ( id_station );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_type_velo_d_fk FOREIGN KEY ( id_type_velo )
        REFERENCES dsid_btm_dm1.dim_type_velo_d ( id_type_velo );

ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_velo_d_fk FOREIGN KEY ( id_velo )
        REFERENCES dsid_btm_dm1.dim_velo_d ( id_velo );

ALTER TABLE dsid_btm_dm1.fait_location_f
    ADD CONSTRAINT fait_location_f_dim_ville_d_fk FOREIGN KEY ( id_ville )
        REFERENCES dsid_btm_dm1.dim_ville_d ( id_ville );

DROP SEQUENCE dsid_btm_dm1.seq_client_d;

DROP SEQUENCE dsid_btm_dm1.seq_date_debut_location_d;

DROP SEQUENCE dsid_btm_dm1.seq_localisation_d;

DROP SEQUENCE dsid_btm_dm1.seq_region_d;

DROP SEQUENCE dsid_btm_dm1.seq_station_d;

DROP SEQUENCE dsid_btm_dm1.seq_type_velo_d;

DROP SEQUENCE dsid_btm_dm1.seq_velo_d;

DROP SEQUENCE dsid_btm_dm1.seq_ville_d;

DROP SEQUENCE dsid_btm_dm1.seq_location_f;

DROP SEQUENCE dsid_btm_wrk.seq_ods_location;

DROP SEQUENCE dsid_btm_wrk.seq_rejet_location;

DROP SEQUENCE dsid_btm_wrk.seq_staging_location;

CREATE SEQUENCE dsid_btm_dm1.seq_client_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_date_debut_location_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_localisation_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_region_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_station_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_type_velo_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_velo_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_ville_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm1.seq_location_f START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_wrk.seq_ods_location START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_wrk.seq_rejet_location START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_wrk.seq_staging_location START WITH 1 NOCACHE ORDER;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
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
-- CREATE SEQUENCE                         12
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
-- ERRORS                                   6
-- WARNINGS                                 0

commit;