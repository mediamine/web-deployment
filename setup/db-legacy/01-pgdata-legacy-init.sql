create role mediamine WITH SUPERUSER PASSWORD 'mediamine'; 
alter role mediamine with password 'mediamine' valid until 'infinity'; 
alter role mediamine with CREATEROLE CREATEDB LOGIN REPLICATION;