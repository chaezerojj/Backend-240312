CREATE TABLE dept (
    dno           NUMBER NOT NULL,
    dname         VARCHAR2(50),
    office        VARCHAR2(50),
    professer_ssn VARCHAR2(100) NOT NULL
);

ALTER TABLE dept ADD CONSTRAINT dept_pk PRIMARY KEY ( dno );

CREATE TABLE graduate (
    ssn      VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    name     VARCHAR2(40),
    age      NUMBER,
    deg_prog VARCHAR2(50),
    dept_dno NUMBER NOT NULL
);

ALTER TABLE graduate ADD CONSTRAINT graduate_pk PRIMARY KEY ( ssn );

CREATE TABLE professer (
    ssn        VARCHAR2(100) NOT NULL,
    name       VARCHAR2(40),
    age        NUMBER,
    rank       VARCHAR2(40),
    speciality VARCHAR2(50)
);

ALTER TABLE professer ADD CONSTRAINT professer_pk PRIMARY KEY ( ssn );

CREATE TABLE project (
    pid        VARCHAR2(100) NOT NULL,
    sponsor    VARCHAR2(40) NOT NULL,
    start_date DATE,
    end_date   DATE,
    budget     NUMBER
);

ALTER TABLE project ADD CONSTRAINT project_pk PRIMARY KEY ( pid );

CREATE TABLE "work-dept" (
    pct_time      NUMBER,
    professer_ssn VARCHAR2(100) NOT NULL,
    dept_dno      NUMBER NOT NULL
);

CREATE TABLE "work-in" (
    professer_ssn VARCHAR2(100) NOT NULL
);

CREATE TABLE "work-prog" (
    graduate_ssn VARCHAR2(100) NOT NULL,
    project_pid  VARCHAR2(100) NOT NULL
);

ALTER TABLE graduate
    ADD CONSTRAINT dno FOREIGN KEY ( dept_dno )
        REFERENCES dept ( dno );

ALTER TABLE "work-dept"
    ADD CONSTRAINT dnov1 FOREIGN KEY ( dept_dno )
        REFERENCES dept ( dno );

ALTER TABLE graduate
    ADD CONSTRAINT graduate_graduate_fk FOREIGN KEY ( ssn )
        REFERENCES graduate ( ssn );

ALTER TABLE "work-prog"
    ADD CONSTRAINT graduatessn FOREIGN KEY ( graduate_ssn )
        REFERENCES graduate ( ssn );

ALTER TABLE "work-prog"
    ADD CONSTRAINT pid FOREIGN KEY ( project_pid )
        REFERENCES project ( pid );

ALTER TABLE "work-dept"
    ADD CONSTRAINT professorssn FOREIGN KEY ( professer_ssn )
        REFERENCES professer ( ssn );

ALTER TABLE "work-in"
    ADD CONSTRAINT professorssnv1 FOREIGN KEY ( professer_ssn )
        REFERENCES professer ( ssn );

ALTER TABLE project
    ADD CONSTRAINT project_professer_fk FOREIGN KEY ( pid )
        REFERENCES professer ( ssn );

ALTER TABLE dept
    ADD CONSTRAINT runprofessorssn FOREIGN KEY ( professer_ssn )
        REFERENCES professer ( ssn );