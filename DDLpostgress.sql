create type avail as enum('Y','N');
CREATE TABLE IF NOT EXISTS public.Users(
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username varchar(50) not null,
    email_id varchar(255) not null,
    password varchar(255) not null,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS public.Films(
  film_code INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  film_name varchar(50) NOT NULL,
  airin public.avail not null default 'N',
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 

CREATE TABLE IF NOT EXISTS public.Seats (
  seat_no INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  seat_available public.avail not null default 'N',
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS public.Studio (
  studio_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  studio_name varchar(100) NOT NULL,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS public.Schedules (
  schedule_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  film_code INT NOT NULL,
  tanggal_tayang date NOT NULL,
  jam_mulai time NOT NULL,
  jam_selesai time NOT NULL,
  harga_tiket varchar(100) NOT NULL,
  FOREIGN KEY (film_code) REFERENCES public.Films(film_code),
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS public.Reservations (
  seat_no INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  studio_id INT NOT NULL,
  user_id int NOT null,
  schedule_id int not null,
  FOREIGN KEY (studio_id) REFERENCES public.Studio(studio_id),
  foreign key (user_id) references public.Users(user_id),
  foreign key (schedule_id) references public.Schedules(schedule_id),
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
 );