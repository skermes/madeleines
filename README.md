# madeleines

FIXME

## Prerequisites

You will need [Leiningen][1] 1.7.0 or above installed.

[1]: https://github.com/technomancy/leiningen

## Running

The application looks for a DATABASE_URL environment variable (in order to
play nice with Heroku) to connect to the database.
When running on Sean's VM on jeanne-poisson, set it with

    export DATABASE_URL=postgresql://skermes:skermes@localhost:5432/madeleines

To start a web server for the application, run:

    lein ring server

## License

Copyright © 2013 FIXME
