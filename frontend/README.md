# Getaround EU Frontend Challenge (previously Drivy)

Looking for a job? Check out our [open positions](https://uk.getaround.com.com/jobs).
You can also take a look at our [engineering blog](https://drivy.engineering/) to learn more about the way we work.

## Guidelines

- Make sure you have `git`, `node`, and `npm` or `yarn` installed locally
- Clone this repo (do **not** fork it)
- Solve the levels in ascending order
- Only do one commit per level and include the `.git` directory when submitting your test
- To start the app:
  - run `yarn install` or `npm install`
  - run `yarn start` or `npm run start`
- Edit files in `./src`

## Pointers

You can have a look at the higher levels, but please do the simplest thing that could work for the level you're currently solving.

We are interested in seeing code that is clean, extensible and robust, so don't overlook edge cases.

Please also note that all prices are stored as integers (in cents). Do not forget to format them if needed.

We don't expect you to be a top-notch designer, but we want to see how you would handle some styling of this app. Do not hesitate to take inspiration from Getaround or anywhere else!

This test is framework agnostic, feel free to stick to vanilla HTML/JS/CSS or go with anything else. If you plan on using something else (e.g. React, Vue, TypeScript, styled components, ...), you'll find info on how to set it up in [Parcel's documentation](https://en.parceljs.org/recipes.html).

## Sending Your Results

Once you are done, please send your results to someone from Getaround.

- If you are already in discussion with us, send it directly to the person you are talking to.
- If not, use the application form [on every job listing](https://en.drivy.com/jobs).

You can send your Github project link or zip your directory and send it via email.
If you do not use Github, don't forget to attach your `.git` folder.

Good luck!

---

## Challenge

We are building a car-sharing platform. Let's call it Getaround :)
Car owners can already list their car on our platform and backend developers have provided an API for us to query.

Our plan is now to let any person (let's call them "driver") see cars they could rent.

### Level 1: fetching and displaying cars

For the first version of our app, we want drivers to see the cars they can rent. For every car returned by the backend, we want to display its picture, brand, model, price per day and price per km.

The API is accessible with a `GET` request at `/cars.json` on your local server.

### Level 2: filtering by duration and distance

Unfortunately, some cars are only available for short rentals (less than a given number of days or kilometers, defined by the owner).

To only see available cars, drivers should be able to input the duration of their rental and the distance they plan on driving.

The different values they should be able to select are:

- duration (in days): between 1 and 30
- distance (in kms): 50, 100, 150, 200, 250, 300, ... up to 3000

When drivers edit these inputs, another request to the API, with `duration` and `distance` query parameters, should be made. The API will only return available cars for the given parameters in the response. _Please do not use the `availability` fields of the response, they are only here for debugging purposes._

### Level 3: calculate rental price

We heard of drivers complaining about not knowing the price for their rental. Unfortunately, the backend developers forgot to add this information so we'll have to calculate it ourselves and display it.

The rental price is the sum of:

- A time component: the number of rental days multiplied by the car's price per day
- A distance component: the number of km multiplied by the car's price per km

Let's calculate and display this price for every car.

### Level 4: price degressivity

To be as competitive as possible, we decide to have a decreasing pricing for longer rentals.

New rules:

- price per day decreases by 10% after 1 day
- price per day decreases by 30% after 4 days
- price per day decreases by 50% after 10 days

Adapt the rental price computation to take these new rules into account.
