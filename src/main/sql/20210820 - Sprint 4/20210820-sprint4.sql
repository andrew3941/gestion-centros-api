------------------------------------------------------------------------------------------------------------------------
-- TABLE GESTION_CENTROS.TM_PROVEEDORES_TIPOS
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTION_CENTROS.TM_PROVEEDORES_TIPOS (
    ID BIGINT NOT NULL,
    DENOMINACION VARCHAR(100) NOT NULL,
    OBSERVACIONES VARCHAR(200),
    ACTIVO BOOLEAN NOT NULL,
    ORDEN NUMERIC,
    CONSTRAINT TM_PROVEEDORES_TIPOS_PK PRIMARY KEY (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_TIPOS.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_TIPOS.DENOMINACION IS 'Denominaci�n del tipo de proveedor';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_TIPOS.OBSERVACIONES IS 'Observaciones sobre el tipo de proveedor';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_TIPOS.ACTIVO IS 'False - No activo, True -  Activo';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_TIPOS.ORDEN IS 'Orden a mostrar';

------------------------------------------------------------------------------------------------------------------------
-- TABLE GESTION_CENTROS.TM_PERIODICIDAD_GASTO
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTION_CENTROS.TM_PERIODICIDAD_GASTO (
ID BIGINT NOT NULL,
DENOMINACION VARCHAR(100) NOT NULL,
OBSERVACIONES VARCHAR(200),
ACTIVO BOOLEAN NOT NULL,
CONSTRAINT TM_PERIODICIDAD_GASTO_PK PRIMARY KEY (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.TM_PERIODICIDAD_GASTO.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.TM_PERIODICIDAD_GASTO.DENOMINACION IS 'Denominaci�n del tipo de periodicidad';
COMMENT ON COLUMN GESTION_CENTROS.TM_PERIODICIDAD_GASTO.OBSERVACIONES IS 'Observaciones sobre el tipo de periodicidad';
COMMENT ON COLUMN GESTION_CENTROS.TM_PERIODICIDAD_GASTO.ACTIVO IS 'False - No activo, True -  Activo';

INSERT INTO GESTION_CENTROS.TM_PERIODICIDAD_GASTO (ID, DENOMINACION, OBSERVACIONES, ACTIVO) VALUES (1, 'Mensual', NULL, TRUE);
INSERT INTO GESTION_CENTROS.TM_PERIODICIDAD_GASTO (ID, DENOMINACION, OBSERVACIONES, ACTIVO) VALUES (2, 'Bimensual', NULL, TRUE);
INSERT INTO GESTION_CENTROS.TM_PERIODICIDAD_GASTO (ID, DENOMINACION, OBSERVACIONES, ACTIVO) VALUES (3, 'Trimestral', NULL, TRUE);
INSERT INTO GESTION_CENTROS.TM_PERIODICIDAD_GASTO (ID, DENOMINACION, OBSERVACIONES, ACTIVO) VALUES (4, 'Cuatrimestral', NULL, TRUE);
INSERT INTO GESTION_CENTROS.TM_PERIODICIDAD_GASTO (ID, DENOMINACION, OBSERVACIONES, ACTIVO) VALUES (5, 'Semestral', NULL, TRUE);
INSERT INTO GESTION_CENTROS.TM_PERIODICIDAD_GASTO (ID, DENOMINACION, OBSERVACIONES, ACTIVO) VALUES (6, 'Anual', NULL, TRUE);

------------------------------------------------------------------------------------------------------------------------
-- TABLE GESTION_CENTROS.TM_PROVEEDORES_AREAS
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTION_CENTROS.TM_PROVEEDORES_AREAS (
ID BIGINT NOT NULL,
DENOMINACION VARCHAR(100) NOT NULL,
OBSERVACIONES VARCHAR(200),
ACTIVO BOOLEAN NOT NULL,
ORDEN NUMERIC,
CONSTRAINT TM_PROVEEDORES_AREAS_PK PRIMARY KEY (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_AREAS.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_AREAS.DENOMINACION IS 'Denominaci�n del area';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_AREAS.OBSERVACIONES IS 'Observaciones sobre el area';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_AREAS.ACTIVO IS 'False - No activo, True -  Activo';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_AREAS.ORDEN IS 'Orden a mostrar';

------------------------------------------------------------------------------------------------------------------------
-- TABLE GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO (
ID BIGINT NOT NULL,
DENOMINACION VARCHAR(100) NOT NULL,
OBSERVACIONES VARCHAR(200),
ACTIVO BOOLEAN NOT NULL,
CONSTRAINT TM_PROVEEDORES_EVALUACION_TIPO_PK PRIMARY KEY (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO.DENOMINACION IS 'Denominaci�n de la evaluaci�n';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO.OBSERVACIONES IS 'Observaciones sobre la evaluaci�n';
COMMENT ON COLUMN GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO.ACTIVO IS 'False - No activo, True -  Activo';

------------------------------------------------------------------------------------------------------------------------
-- TABLE GESTION_CENTROS.PROVEEDORES
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTION_CENTROS.PROVEEDORES (
ID BIGINT NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
CIF VARCHAR(14) NOT NULL,
TIPO_ID BIGINT NOT NULL,
TIPO_EVALUACION_ID BIGINT NOT NULL,
LOCALIDAD_ID BIGINT,
CODIGO_POSTAL VARCHAR(5),
DIRECCION VARCHAR(150),
EMAIL VARCHAR(150),
PERSONA_CONTACTO VARCHAR(250) NOT NULL,
TELEFONO VARCHAR(15),
DETALLES VARCHAR(2000),
DOC_URL VARCHAR(200),
DOC_NOMBRE VARCHAR(150),
DOC_CONTENT_TYPE VARCHAR(100),
FECHA_INICIO_SERVICIO DATE,
FECHA_FIN_SERVICIO DATE,
ACTIVO BOOLEAN NOT NULL,
CREADO TIMESTAMP NOT NULL,
CREADO_POR BIGINT NOT NULL,
MODIFICADO TIMESTAMP,
MODIFICADO_POR BIGINT,
CONSTRAINT PROVEEDORES_PK PRIMARY KEY (ID),
FOREIGN KEY (TIPO_ID) REFERENCES GESTION_CENTROS.TM_PROVEEDORES_TIPOS (ID),
FOREIGN KEY (TIPO_EVALUACION_ID) REFERENCES GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO (ID),
FOREIGN KEY (LOCALIDAD_ID) REFERENCES VIG_SALUD.LOCALIDADES (LOC_ID),
FOREIGN KEY (CREADO_POR) REFERENCES GC2006_RELEASE.PC_USUARIOS (ID),
FOREIGN KEY (MODIFICADO_POR) REFERENCES GC2006_RELEASE.PC_USUARIOS (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.NOMBRE IS 'Nombre del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.CIF IS 'CIF del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.TIPO_ID IS 'FK: GESTION_CENTROS.TM_PROVEEDORES_TIPO.ID';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.TIPO_EVALUACION_ID IS 'FK: GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO.ID';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.LOCALIDAD_ID IS 'FK: VIG_SALUD.LOCALIDADES.LOC_ID';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.CODIGO_POSTAL IS 'CP del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.DIRECCION IS 'Direcci�n social del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.EMAIL IS 'Email del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.PERSONA_CONTACTO IS 'Persona de contacto del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.TELEFONO IS 'Tel�fono de contacto del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.DETALLES IS 'Observaciones sobre el proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.DOC_URL IS 'URL donde se almacena el fichero';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.DOC_NOMBRE IS 'Nombre del fichero';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.DOC_CONTENT_TYPE IS 'Content type del fichero';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.FECHA_INICIO_SERVICIO IS 'Fecha de inicio del servicio';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.FECHA_FIN_SERVICIO IS 'Fecha de fin del servicio';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.ACTIVO IS 'Indica si el proveedor est� activo o no';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.CREADO IS 'Fecha de creaci�n del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.CREADO_POR IS 'FK: GC2006_RELEASE.PC_USUARIOS.ID';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.MODIFICADO IS 'Fecha de �ltima modificaci�n del proveedor';
COMMENT ON COLUMN GESTION_CENTROS.PROVEEDORES.MODIFICADO_POR IS 'FK: GC2006_RELEASE.PC_USUARIOS.ID';

CREATE SEQUENCE GESTION_CENTROS.PROVEEDORES_SEQ MINVALUE 1 MAXVALUE 9999999999999999 INCREMENT BY 1;



------------------------------------------------------------------------------------------------------------------------
-- TABLE GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_X_TIPOS
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_X_TIPOS (
ID BIGINT NOT NULL,
DELEGACION_X_SALA_ID BIGINT NOT NULL,
TIPO_ID BIGINT NOT NULL,
CONSTRAINT PC_DELEGACIONES_X_SALAS_X_TIPOS_PK PRIMARY KEY (ID),
FOREIGN KEY (DELEGACION_X_SALA_ID) REFERENCES GESTION_CENTROS.PC_DELEGACIONES_X_SALAS (ID),
FOREIGN KEY (TIPO_ID) REFERENCES GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS (ID)
);

COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_X_TIPOS.ID IS 'Primary key de la tabla';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_X_TIPOS.DELEGACION_X_SALA_ID IS 'FK: GESTION_CENTROS.PC_DELEGACIONES_X_SALAS.ID';
COMMENT ON COLUMN GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_X_TIPOS.TIPO_ID IS 'FK: GESTION_CENTROS.TM_PC_DELEGACIONES_SALAS_TIPOS.ID';

CREATE SEQUENCE GESTION_CENTROS.PC_DELEGACIONES_X_SALAS_X_TIPOS_SEQ
MINVALUE 1
MAXVALUE 9999999999999999
INCREMENT BY 1;


------------------------------------------------------------------------------------------------------------------------
-- Insert data
------------------------------------------------------------------------------------------------------------------------

-- GESTION_CENTROS.TM_PROVEEDORES_TIPOS
insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (6, 'AGUA Y ALCANTARILLADO', NULL, true, 1);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (13, 'ALQUILER LOCALES', NULL, true, 2);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (4, 'CORREOS', NULL, true, 3);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (2, 'ELECTRICIDAD', NULL, true, 4);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (8, 'EPIS COVID-19', NULL, true, 5);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (7, 'EPIS T�CNICOS', NULL, true, 6);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (1, 'LIMPIEZA', NULL, true, 7);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (3, 'MANTENIMIENTO FOTOCOPIADORAS', NULL, true, 8);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (14, 'MANTENIMIENTO Y REPARACI�N ELEMENTOS DE TRANSPORTE', NULL, true, 9);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (11, 'MATERIAL IMPRENTA', NULL, true, 10);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (10, 'MATERIAL OFICINA', NULL, true, 11);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (12, 'PARKING', NULL, true, 12);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (15, 'REPARACI�N Y ELEMENTOS DE INSTALACIONES', NULL, true, 13);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (16, 'SEGUROS LOCALES', NULL, true, 14);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (9, 'TELEFON�A M�VIL', NULL, true, 15);

insert into gestion_centros.tm_proveedores_tipos (id, denominacion, observaciones, activo, orden)
values (5, 'VEH�CULOS', NULL, true, 16);

-- GESTION_CENTROS.TM_PROVEEDORES_AREAS
insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (1, 'COMPRAS', '', true, 3);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (2, 'INFRAESTRUCTURAS', '', true, 5);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (3, 'TIC', '', true, 8);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (4, 'TECNICA', '', true, 7);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (5, 'VS', '', true, 9);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (6, 'ADMINISTRACION', '', true, 1);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (7, 'COMERCIAL', '', true, 2);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (8, 'SAC', '', true, 6);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (9, 'FORMACION', '', true, 4);

insert into gestion_centros.tm_proveedores_areas (id, denominacion, observaciones, activo, orden)
values (10, 'OTROS', '', true, 50);


-- GESTION_CENTROS.TM_PROVEEDORES_EVALUACION_TIPO
insert into gestion_centros.tm_proveedores_evaluacion_tipo (id, denominacion, observaciones, activo)
values (1, 'CONTINUA', '', true);

insert into gestion_centros.tm_proveedores_evaluacion_tipo (id, denominacion, observaciones, activo)
values (2, 'TRIMESTRAL', '', true);

insert into gestion_centros.tm_proveedores_evaluacion_tipo (id, denominacion, observaciones, activo)
values (3, 'SEMESTRAL', '', true);

insert into gestion_centros.tm_proveedores_evaluacion_tipo (id, denominacion, observaciones, activo)
values (4, 'ANUAL', '', true);

