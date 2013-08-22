# madeleines

FIXME

## Prerequisites

You will need [Leiningen][1] 2.2.0 or above installed.

[1]: https://github.com/technomancy/leiningen

## Running

The application looks for a DATABASE_URL environment variable (in order to
play nice with Heroku) to connect to the database.
When running on Sean's VM on jeanne-poisson, set it with

    export DATABASE_URL=postgresql://skermes:skermes@localhost:5432/madeleines

The database has one table, defined like this:

    create table remembrances (
       id serial primary key,
       url varchar,
       title varchar,
       preview text,
       remembered_on date,
       dropped_on date
     );

To start a web server for the application, run:

    lein ring server

## License

Copyright © 2013 FIXME
