# Ben The Shark

## Description
**Ben** is a nice great white shark, that instead of showing up by surprise, is friendly enough to publish updates on Twitter about his and his friends last location. Please, [follow Ben](https://www.twitter.com/bentheshark).

### Configuration

* Install **PostgreSQL** however you want. A good option if you're kind of clumsy with these things, and you work on OSX is [Postgres.app](http://postgresapp.com/) by @mattt.
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
* Set the following environment variables accordingly:
	* `TWITTER_CONSUMER_KEY`
	* `TWITTER_CONSUMER_SECRET`
	* `TWITTER_ACCESS_TOKEN`
	* `TWITTER_ACCESS_SECRET`

* You're good to go!


### Run the tests
```bash
rake spec
```




