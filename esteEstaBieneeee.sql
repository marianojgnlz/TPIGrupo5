/*

 * ER/Studio 8.0 SQL Code Generation

 * Company :      UTN

 * Project :      TPI-grupo5(1).DM1

 * Author :       Victoria

 *

 * Date Created : Sunday, May 26, 2024 21:40:11

 * Target DBMS : Microsoft SQL Server 2008

 */



/* 

 * TABLE: Dim_Canal 

 */

use tpi;



CREATE TABLE Dim_Canal(

    id              int              IDENTITY(1,1),

    id_canal        nvarchar(255)    NULL,

    nombre_canal    nvarchar(255)     NOT NULL,

	medio    nvarchar(255)     NOT NULL,

    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (id)

)

go







IF OBJECT_ID('Dim_Canal') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Canal >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Canal >>>'

go



/* 

 * TABLE: Dim_Ciudad 

 */

CREATE TABLE Dim_Ciudad(

    id_ciudad       int            IDENTITY(1,1),

    id_provincia    int            NOT NULL,

    id_pais         int            NOT NULL,

    nombre       nvarchar(255)    NOT NULL,

    poblacion       int            NOT NULL,

	codpostal       nvarchar(255)  NOT NULL,

    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (id_ciudad, id_provincia, id_pais)

)

go



IF OBJECT_ID('Dim_Ciudad') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Ciudad >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Ciudad >>>'

go



/* 

 * TABLE: Dim_Cliente 

 */



CREATE TABLE Dim_Cliente(

    id_cliente          int               IDENTITY(1,1),

    id_ciudad           int               NOT NULL,

    id_provincia        int               NOT NULL,

    id_pais             int               NOT NULL,

    cbu                 numeric(22, 0)    NOT NULL,

    fecha_nacimiento    date              NOT NULL,

    genero              char(1)           NOT NULL,

    profesion           nvarchar(255)       NOT NULL,

    ingresos            money             NOT NULL,

    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (id_cliente, id_ciudad, id_provincia, id_pais)

)

go






IF OBJECT_ID('Dim_Cliente') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Cliente >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Cliente >>>'

go



/* 

 * TABLE: Dim_Cuenta 

 */



CREATE TABLE Dim_Cuenta(

    id            int             IDENTITY(1,1),

    id_cuenta     nvarchar(255) NULL,

    tipoCuenta    nvarchar(255)    NOT NULL,

    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (id)

)

go






IF OBJECT_ID('Dim_Cuenta') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Cuenta >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Cuenta >>>'

go







/* 

 * TABLE: Dim_Operacion 

 */



CREATE TABLE Dim_Operacion(

    id              int              IDENTITY(1,1),

    desc_op         nvarchar(500)    NULL,

    id_operacion    nvarchar(500)    NULL,

    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (id)

)

go







IF OBJECT_ID('Dim_Operacion') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Operacion >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Operacion >>>'

go



/* 

 * TABLE: Dim_Pais 

 */



CREATE TABLE Dim_Pais(

    id_pais       int            IDENTITY(1,1),

    pais_nac      nvarchar(255)    NOT NULL,

	iso    nvarchar(255)    NOT NULL,

    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (id_pais)

)

go







IF OBJECT_ID('Dim_Pais') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Pais >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Pais >>>'

go



/* 

 * TABLE: Dim_Provincia 

 */



CREATE TABLE Dim_Provincia(

    id_provincia    int            IDENTITY(1,1),

    id_pais         int            NOT NULL,

    provincia       nvarchar(255)    NOT NULL,

    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (id_provincia, id_pais)

)

go







IF OBJECT_ID('Dim_Provincia') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Provincia >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Provincia >>>'

go



/* 

 * TABLE: Dim_Sucursal 

 */




/* 

 * TABLE: Dim_Terminal 

 */



CREATE TABLE Dim_Terminal(

    id                    int             IDENTITY(1,1),

    id_terminal           nvarchar(255)             NULL,

    id_ciudad             int             NOT NULL,

    id_provincia          int             NOT NULL,

    id_pais               int             NOT NULL,

    entidad_financiera    nvarchar(255)    NOT NULL,

    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (id, id_ciudad, id_provincia, id_pais)

)

go



IF OBJECT_ID('Dim_Terminal') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Terminal >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Terminal >>>'

go



/* 

 * TABLE: Dim_Tiempo 

 */



CREATE TABLE Dim_Tiempo(

    id_tiempo           int         IDENTITY(1,1),

    Date date,
    DateString nvarchar(255),
    Day int,
    DayofYear int,
    DayofWeek int,
    DayofWeekName nvarchar(255),
    Week int,
    Month int,
    MonthName nvarchar(255),
    Quarter int,
    Year int,
    IsWeekend bit,
    IsLeapYear bit,
	IsPublicDay bit

    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (id_tiempo)

)

go







IF OBJECT_ID('Dim_Tiempo') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Tiempo >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Tiempo >>>'

go



/* 

 * TABLE: Facts_Transaccion 

 */



CREATE TABLE Facts_Transaccion(

    id_transaccion        int      IDENTITY(1,1),

    id_tiempo             int      NOT NULL,

    id_cuentaOrigen       int      NOT NULL,

    id_cuentaDestino      int      NOT NULL,

    id_terminal           int      NOT NULL,

    id_canal              int      NOT NULL,

    id_operacion          int      NOT NULL,

    id_ciudad             int      NOT NULL,

    id_provincia          int      NOT NULL,

    id_pais               int      NOT NULL,

    total_monto           money    NOT NULL,

    max_monto             money    NOT NULL,

    avg_monto             money    NOT NULL,

    cant_transacciones    int      NOT NULL,

    min_monto             money    NOT NULL,

    ok_transacciones      bit      NOT NULL,

    fail_transacciones    bit      NOT NULL,

    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (id_transaccion, id_tiempo, id_cuentaOrigen, id_cuentaDestino, id_canal, id_operacion, id_ciudad, id_provincia, id_pais, id_terminal)

)

go







IF OBJECT_ID('Facts_Transaccion') IS NOT NULL

    PRINT '<<< CREATED TABLE Facts_Transaccion >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Facts_Transaccion >>>'

go



/* 

 * TABLE: Titular 

 */



CREATE TABLE Titular(

    id_cliente      int    NOT NULL,

    id_cuenta       int    NOT NULL,

    id_ciudad       int    NOT NULL,

    id_provincia    int    NOT NULL,

    id_pais         int    NOT NULL,

    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (id_cliente, id_cuenta, id_ciudad, id_provincia, id_pais)

)

go







IF OBJECT_ID('Titular') IS NOT NULL

    PRINT '<<< CREATED TABLE Titular >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Titular >>>'

go



/* 

 * INDEX: Ref1621 

 */



CREATE INDEX Ref1621 ON Dim_Ciudad(id_provincia, id_pais)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Dim_Ciudad') AND name='Ref1621')

    PRINT '<<< CREATED INDEX Dim_Ciudad.Ref1621 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Dim_Ciudad.Ref1621 >>>'

go


/* 

 * INDEX: Ref1823 

 */



CREATE INDEX Ref1823 ON Dim_Cliente(id_pais, id_provincia, id_ciudad)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Dim_Cliente') AND name='Ref1823')

    PRINT '<<< CREATED INDEX Dim_Cliente.Ref1823 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Dim_Cliente.Ref1823 >>>'

go



/* 

 * INDEX: Ref1722 

 */



/* 

 * INDEX: Ref1520 

 */



CREATE INDEX Ref1520 ON Dim_Provincia(id_pais)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Dim_Provincia') AND name='Ref1520')

    PRINT '<<< CREATED INDEX Dim_Provincia.Ref1520 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Dim_Provincia.Ref1520 >>>'

go


/* 

 * INDEX: Ref1824 

 */



CREATE INDEX Ref1824 ON Dim_Terminal(id_pais, id_provincia, id_ciudad)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Dim_Terminal') AND name='Ref1824')

    PRINT '<<< CREATED INDEX Dim_Terminal.Ref1824 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Dim_Terminal.Ref1824 >>>'

go



/* 

 * INDEX: Ref97 

 */



CREATE INDEX Ref97 ON Facts_Transaccion(id_cuentaOrigen)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref97')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref97 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref97 >>>'

go



/* 

 * INDEX: Ref108 

 */



CREATE INDEX Ref108 ON Facts_Transaccion( id_ciudad, id_pais, id_provincia)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref108')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref108 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref108 >>>'

go



/* 

 * INDEX: Ref119 

 */



CREATE INDEX Ref119 ON Facts_Transaccion(id_tiempo)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref119')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref119 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref119 >>>'

go



/* 

 * INDEX: Ref53 

 */



CREATE INDEX Ref53 ON Facts_Transaccion(id_operacion)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref53')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref53 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref53 >>>'

go



/* 

 * INDEX: Ref74 

 */



CREATE INDEX Ref74 ON Facts_Transaccion(id_ciudad, id_pais, id_provincia)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref74')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref74 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref74 >>>'

go



/* 

 * INDEX: Ref85 

 */



CREATE INDEX Ref85 ON Facts_Transaccion(id_canal)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref85')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref85 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref85 >>>'

go



/* 

 * INDEX: Ref96 

 */



CREATE INDEX Ref96 ON Facts_Transaccion(id_cuentaDestino)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Facts_Transaccion') AND name='Ref96')

    PRINT '<<< CREATED INDEX Facts_Transaccion.Ref96 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Facts_Transaccion.Ref96 >>>'

go



/* 

 * INDEX: Ref1218 

 */



CREATE INDEX Ref1218 ON Titular(id_pais, id_provincia, id_ciudad, id_cliente)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Titular') AND name='Ref1218')

    PRINT '<<< CREATED INDEX Titular.Ref1218 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Titular.Ref1218 >>>'

go



/* 

 * INDEX: Ref919 

 */



CREATE INDEX Ref919 ON Titular(id_cuenta)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Titular') AND name='Ref919')

    PRINT '<<< CREATED INDEX Titular.Ref919 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Titular.Ref919 >>>'

go

/* 

 * TABLE: Dim_Ciudad 

 */



ALTER TABLE Dim_Ciudad ADD CONSTRAINT RefDim_Provincia21 

    FOREIGN KEY (id_provincia, id_pais)

    REFERENCES Dim_Provincia(id_provincia, id_pais)

go

/* 

 * TABLE: Dim_Provincia 

 */



ALTER TABLE Dim_Provincia ADD CONSTRAINT RefDim_Pais20 

    FOREIGN KEY (id_pais)

    REFERENCES Dim_Pais(id_pais)

go




/* 

 * TABLE: Facts_Transaccion 

 */


ALTER TABLE Facts_Transaccion ADD CONSTRAINT RefDim_Operacion3 

    FOREIGN KEY (id_operacion)

    REFERENCES Dim_Operacion(id)

go


ALTER TABLE Facts_Transaccion ADD CONSTRAINT RefDim_Canal5 

    FOREIGN KEY (id_canal)

    REFERENCES Dim_Canal(id)

go



ALTER TABLE Facts_Transaccion ADD CONSTRAINT RefDim_Cuenta6 

    FOREIGN KEY (id_cuentaDestino)

    REFERENCES Dim_Cuenta(id)

go



ALTER TABLE Facts_Transaccion ADD CONSTRAINT RefDim_Cuenta7 

    FOREIGN KEY (id_cuentaOrigen)

    REFERENCES Dim_Cuenta(id)

go



ALTER TABLE Facts_Transaccion ADD CONSTRAINT RefDim_Terminal8 

    FOREIGN KEY (id_terminal, id_ciudad, id_provincia, id_pais)

    REFERENCES Dim_Terminal(id, id_ciudad, id_provincia, id_pais)

go



ALTER TABLE Facts_Transaccion ADD CONSTRAINT RefDim_Tiempo9 

    FOREIGN KEY (id_tiempo)

    REFERENCES Dim_Tiempo(id_tiempo)

go





/* 

 * TABLE: Titular 

 */



ALTER TABLE Titular ADD CONSTRAINT RefDim_Cliente18 

    FOREIGN KEY (id_cliente, id_ciudad, id_provincia, id_pais)

    REFERENCES Dim_Cliente(id_cliente, id_ciudad, id_provincia, id_pais)

go



ALTER TABLE Titular ADD CONSTRAINT RefDim_Cuenta19 

    FOREIGN KEY (id_cuenta)

    REFERENCES Dim_Cuenta(id)

go

