-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE IF NOT EXISTS public.departments
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no),
    CONSTRAINT departments_dept_name_key UNIQUE (dept_name)
)

TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;

-- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE IF NOT EXISTS public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no, from_date, to_date),
    CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.salaries (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;

-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE IF NOT EXISTS public.dept_manager
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;

-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    gender character varying COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
)

TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;

-- Table: public.mentorship

-- DROP TABLE public.mentorship;

CREATE TABLE IF NOT EXISTS public.mentorship
(
    emp_no integer,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    birth_date date,
    from_date date,
    to_date date,
    title character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.mentorship
    OWNER to postgres;

-- Table: public.ret_titles

-- DROP TABLE public.ret_titles;

CREATE TABLE IF NOT EXISTS public.ret_titles
(
    emp_no integer,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    title character varying COLLATE pg_catalog."default",
    from_date date,
    to_date date
)

TABLESPACE pg_default;

ALTER TABLE public.ret_titles
    OWNER to postgres;

-- Table: public.retirement

-- DROP TABLE public.retirement;

CREATE TABLE IF NOT EXISTS public.retirement
(
    emp_no integer,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    birth_date date,
    from_date date,
    to_date date,
    title character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.retirement
    OWNER to postgres;

-- Table: public.retiring_titles_table

-- DROP TABLE public.retiring_titles_table;

CREATE TABLE IF NOT EXISTS public.retiring_titles_table
(
    count bigint,
    title character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.retiring_titles_table
    OWNER to postgres;

-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE IF NOT EXISTS public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_no),
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;

-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE IF NOT EXISTS public.titles
(
    emp_no integer NOT NULL,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT titles_pkey PRIMARY KEY (emp_no, title, from_date, to_date),
    CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;

-- Table: public.unique_titles

-- DROP TABLE public.unique_titles;

CREATE TABLE IF NOT EXISTS public.unique_titles
(
    emp_no integer,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    title character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.unique_titles
    OWNER to postgres;
