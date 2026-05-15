-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2026-05-15 11:44:25 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE CLINICA 
    ( 
     id       INTEGER  NOT NULL , 
     nome     VARCHAR2 (100 CHAR)  NOT NULL , 
     cnpj     VARCHAR2 (18 CHAR)  NOT NULL , 
     telefone VARCHAR2 (15 CHAR)  NOT NULL , 
     email    BLOB  NOT NULL , 
     endereco BLOB  NOT NULL 
    ) 
;

ALTER TABLE CLINICA 
    ADD CONSTRAINT CLINICA_PK PRIMARY KEY ( id ) ;

CREATE TABLE COMPORTAMENTO 
    ( 
     id        INTEGER  NOT NULL , 
     data      DATE  NOT NULL , 
     descricao BLOB  NOT NULL , 
     PET_id    INTEGER 
    ) 
;

ALTER TABLE COMPORTAMENTO 
    ADD CONSTRAINT COMPORTAMENTO_PK PRIMARY KEY ( id ) ;

CREATE TABLE CONSULTA 
    ( 
     id             INTEGER  NOT NULL , 
     data_hora      DATE  NOT NULL , 
     tipo           VARCHAR2 (50 CHAR)  NOT NULL , 
     diagnostico    BLOB , 
     observacoes    BLOB , 
     data_retorno   DATE , 
     VETERINARIO_id INTEGER , 
     PET_id         INTEGER 
    ) 
;

ALTER TABLE CONSULTA 
    ADD CONSTRAINT CONSULTA_PK PRIMARY KEY ( id ) ;

CREATE TABLE EXAME 
    ( 
     id          INTEGER  NOT NULL , 
     tipo        VARCHAR2 (50 CHAR)  NOT NULL , 
     descricao   BLOB  NOT NULL , 
     resultado   BLOB , 
     data        DATE  NOT NULL , 
     CONSULTA_id INTEGER 
    ) 
;

ALTER TABLE EXAME 
    ADD CONSTRAINT EXAME_PK PRIMARY KEY ( id ) ;

CREATE TABLE HISTORICO_PESO 
    ( 
     id           INTEGER  NOT NULL , 
     peso_kg      NUMBER (7,2)  NOT NULL , 
     data_medicao DATE  NOT NULL , 
     observacao   BLOB  NOT NULL , 
     PET_id       INTEGER 
    ) 
;

ALTER TABLE HISTORICO_PESO 
    ADD CONSTRAINT HISTORICO_PESO_PK PRIMARY KEY ( id ) ;

CREATE TABLE LEMBRETE 
    ( 
     id            INTEGER  NOT NULL , 
     tipo          VARCHAR2 (50 CHAR)  NOT NULL , 
     descricao     BLOB  NOT NULL , 
     data_prevista DATE  NOT NULL , 
     status        CHAR (1 CHAR)  NOT NULL , 
     TUTOR_id      INTEGER , 
     PET_id        INTEGER 
    ) 
;

ALTER TABLE LEMBRETE 
    ADD CONSTRAINT LEMBRETE_PK PRIMARY KEY ( id ) ;

CREATE TABLE MEDICAMENTO 
    ( 
     id              INTEGER  NOT NULL , 
     nome            VARCHAR2 (50 CHAR)  NOT NULL , 
     principio_ativo VARCHAR2 (50 CHAR)  NOT NULL , 
     forma           VARCHAR2 (50 CHAR)  NOT NULL , 
     PRESCRICAO_id   INTEGER  NOT NULL , 
     descricao       BLOB  NOT NULL 
    ) 
;

ALTER TABLE MEDICAMENTO 
    ADD CONSTRAINT MEDICAMENTO_PK PRIMARY KEY ( id ) ;

CREATE TABLE PET 
    ( 
     id              INTEGER  NOT NULL , 
     nome            VARCHAR2 (30 CHAR)  NOT NULL , 
     especie         VARCHAR2 (20 CHAR)  NOT NULL , 
     raca            VARCHAR2 (20 CHAR)  NOT NULL , 
     sexo            CHAR (1 CHAR)  NOT NULL , 
     data_nascimento DATE  NOT NULL , 
     foto_url        BLOB  NOT NULL , 
     status          CHAR (1)  NOT NULL , 
     TUTOR_id        INTEGER , 
     CLINICA_id      INTEGER , 
     status2         CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE PET 
    ADD CONSTRAINT PET_PK PRIMARY KEY ( id ) ;

CREATE TABLE PRESCRICAO 
    ( 
     id           INTEGER  NOT NULL , 
     dosagem      VARCHAR2 (10 CHAR)  NOT NULL , 
     frequencia   VARCHAR2 (50 CHAR)  NOT NULL , 
     duracao_dias INTEGER  NOT NULL , 
     observacao   BLOB  NOT NULL , 
     CONSULTA_id  INTEGER 
    ) 
;

ALTER TABLE PRESCRICAO 
    ADD CONSTRAINT PRESCRICAO_PK PRIMARY KEY ( id ) ;

CREATE TABLE RECOMENDACAO 
    ( 
     id                INTEGER  NOT NULL , 
     tipo              VARCHAR2 (50 CHAR)  NOT NULL , 
     descricao         BLOB  NOT NULL , 
     data_recomendacao DATE  NOT NULL , 
     PET_id            INTEGER 
    ) 
;

ALTER TABLE RECOMENDACAO 
    ADD CONSTRAINT RECOMENDACAO_PK PRIMARY KEY ( id ) ;

CREATE TABLE TUTOR 
    ( 
     id           INTEGER  NOT NULL , 
     telefone     VARCHAR2 (15 CHAR)  NOT NULL , 
     cpf          VARCHAR2 (14 CHAR)  NOT NULL , 
     endereco     BLOB  NOT NULL , 
     USUARIO_id   INTEGER  NOT NULL , 
     nome         VARCHAR2 (75 CHAR)  NOT NULL , 
     email        VARCHAR2 (75 CHAR)  NOT NULL , 
     senha        VARCHAR2 (50 CHAR)  NOT NULL , 
     data_criacao DATE  NOT NULL 
    ) 
;

ALTER TABLE TUTOR 
    ADD CONSTRAINT TUTOR_PK PRIMARY KEY ( id ) ;

CREATE TABLE USUARIO 
    ( 
     id           INTEGER  NOT NULL , 
     nome         VARCHAR2 (30 CHAR)  NOT NULL , 
     senha        VARCHAR2 (20 CHAR)  NOT NULL , 
     tipo         CHAR (1 CHAR)  NOT NULL , 
     data_criacao DATE  NOT NULL 
    ) 
;

ALTER TABLE USUARIO 
    ADD CONSTRAINT USUARIO_PK PRIMARY KEY ( id ) ;

CREATE TABLE VACINA 
    ( 
     id                     INTEGER  NOT NULL , 
     nome                   VARCHAR2 (50 CHAR)  NOT NULL , 
     fabricante             VARCHAR2 (50 CHAR)  NOT NULL , 
     descricao              VARCHAR2 (50 CHAR)  NOT NULL , 
     intervalo_reforco_dias INTEGER  NOT NULL 
    ) 
;

ALTER TABLE VACINA 
    ADD CONSTRAINT VACINA_PK PRIMARY KEY ( id ) ;

CREATE TABLE VACINACAO 
    ( 
     id              INTEGER  NOT NULL , 
     data_aplicacao  DATE  NOT NULL , 
     data_proxima    DATE  NOT NULL , 
     observacao      BLOB , 
     PET_id          INTEGER , 
     VACINA_id       INTEGER , 
     vacina_aplicada VARCHAR2 (50 CHAR)  NOT NULL , 
     VETERINARIO_id  INTEGER 
    ) 
;

ALTER TABLE VACINACAO 
    ADD CONSTRAINT VACINACAO_PK PRIMARY KEY ( id ) ;

CREATE TABLE VERMIFUGACAO 
    ( 
     id              INTEGER  NOT NULL , 
     produto         VARCHAR2 (50 CHAR)  NOT NULL , 
     data_aplicacao  DATE  NOT NULL , 
     data_proxima    DATE  NOT NULL , 
     PET_id          INTEGER , 
     VETERINARIO_id  INTEGER , 
     VETERINARIO_id2 INTEGER 
    ) 
;

ALTER TABLE VERMIFUGACAO 
    ADD CONSTRAINT VERMIFUGACAO_PK PRIMARY KEY ( id ) ;

CREATE TABLE VETERINARIO 
    ( 
     id            INTEGER  NOT NULL , 
     crmv          VARCHAR2 (13 CHAR)  NOT NULL , 
     especialidade VARCHAR2 (50 CHAR)  NOT NULL , 
     USUARIO_id    INTEGER  NOT NULL , 
     CLINICA_id    INTEGER , 
     nome          VARCHAR2 (75 CHAR)  NOT NULL , 
     email         VARCHAR2 (75 CHAR)  NOT NULL , 
     senha         VARCHAR2 (50 CHAR)  NOT NULL , 
     data_criacao  DATE  NOT NULL 
    ) 
;

ALTER TABLE VETERINARIO 
    ADD CONSTRAINT VETERINARIO_PK PRIMARY KEY ( id ) ;

ALTER TABLE COMPORTAMENTO 
    ADD CONSTRAINT COMPORTAMENTO_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE CONSULTA 
    ADD CONSTRAINT CONSULTA_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE CONSULTA 
    ADD CONSTRAINT CONSULTA_VETERINARIO_FK FOREIGN KEY 
    ( 
     VETERINARIO_id
    ) 
    REFERENCES VETERINARIO 
    ( 
     id
    ) 
;

ALTER TABLE EXAME 
    ADD CONSTRAINT EXAME_CONSULTA_FK FOREIGN KEY 
    ( 
     CONSULTA_id
    ) 
    REFERENCES CONSULTA 
    ( 
     id
    ) 
;

ALTER TABLE HISTORICO_PESO 
    ADD CONSTRAINT HISTORICO_PESO_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE LEMBRETE 
    ADD CONSTRAINT LEMBRETE_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE LEMBRETE 
    ADD CONSTRAINT LEMBRETE_TUTOR_FK FOREIGN KEY 
    ( 
     TUTOR_id
    ) 
    REFERENCES TUTOR 
    ( 
     id
    ) 
;

ALTER TABLE MEDICAMENTO 
    ADD CONSTRAINT MEDICAMENTO_PRESCRICAO_FK FOREIGN KEY 
    ( 
     PRESCRICAO_id
    ) 
    REFERENCES PRESCRICAO 
    ( 
     id
    ) 
;

ALTER TABLE PET 
    ADD CONSTRAINT PET_CLINICA_FK FOREIGN KEY 
    ( 
     CLINICA_id
    ) 
    REFERENCES CLINICA 
    ( 
     id
    ) 
;

ALTER TABLE PET 
    ADD CONSTRAINT PET_TUTOR_FK FOREIGN KEY 
    ( 
     TUTOR_id
    ) 
    REFERENCES TUTOR 
    ( 
     id
    ) 
;

ALTER TABLE PRESCRICAO 
    ADD CONSTRAINT PRESCRICAO_CONSULTA_FK FOREIGN KEY 
    ( 
     CONSULTA_id
    ) 
    REFERENCES CONSULTA 
    ( 
     id
    ) 
;

ALTER TABLE RECOMENDACAO 
    ADD CONSTRAINT RECOMENDACAO_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE TUTOR 
    ADD CONSTRAINT TUTOR_USUARIO_FK FOREIGN KEY 
    ( 
     USUARIO_id
    ) 
    REFERENCES USUARIO 
    ( 
     id
    ) 
;

ALTER TABLE VACINACAO 
    ADD CONSTRAINT VACINACAO_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE VACINACAO 
    ADD CONSTRAINT VACINACAO_VACINA_FK FOREIGN KEY 
    ( 
     VACINA_id
    ) 
    REFERENCES VACINA 
    ( 
     id
    ) 
;

ALTER TABLE VACINACAO 
    ADD CONSTRAINT VACINACAO_VETERINARIO_FK FOREIGN KEY 
    ( 
     VETERINARIO_id
    ) 
    REFERENCES VETERINARIO 
    ( 
     id
    ) 
;

ALTER TABLE VERMIFUGACAO 
    ADD CONSTRAINT VERMIFUGACAO_PET_FK FOREIGN KEY 
    ( 
     PET_id
    ) 
    REFERENCES PET 
    ( 
     id
    ) 
;

ALTER TABLE VERMIFUGACAO 
    ADD CONSTRAINT VERMIFUGACAO_VETERINARIO_FK FOREIGN KEY 
    ( 
     VETERINARIO_id
    ) 
    REFERENCES VETERINARIO 
    ( 
     id
    ) 
;

ALTER TABLE VETERINARIO 
    ADD CONSTRAINT VETERINARIO_CLINICA_FK FOREIGN KEY 
    ( 
     CLINICA_id
    ) 
    REFERENCES CLINICA 
    ( 
     id
    ) 
;

ALTER TABLE VETERINARIO 
    ADD CONSTRAINT VETERINARIO_USUARIO_FK FOREIGN KEY 
    ( 
     USUARIO_id
    ) 
    REFERENCES USUARIO 
    ( 
     id
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                             0
-- ALTER TABLE                             36
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
-- CREATE SEQUENCE                          0
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
-- ERRORS                                   0
-- WARNINGS                                 0
