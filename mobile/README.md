# Getaround Mobile Challenge 
Looking for a job? Check out our [open positions](https://getaround.com/careers).\
You can also take a look at our [engineering blog](https://getaround.tech/) to learn more about the way we work. 

*Estimated duration : 3-4 hours* 

## Guidelines 
- Clone this repo (do **not** fork it) 
- Solve the levels in ascending order 
- Only do one commit per level and include the `.git` directory when submitting your test 
- For iOS, please use Swift. You can use either SwiftUI or UIKit as UI Framework. Please follow the [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/). 
- For Android, please use Kotlin. 

## Pointers 
Please do the simplest thing that could work for the level you’re currently solving.\
We are interested in seeing code that is clean, simple and robust, don’t overlook edge cases. 

We don’t except you to be a top-notch designer, but we want to see how you would handle some styling of this app.\
Make sure that the UX respects the standard platform guidelines, and that the UI is fluid.\
Do not hesitate to take inspiration from Getaround or your favorite app ! 

Feel free to use any libraries and technics you are confortable with but again, keep it simple and do not make a showcase app for every library you know. 

## Sending Your Results
Once you are done, please send your results to someone from Getaround.

- If you are already in discussion with us, send it directly to the person you are talking to.
- If not, use the application form [on every job listing](https://fr.getaround.com/jobs).

You can send your Github project link or zip your directory and send it via email.\
If you do not use Github, don’t forget to attach your `.git` folder.

Good luck!
---

## Challenge
We are building a car-sharing platform. Let’s call it Getaround :)\
Car owners can already list their car on our platform and backend developers have provided an API for us to query.

Our plan is now to let any person (let’s call them « driver ») see cars they could rent.

### Level 1: fetch and display cars

For the first version of our app, we want drivers to see the cars they can rent.\
For every car returned by the backend, we want to display its picture, brand, model, price per day and rating.

The API is accessible with a `GET` request at `https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/cars.json`.

Mockup #1 gives you an idea of what we would like to see.

![Mockup #1](https://github.com/drivy/jobs/assets/1333507/ede3d183-c97e-4adb-881b-851febfa756d)

### Level 2: display a car details

When a driver clicks on a car, we want to display a second view with more details.

Mockup #2 gives you an idea of what we would like to see.

![Mockup #2](https://github.com/drivy/jobs/assets/1333507/308d043a-b485-4389-ac3a-dac9682e4eb0)

### Level 3: add to favorite (Mandatory if you are doing this test with SwiftUI, Optional if your are doing this test with UIKit) 
In this level, users will be able to add a car to their favorites list. This choice will be persisted, so it remains even if the user quits and reopens the app. 

a. From the detail screen, the driver can add or remove a car from their favorites. 

![details-favorites-on](https://github.com/drivy/jobs/assets/1333507/db97abd9-deec-4b9d-8d51-2e3c8d275732)
![detail-favorites-off](https://github.com/drivy/jobs/assets/1333507/e133a90d-eb77-4398-a26d-57783d3d6ea0)

b. The driver should be able to see if a car is a favorite from the cars list as well. 

![list-with-favorites](https://github.com/drivy/jobs/assets/1333507/8f449e6e-31c2-4f33-b045-9360cb5e774e)

