CREATE TABLE GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS (
ID BIGINT NOT NULL,
DELEGACION_ID BIGINT NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
DOC_URL VARCHAR(200) NOT NULL,
DOC_NOMBRE VARCHAR(150) NOT NULL,
DOC_CONTENT_TYPE VARCHAR(50) NOT NULL,
CREADO TIMESTAMP NOT NULL,
CREADO_POR BIGINT NOT NULL,
MODIFICADO TIMESTAMP,
MODIFICADO_POR BIGINT,
BORRADO TIMESTAMP,
BORRADO_POR BIGINT,
CONSTRAINT PC_DELEGACIONES_X_PLANOS_PK PRIMARY KEY (ID),
FOREIGN KEY (DELEGACION_ID) REFERENCES GC2006_RELEASE.PC_DELEGACIONES (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.DELEGACION_ID IS 'FK: GC2006_RELEASE.PC_DELEGACIONES.ID';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.NOMBRE IS 'Nombre del plano adjunto';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.DOC_URL IS 'URL donde se almacena el fichero';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.DOC_NOMBRE IS 'Nombre del fichero';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.DOC_CONTENT_TYPE IS 'Content type del fichero';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.CREADO IS 'Fecha y hora de creación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.CREADO_POR IS 'Usuario que crea el registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.MODIFICADO IS 'Fecha y hora de modificación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.MODIFICADO_POR IS 'Usuario que realiza la modificación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.BORRADO IS 'Fecha y hora de borrado del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS.BORRADO_POR IS 'Usuario que realiza el borrado del registro';

CREATE SEQUENCE GESTION_CENTROS.PC_DELEGACIONES_X_PLANOS_SEQ
MINVALUE 1
MAXVALUE 9999999999999999
INCREMENT BY 1;

CREATE TABLE GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS (
ID BIGINT NOT NULL,
DENOMINACION VARCHAR(100) NOT NULL,
OBSERVACIONES VARCHAR(200),
ACTIVO BOOLEAN NOT NULL,
CONSTRAINT TM_PC_DELEGACIONES_SALAS_TIPOS_PK PRIMARY KEY (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS.DENOMINACION IS 'Denominación del tipo de sala';
COMMENT ON COLUMN GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS.OBSERVACIONES IS 'Observaciones del tipo de sala';
COMMENT ON COLUMN GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS.ACTIVO IS '0 - No activo, 1 -  Activo';

CREATE TABLE GESTION_CENTROS.PC_DELEGACIONES_X_SALAS (
ID BIGINT NOT NULL,
DELEGACION_ID BIGINT NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
TIPO_ID BIGINT NOT NULL,
SUPERFICIE NUMERIC(6,2) NOT NULL,
OBSERVACIONES VARCHAR(200),
CREADO TIMESTAMP NOT NULL,
CREADO_POR BIGINT,
MODIFICADO TIMESTAMP,
MODIFICADO_POR BIGINT,
BORRADO TIMESTAMP,
BORRADO_POR BIGINT,
CONSTRAINT PC_DELEGACIONES_X_SALAS_PK PRIMARY KEY (ID),
FOREIGN KEY (DELEGACION_ID) REFERENCES GC2006_RELEASE.PC_DELEGACIONES (ID),
FOREIGN KEY (TIPO_ID) REFERENCES GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.DELEGACION_ID IS 'FK: GC2006_RELEASE.PC_DELEGACIONES.ID';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.NOMBRE IS 'Nombre de la sala';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.TIPO_ID IS 'FK: GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.SUPERFICIE IS 'Superficie en metros cuadrados de la sala';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.OBSERVACIONES IS 'Observaciones de la sala';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.CREADO IS 'Fecha y hora de creación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.CREADO_POR IS 'Usuario que realiza la creación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.MODIFICADO IS 'Fecha y hora de modificación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.MODIFICADO_POR IS 'Usuario que realiza la modificación del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.BORRADO IS 'Fecha y hora de borrado del registro';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.BORRADO_POR IS 'Usuario que realiza el borrado del registro';

CREATE SEQUENCE GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_SEQ
MINVALUE 1
MAXVALUE 9999999999999999
INCREMENT BY 1;


CREATE TABLE GESTION_CENTROS.PC_DELEGACIONES_X_ENTIDADES (
ID BIGINT NOT NULL,
DELEGACION_ID BIGINT NOT NULL,
ENTIDAD_ID BIGINT NOT NULL,
CONSTRAINT PC_DELEGACIONES_X_ENTIDADES_PK PRIMARY KEY (ID),
FOREIGN KEY (DELEGACION_ID) REFERENCES GC2006_RELEASE.PC_DELEGACIONES (ID),
FOREIGN KEY (ENTIDAD_ID) REFERENCES GC2006_RELEASE.TM_ENTIDADES (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_ENTIDADES.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_ENTIDADES.DELEGACION_ID IS 'FK: GC2006_RELEASE.PC_DELEGACIONES.ID';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_ENTIDADES.ENTIDAD_ID IS 'FK: GC2006_RELEASE.TM_ENTIDADES.ID';

CREATE SEQUENCE GESTION_CENTROS.PC_DELEGACIONES_X_ENTIDADES_SEQ
MINVALUE 1
MAXVALUE 9999999999999999
INCREMENT BY 1;


insert into gestion_centros.pc_delegaciones_x_entidades (id, delegacion_id, entidad_id)
select nextval('PC_DELEGACIONES_X_ENTIDADES_SEQ'), id, entidad_id from gc2006_release.pc_delegaciones;
