# MakersBnB

## Created by Noa Farber, Mike Jeuga, Dom Meddick & Kerri McMahon

About the project:
-------
* A week-long engineering project where we worked in teams to build a clone of AirBnb
* This project was all about mastering the git workflow as a team, effective delegation and working to a specification to create a full stack web application
* Our process as a team involved morning stand ups and afternoon retros to consolidate and reflect on our progress
* We used collaboration tools like Trello, Slack and the diagramming tool Miro to organise and structure our work
* Always and forever, team Too Much Sauce! ⚡️

MONDAY - Day 1:
-------
* This day was all about plannning and discussing our goals as a team
* We practiced the git/branch/merge workflow 
* We agreed on three initial user stories to implement which made up our MVP (Minimum Viable Product):
```
As a user
So that I can start my side hustle
I want to list my accommodation for the night

As a user
So that I can have somewhere to sleep tonight
I want to see a list of all accommodation

As a user
So I can finalise my decision
I want to select my chosen accommodation
```

TUESDAY - Day 2:
-------
* We started, in earnest, implementing our three MVP user stories
* We also worked on some diagramming to start visualising the user journey through the site, from signing/logging in, browsing accommodation, selecting and booking
![flowchart](https://github.com/noarfarber/MakersBnB/blob/master/images/Flowchart.jpg)
* We created our first `Accommodation` class giving it `.all`, `.add` and `.find` methods, the first steps to creating a full CRUD application
* By the end of the day, we were halfway through the third user story 

WEDNESDAY - Day 3:
-------
* We began working on the next set of user stories and the creation of our next `User` class:
```
As a user
So that I can complete the booking 
I want to be able to choose the date of my stay and confirm

As a user
So that I can be remembered
I want to be able to register to MakersBnB
```
THURSDAY - Day 4:
-------
* We kept working on our `User` class and started working on the next user story and the creation of our `Booking` class:
```
As a user
So that I can be remembred without signing up
I want to be able to log in and out
```
* We also implemented a `booked?` method in the `Booking` class which checked the availability of the accommodation

FRIDAY - Day 5:
-------
* This day was about finalizing our project and the presentation

How to check in to your MakersBnB:
-------
1. Clone this repository
2. `cd` into the cloned directory
3. Run `bundle` to install dependencies
4. Run `rackup`
5. Navigate to http://localhost:9292/ in your browser

Database setup:
-------
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE makersBnB;`
3. Connect to the database using the `pqsl` command `\c makersBnB;`
4. Run the query we have saved in the file `01_create_accommodation.sql`
5. To create the second users table run the query saved in `02_creater_users.sql`
6. Run the query we have saved in the file `03_adding_foreign_key.sql`
7. To create the third bookings table run the query saved in `04_create_bookings.sql`

Testing database setup:
-------
1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE makersBnB_test;`
3. Connect to the database using the `pqsl` command `\c makersBnB_test;`
4. Run the query we have saved in the file `01_create_accommodation.sql`
5. To create the second users table run the query saved in `02_creater_users.sql`
6. Run the query we have saved in the file `03_adding_foreign_key.sql`
7. To create the third bookings table run the query saved in `04_create_bookings.sql`

Built using:
-------
* Sinatra
* RSpec
* Capybara
* PostgreSQL
* Bcrypt
* Ruby
* HTML
* CSS 
