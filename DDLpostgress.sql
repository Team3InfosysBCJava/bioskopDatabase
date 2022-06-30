create type avail as enum('Y','N');
CREATE TABLE IF NOT EXISTS public.user(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama varchar(100) not null,
    username varchar(50) not null,
    email varchar(255) not null,
    password varchar(255) not null
);

CREATE TABLE IF NOT EXISTS public.films(
  film_code varchar(50) PRIMARY KEY,
  film_name varchar(50) NOT NULL,
  airing public.avail not null default 'N'
); 

CREATE TABLE IF NOT EXISTS public.seats (
  seat_no varchar(50) PRIMARY KEY,
  seat_available public.avail not null default 'N',
);

CREATE TABLE IF NOT EXISTS public.studio (
  studio_id varchar(100) PRIMARY KEY,
  studio_name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.schedules (
  schedule_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  film_code varchar(100) NOT NULL,
  tanggal_tayang date NOT NULL,
  jam_mulai time NOT NULL,
  jam_selesai time NOT NULL,
  harga_tiket varchar(100) NOT NULL,
  FOREIGN KEY (film_code) REFERENCES public.films(film_code)
);

CREATE TABLE IF NOT EXISTS public.reservations (
  seat_no varchar(100) not null,
  studio_id varchar(100) NOT NULL,
  user_id int NOT null,
  schedule_id int not null,
  FOREIGN KEY (seat_no) REFERENCES public.seat(seat_no),
  FOREIGN KEY (studio_id) REFERENCES public.studio(studio_id),
  foreign key (user_id) references public.user(id),
  foreign key (schedule_id) references public.schedules(schedule_id)
 );
