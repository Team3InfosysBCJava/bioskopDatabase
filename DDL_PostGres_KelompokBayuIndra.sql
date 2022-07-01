--FUNCTION FOR AUTOMATIC UPDATE TIMESTAMP
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--DDL DATABASE TABLES
CREATE TABLE IF NOT EXISTS "Project".public.Users(
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username varchar(50) not null,
    email_id varchar(255) not null,
    password varchar(255) not null,
    created_at TIMESTAMP not null DEFAULT NOW(),
    updated_at TIMESTAMP not null DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "Project".public.Films(
    film_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100) not null,
    is_playing int not null default 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "Project".public.Seats(
    seat_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    seat_number int not null,
    studio_name varchar(50) not null,
    is_available int not null default 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "Project".public.Schedules(
    schedule_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    film_id int not null,
    seat_id int not null,
    price int not null,
    date_show date not null,
    show_start time not null,
    show_end time not null,  
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    foreign key (film_id) REFERENCES Films(film_id),
    foreign key (seat_id) REFERENCES Seats(seat_id)

);

CREATE TABLE IF NOT EXISTS "Project".public.Reservation(
    reservation_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id int not null,
    schedule_id int not null,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at timestamp DEFAULT NOW(),
    foreign key (user_id) references Users(user_id),
    foreign key (schedule_id) references Schedules(schedule_id)
);

--TRIGGER FOR AUTOMATIC UPDATE TIMESTAMP
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON films 
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

--DATA SEEDING
INSERT INTO Films (name, is_playing) 
VALUES('American Pie', 0) RETURNING *;

INSERT INTO Films (name, is_playing) 
VALUES('Cinta Fitri', 0) RETURNING *;

--TESTING AUTO-UPDATE TRIGGER
UPDATE Films 
SET name = 'cinta Fitri 3' 
WHERE film_id = 2 returning *;



