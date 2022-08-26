-- @basededatos CentroMedico
-- @autor Josué Romero https://github.com/josuerom
-- @fecha 25/08/2022 20:21 HRS

CREATE TABLE Paciente (
	IdPaciente INT PRIMARY KEY IDENTITY(1,1),
	Dni INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	FNacimiento DATE NOT NULL,
	Domicilio VARCHAR(50) NOT NULL,
	IdPais INT NOT NULL,
	Telefono VARCHAR(50) NOT NULL,
	Correo VARCHAR(60) NOT NULL,
	Observaciones TEXT NOT NULL
);

CREATE TABLE Pais (
	IdPais INT PRIMARY KEY IDENTITY(1,1),
	Pais VARCHAR(50) NOT NULL
);

CREATE TABLE Especialidad (
	IdEspecialidad INT PRIMARY KEY IDENTITY(1,1),
	Especialidad VARCHAR(80) NOT NULL
);

CREATE TABLE HistoriaPaciente (
	IdHistoria INT PRIMARY KEY IDENTITY(1,1),
	IdPaciente INT NOT NULL,
	IdMedico INT NOT NULL
);

CREATE TABLE Historia (
	IdHistoria INT PRIMARY KEY IDENTITY(1,1),
	FechaHistoria DATE NOT NULL,
	Observaciones TEXT NOT NULL
);

CREATE TABLE Medico (
	IdMedico INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL
);

CREATE TABLE MedicoEspecialidad (
	IdMedico INT,
	IdEspecialidad INT IDENTITY(1,1),
	Descripcion TEXT NOT NULL,
	PRIMARY KEY (IdMedico, IdEspecialidad),
	CONSTRAINT fk_IdMedico2 FOREIGN KEY (IdMedico) REFERENCES Medico (IdMedico)
);

CREATE TABLE TurnoEstado (
	IdEstado INT PRIMARY KEY IDENTITY(1,1),
	Descripcion TEXT NOT NULL
);

CREATE TABLE Turno (
	IdTurno INT PRIMARY KEY IDENTITY(1,1),
	FechaTurno DATE NOT NULL,
	Estado CHAR(1) NOT NULL,
	Observaciones TEXT NOT NULL
);

CREATE TABLE Pago (
	IdPago INT PRIMARY KEY IDENTITY(1,1),
	Concepto VARCHAR(70) NOT NULL,
	Fecha DATE NOT NULL,
	Monto INT NOT NULL,
	Estado CHAR(1) NOT NULL,
	Observaciones TEXT NOT NULL
);

CREATE TABLE Concepto (
	IdConcepto INT PRIMARY KEY IDENTITY (1,1),
	Descripcion TEXT NOT NULL
);

CREATE TABLE TurnoPaciente (
	IdTurno INT,
	IdPaciente INT,
	IdMedico INT,
	PRIMARY KEY (IdTurno, IdPaciente, IdMedico),
	CONSTRAINT fk_IdTurno1 FOREIGN KEY (IdTurno) REFERENCES Turno (IdTurno),
	CONSTRAINT fk_IdPaciente1 FOREIGN KEY (IdPaciente) REFERENCES Paciente (IdPaciente),
	CONSTRAINT fk_IdMedico1 FOREIGN KEY (IdMedico) REFERENCES Medico (IdMedico)
);

CREATE TABLE PagoPaciente (
	IdPago INT,
	IdPaciente INT,
	IdTurno INT,
	PRIMARY KEY (IdPago, IdPaciente, IdTurno),
	CONSTRAINT fk_IdPago FOREIGN KEY (IdPago) REFERENCES Pago (IdPago),
	CONSTRAINT fk_IdPaciente2 FOREIGN KEY (IdPaciente) REFERENCES Paciente (IdPaciente),
	CONSTRAINT fk_IdTurno2 FOREIGN KEY (IdTurno) REFERENCES Turno (IdTurno)
);

-- Inserto tres registro para cada tabla
INSERT INTO Paciente(Dni, Nombre, Apellido, FNacimiento, Domicilio, IdPais, Telefono, Correo, Observaciones)
	VALUES(1001034665, 'Josu�', 'Romero Jarava', '2002-02-10', 'Av Cra. 30 #5-23', 57, '3002349876', 'josueromram@outlok.es', 'El estudiante tiene un buen desempe�o academico fura y dentro de clase.'),
	(34943229, 'Eugenia', 'Castro Lora', '1970-07-03', 'Av Cl. 26 #40-19', 55, '3208723578', 'eugeniacastro@gmail.com', 'La se�ora es una persona trabajadora y muy confiada.'),
	(1104410779, 'Cristina', 'Ferrer Vargas', '2004-12-24', 'Cra. 78B #80-45', 58, '3134427723', 'cristina.ferrer-v@uniminuto.edu.co', 'La se�orita ha demostrado estar muy acta para desempe�ar el cargo manipuladora de palo');

INSERT INTO Pais(Pais)
	VALUES ('Colombia'),
	('Brasil'),
	('Venezuela');

INSERT INTO Especialidad(Especialidad)
	VALUES ('Oncologo'),
	('Ginecologo'),
	('Optometra');

INSERT INTO HistoriaPaciente(IdPaciente, IdMedico)
	VALUES (01, 13),
	(2, 14),
	(3, 15);

INSERT INTO Historia(FechaHistoria, Observaciones)
	VALUES('2020-08-25', 'Los rayos x presentan...'),
	('2022-01-04', 'Consulta gratis por concepto...'),
	('2020-06-29', 'Prueba de COVID-19...');

INSERT INTO Medico(Nombre, Apellido)
	VALUES('Arcangel', 'Maravilla'),
	('Juan', 'Pi�a'),
	('Carolina', 'Hormonas');

INSERT INTO TurnoEstado(Descripcion)
	VALUES('Espere al medico en la sala 3...'),
	('Fue atendido con exito...'),
	('Su problema lo trata el...');

INSERT INTO Turno(FechaTurno, Estado, Observaciones)
	VALUES('2022-08-31', '1', 'Piso 1 consultorio A4'),
	('2022-09-01', '2', 'Piso 2 consultorio B2'),
	('2022-09-02', '3', 'Piso 3 consultorio C6');

INSERT INTO Pago(Concepto, Fecha, Monto, Estado, Observaciones)
	VALUES('Consulta m�dica', '2022-08-25', 200000, '1', 'La consulta fue realizada por el oncologo AM'),
	('Consulta m�dica', '2022-08-26', 180000, '2', 'La consulta est� en espera por el ginecologo JP'),
	('Consulta m�dica', '2022-08-27', 100000, '3', 'La consulta fue cancelada por la optometra CH');

INSERT INTO Concepto(Descripcion)
	VALUES('El paciente fue atendido a eso de las 6:00 hrs...'),
	('La paciente est� en espera por su cita m�dica'),
	('La paciente le han cancelado la cita m�dica');

-- No inserto registros para las tres tablas que contienen campos foranéos
--INSERT INTO PagoPaciente() VALUES();
--INSERT INTO TurnoPaciente() VALUES();
--INSERT INTO MedicoEspecialidad() VALUES(');

-- Imprimo el contenido de cada tabla por separado
SELECT * FROM Paciente;
SELECT * FROM Pais;
SELECT * FROM Especialidad;
SELECT * FROM HistoriaPaciente;
SELECT * FROM Historia;
SELECT * FROM Medico;
SELECT * FROM TurnoEstado;
SELECT * FROM Turno;
SELECT * FROM Pago;
SELECT * FROM Concepto;
SELECT * FROM PagoPaciente;
SELECT * FROM TurnoPaciente;
SELECT * FROM MedicoEspecialidad;