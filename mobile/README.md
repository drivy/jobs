# Getaround Mobile Challenge
Looking for a job? Check out our [open positions](https://fr.getaround.com/jobs).
You can also take a look at our [engineering blog](https://getaround.tech/) to learn more about the way we work.

## Guidelines
- Clone this repo (do **not** fork it) 
- Solve the levels in ascending order 
- Only do one commit per level and include the `.git` directory when submitting your test 
- Please use Swift and UIKit for iOS 
- Please use Kotlin for Android 

## Pointers
You can have a look at the higher levels, but *please do the simplest* thing that could work for the level you’re currently solving. 

We are interested in seeing code that is clean, simple and robust, don’t overlook edge cases. 

We don’t except you to be a top-notch designer, but we want to see how you would handle some styling of this app. 
Do not hesitate to take inspiration from Getaround or anywhere else! 

Feel free to use any libs and technics you are confortable with but again, keep it simple and do not make a showcase app for every library you know. 

## Sending Your Results
Once you are done, please send your results to someone from Getaround.

- If you are already in discussion with us, send it directly to the person you are talking to.
- If not, use the application form [on every job listing](https://fr.getaround.com/jobs).

You can send your Github project link or zip your directory and send it via email.
If you do not use Github, don’t forget to attach your `.git` folder.

Good luck!
---

## Challenge
We are building a car-sharing platform. Let’s call it Getaround :)
Car owners can already list their car on our platform and backend developers have provided an API for us to query.

Our plan is now to let any person (let’s call them « driver ») see cars they could rent.

### Level 1: fetching and displaying cars

For the first version of our app, we want drivers to see the cars they can rent. For every car returned by the backend, we want to display its picture, brand, model, price per day and rating.

The API is accessible with a `GET` request at `https://github.com/drivy/mobile-technical-test/blob/master/api/cars.json`.  
Mockup #1 gives you an idea of what we would like to see.

![Mockup #1](list.png?raw=true "Mockup #1")

### Level 2: display a car details

When a driver clicks on a car, we want to display a second view with more details.  
Mockup #2 gives you an idea of what we would like to see.

![Mockup #2](details.png?raw=true "Mockup #2")
