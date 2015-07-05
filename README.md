# Ben The Shark

## Description
**Ben** is a nice great white shark, that instead of showing up by surprise, is friendly enough to publish updates on Twitter about his and his friends last location. Please, [follow Ben](https://www.twitter.com/bentheshark).

### Configuration

* Install **PostgreSQL** however you want. A good option if you're kind of clumpsy with this things, and you work on OSX is [Postgres.app](http://postgresapp.com/) by @mattt.
* Type this in your `psql` terminal:
```sql 
CREATE USER ben_the_shark WITH createdb password 'sharky';
```
* Then type this in your terminal
```bash
bundle install
rake db:create
rake db:migrate
```
* You're good to go!



