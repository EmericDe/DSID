-- Généré par Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   à :        2022-11-23 16:53:58 CET
--   site :      Oracle Database 21c
--   type :      Oracle Database 21c



DROP TABLE dsid_btm_dm2.dim_borne_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_date_reparation_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_entreprise_reparation CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_localisation_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_panne_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_reparateur_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_station_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_type_velo_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.dim_velo_d CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_dm2.fait_reparation_f CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_wrk.ods_reparation CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_wrk.rejet_reparation CASCADE CONSTRAINTS;

DROP TABLE dsid_btm_wrk.staging_reparation CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dsid_btm_dm2.dim_borne_d (
    id_borne     NUMBER NOT NULL,
    id_borne_src NUMBER,
    code_borne   VARCHAR2(5)
);

ALTER TABLE dsid_btm_dm2.dim_borne_d ADD CONSTRAINT dim_borne_d_pk PRIMARY KEY ( id_borne );

CREATE TABLE dsid_btm_dm2.dim_date_reparation_d (
    id_date_reparation  NUMBER NOT NULL,
    nombre_km_parcourus NUMBER,
    duree_reparation    NUMBER,
    date_reparation     DATE,
    jour                VARCHAR2(5 CHAR),
    semaine             VARCHAR2(5 CHAR),
    mois                VARCHAR2(5 CHAR),
    annee               VARCHAR2(5 CHAR)
);

ALTER TABLE dsid_btm_dm2.dim_date_reparation_d ADD CONSTRAINT dim_date_reparation_d_pk PRIMARY KEY ( id_date_reparation );

CREATE TABLE dsid_btm_dm2.dim_entreprise_reparation (
    id_entreprise     NUMBER NOT NULL,
    id_entreprise_src NUMBER,
    raison_sociale    VARCHAR2(200 CHAR),
    numero_siret      NUMBER,
    numero_contrat    NUMBER
);

ALTER TABLE dsid_btm_dm2.dim_entreprise_reparation ADD CONSTRAINT dim_entreprise_reparation_pk PRIMARY KEY ( id_entreprise );

CREATE TABLE dsid_btm_dm2.dim_localisation_d (
    id_localisation     NUMBER NOT NULL,
    id_localisation_src NUMBER,
    longitude           NUMBER(9, 6),
    latitude            NUMBER(8, 6)
);

ALTER TABLE dsid_btm_dm2.dim_localisation_d ADD CONSTRAINT dim_localisation_d_pk PRIMARY KEY ( id_localisation );

CREATE TABLE dsid_btm_dm2.dim_panne_d (
    id_panne      NUMBER NOT NULL,
    id_panne_src  NUMBER,
    code_panne    VARCHAR2(5 CHAR),
    libelle_panne VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm2.dim_panne_d ADD CONSTRAINT dim_panne_d_pk PRIMARY KEY ( id_panne );

CREATE TABLE dsid_btm_dm2.dim_reparateur_d (
    id_reparateur     NUMBER NOT NULL,
    id_reparateur_src NUMBER,
    prenom_reparateur VARCHAR2(100 CHAR),
    nom_reparateur    VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm2.dim_reparateur_d ADD CONSTRAINT dim_reparateur_d_pk PRIMARY KEY ( id_reparateur );

CREATE TABLE dsid_btm_dm2.dim_station_d (
    id_station      NUMBER NOT NULL,
    id_station_src  NUMBER,
    code_station    VARCHAR2(5 CHAR),
    libelle_station VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm2.dim_station_d ADD CONSTRAINT dim_station_d_pk PRIMARY KEY ( id_station );

CREATE TABLE dsid_btm_dm2.dim_type_velo_d (
    id_type_velo      NUMBER NOT NULL,
    id_type_velo_src  NUMBER,
    code_type_velo    VARCHAR2(5 CHAR),
    libelle_type_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm2.dim_type_velo_d ADD CONSTRAINT dim_type_velo_d_pk PRIMARY KEY ( id_type_velo );

CREATE TABLE dsid_btm_dm2.dim_velo_d (
    id_velo      NUMBER NOT NULL,
    id_velo_src  NUMBER,
    code_velo    VARCHAR2(10 CHAR),
    libelle_velo VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_dm2.dim_velo_d ADD CONSTRAINT dim_velo_d_pk PRIMARY KEY ( id_velo );

CREATE TABLE dsid_btm_dm2.fait_reparation_f (
    id_reparation      NUMBER NOT NULL,
    id_velo            NUMBER NOT NULL,
    id_type_velo       NUMBER NOT NULL,
    id_borne           NUMBER NOT NULL,
    id_date_reparation NUMBER NOT NULL,
    id_panne           NUMBER NOT NULL,
    id_station         NUMBER NOT NULL,
    id_entreprise      NUMBER NOT NULL,
    id_reparateur      NUMBER NOT NULL,
    id_localisation    NUMBER NOT NULL,
    temps_reparation   NUMBER,
    montant_reparation NUMBER,
    date_traitement    DATE
);

ALTER TABLE dsid_btm_dm2.fait_reparation_f ADD CONSTRAINT fait_reparation_f_pk PRIMARY KEY ( id_reparation );

CREATE TABLE dsid_btm_wrk.ods_reparation (
    id_ods_reparation   NUMBER NOT NULL,
    id_velo             NUMBER,
    code_velo           VARCHAR2(10 CHAR),
    libelle_velo        VARCHAR2(100 CHAR),
    id_type_velo        NUMBER,
    code_type_velo      VARCHAR2(5 CHAR),
    libelle_type_velo   VARCHAR2(100 CHAR),
    nombre_km_parcourus NUMBER,
    duree_reparation    NUMBER,
    date_reparation     DATE,
    id_panne            NUMBER,
    code_panne          VARCHAR2(5 CHAR),
    libelle_panne       VARCHAR2(100 CHAR),
    id_station          NUMBER,
    code_station        VARCHAR2(5 CHAR),
    libelle_station     VARCHAR2(100 CHAR),
    id_entreprise       NUMBER,
    raison_sociale      VARCHAR2(200 CHAR),
    numero_siret        NUMBER,
    numero_contrat      NUMBER,
    id_reparateur       NUMBER,
    prenom_reparateur   VARCHAR2(100 CHAR),
    nom_reparateur      VARCHAR2(100 CHAR),
    id_localisation     NUMBER,
    longitude           NUMBER(9, 6),
    latitude            NUMBER(8, 6),
    id_borne            NUMBER,
    code_borne          VARCHAR2(4 CHAR),
    date_traitement     DATE
);

ALTER TABLE dsid_btm_wrk.ods_reparation ADD CONSTRAINT ods_reparationv1_pk PRIMARY KEY ( id_ods_reparation );

CREATE TABLE dsid_btm_wrk.rejet_reparation (
    id_rejet_reparation NUMBER NOT NULL,
    id_velo             NUMBER,
    code_velo           VARCHAR2(10 CHAR),
    libelle_velo        VARCHAR2(100 CHAR),
    id_type_velo        NUMBER,
    code_type_velo      VARCHAR2(5 CHAR),
    libelle_type_velo   VARCHAR2(100 CHAR),
    nombre_km_parcourus NUMBER,
    duree_reparation    NUMBER,
    date_reparation     DATE,
    id_panne            NUMBER,
    code_panne          VARCHAR2(5 CHAR),
    libelle_panne       VARCHAR2(100 CHAR),
    id_station          NUMBER,
    code_station        VARCHAR2(5 CHAR),
    libelle_station     VARCHAR2(100 CHAR),
    id_entreprise       NUMBER,
    raison_sociale      VARCHAR2(200 CHAR),
    numero_siret        NUMBER,
    numero_contrat      NUMBER,
    id_reparateur       NUMBER,
    prenom_reparateur   VARCHAR2(100 CHAR),
    nom_reparateur      VARCHAR2(100 CHAR),
    id_localisation     NUMBER,
    longitude           NUMBER(9, 6),
    latitude            NUMBER(8, 6),
    id_borne            NUMBER,
    code_borne          VARCHAR2(4 CHAR),
    date_traitement     DATE,
    log                 VARCHAR2(300 CHAR),
    type_rejet          VARCHAR2(100 CHAR)
);

ALTER TABLE dsid_btm_wrk.rejet_reparation ADD CONSTRAINT rejet_reparationv2_pk PRIMARY KEY ( id_rejet_reparation );

CREATE TABLE dsid_btm_wrk.staging_reparation (
    id_staging_reparation NUMBER NOT NULL,
    id_velo               NUMBER,
    code_velo             VARCHAR2(10 CHAR),
    libelle_velo          VARCHAR2(100 CHAR),
    id_type_velo          NUMBER,
    libelle_type_velo     VARCHAR2(100 CHAR),
    code_type_velo        VARCHAR2(5 CHAR),
    nombre_km_parcourus   NUMBER,
    duree_reparation      NUMBER,
    date_reparation       DATE,
    id_panne              NUMBER,
    code_panne            VARCHAR2(5 CHAR),
    libelle_panne         VARCHAR2(100 CHAR),
    id_station            NUMBER,
    code_station          VARCHAR2(5 CHAR),
    libelle_station       VARCHAR2(100 CHAR),
    id_entreprise         NUMBER,
    raison_sociale        VARCHAR2(200 CHAR),
    numero_siret          NUMBER,
    numero_contrat        NUMBER,
    id_reparateur         NUMBER,
    prenom_reparateur     VARCHAR2(100 CHAR),
    nom_reparateur        VARCHAR2(100 CHAR),
    id_localisation       NUMBER,
    longitude             NUMBER(9, 6),
    latitude              NUMBER(8, 6),
    id_borne              NUMBER,
    code_borne            VARCHAR2(4 CHAR),
    date_traitement       DATE
);

ALTER TABLE dsid_btm_wrk.staging_reparation ADD CONSTRAINT staging_reparation_pk PRIMARY KEY ( id_staging_reparation );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_borne_d_fk FOREIGN KEY ( id_borne )
        REFERENCES dsid_btm_dm2.dim_borne_d ( id_borne );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_date_reparation_d_fk FOREIGN KEY ( id_date_reparation )
        REFERENCES dsid_btm_dm2.dim_date_reparation_d ( id_date_reparation );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_entreprise_reparation_fk FOREIGN KEY ( id_entreprise )
        REFERENCES dsid_btm_dm2.dim_entreprise_reparation ( id_entreprise );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_localisation_d_fk FOREIGN KEY ( id_localisation )
        REFERENCES dsid_btm_dm2.dim_localisation_d ( id_localisation );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_panne_d_fk FOREIGN KEY ( id_panne )
        REFERENCES dsid_btm_dm2.dim_panne_d ( id_panne );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_reparateur_d_fk FOREIGN KEY ( id_reparateur )
        REFERENCES dsid_btm_dm2.dim_reparateur_d ( id_reparateur );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_station_d_fk FOREIGN KEY ( id_station )
        REFERENCES dsid_btm_dm2.dim_station_d ( id_station );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_type_velo_d_fk FOREIGN KEY ( id_type_velo )
        REFERENCES dsid_btm_dm2.dim_type_velo_d ( id_type_velo );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE dsid_btm_dm2.fait_reparation_f
    ADD CONSTRAINT fait_reparation_f_dim_velo_d_fk FOREIGN KEY ( id_velo )
        REFERENCES dsid_btm_dm2.dim_velo_d ( id_velo );



DROP SEQUENCE dsid_btm_dm2.seq_date_reparation_d;

DROP SEQUENCE dsid_btm_dm2.seq_borne_d;

DROP SEQUENCE dsid_btm_dm2.seq_entreprise_reparation_d;


DROP SEQUENCE dsid_btm_dm2.seq_localisation_d;

DROP SEQUENCE dsid_btm_dm2.seq_panne_d;

DROP SEQUENCE dsid_btm_dm2.seq_reparateur_d;

DROP SEQUENCE dsid_btm_dm2.seq_station_d;

DROP SEQUENCE dsid_btm_dm2.seq_type_velo_d;

DROP SEQUENCE dsid_btm_dm2.seq_velo_d;

DROP SEQUENCE dsid_btm_dm2.seq_reparation_f;

DROP SEQUENCE dsid_btm_wrk.seq_ods_reparation;

DROP SEQUENCE dsid_btm_wrk.seq_rejet_reparation;

DROP SEQUENCE dsid_btm_wrk.seq_staging_reparation;

CREATE SEQUENCE dsid_btm_dm2.seq_borne_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_date_reparation_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_entreprise_reparation_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_localisation_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_panne_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_reparateur_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_station_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_type_velo_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_velo_d START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_dm2.seq_reparation_f START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_wrk.seq_ods_reparation START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_wrk.seq_rejet_reparation START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dsid_btm_wrk.seq_staging_reparation START WITH 1 NOCACHE ORDER;



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             22
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
-- CREATE SEQUENCE                         13
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
-- ERRORS                                   9
-- WARNINGS                                 0

commit;
