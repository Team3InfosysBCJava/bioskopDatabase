CREATE EXTENSION pgcrypto;
UPDATE "Project".public.Users SET password = crypt("password" ,gen_salt('bf'));