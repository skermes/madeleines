> And once again I had recognized the taste of the crumb of madeleine soaked in
> her decoction of lime-flowers which my aunt used to give me (although I did
> not yet know and must long postpone the discovery of why this memory made me
> so happy), immediately the old gray house upon the street, where her room was,
> rose up like the scenery of a theater.
- Marcel Proust, _In Search of Lost Time_

I used to use delicious to near-religiously bookmark everything remotely
interesting on the web.  With precious few exceptions (references for school
papers, a janky system of tags approximating a feed reader) I never looked at
anything in my bookmarking system again.  The links were all meticulously
tagged and annotated and catalogued and forgotten.  Which sucks, because there
was some good stuff in there.  It's why I bothered bookmarking it in the first
place.  I stopped sometime around the time I left college, and my delicious
account got bought, traded, sold and, I think, finally killed.

I've flirted with starting a new bookmarking account, but all the services (the
frontrunner seems to be pinboard at this point) have the same memory hole
problem that I had years ago.  So this is my answer: Madeleines, the anti-
bookmarking service.

Madeleines will let me stuff as many urls into it as I want, but unlike your
pinboards and deliciouses, there's no way for me to see all of them once I do.
Instead, it'll choose a random link every day and show it to me.  One every day,
no more, no less.  If I decide that today's link is a bit crap I can tell it
to get rid of it, and it'll never come back.  But I still can't get a new link
for that day.

## Local Development

You will need [Leiningen][1] 2.2.0 or above installed.

The application looks for a DATABASE_URL environment variable (in order to
play nice with Heroku) to connect to the database.  When running on my VM on
jeanne-poisson, set it with

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

[1]: https://github.com/technomancy/leiningen