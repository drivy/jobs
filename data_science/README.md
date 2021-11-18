# Getaround EU Data scientist Challenge

Looking for a job? Check out our [open positions](https://www.welcometothejungle.com/en/companies/getaround/jobs).
You can also take a look at our [product blog](https://medium.com/getaround-eu) and [engineering blog](https://getaround.tech/index.html) to learn more about the way we work.

## General Guidelines

- Clone this repo (do **not** fork it)
- Download the datasets using the link sent by your interviewer.
- When you are done with this challenge, create a private repository and submit it to your interviewer who should have provided you with their GitHub username. Let them know by email!

## Challenge specifications

**The goal is to build a proof of concept (POC) for a new ranking algorithm for Getaround's search engine.**

*Usual time to complete this test: 3 - 5 hours*

- Your answers should include working code/notebook and a presentation to showcase your work.
- Your code should be written in Python or R.
- Your code should be reproducible.
   - include the versions of the libraries used 
   - locate the datasets given in the `/data` subdirectory (it won't be committed as it is already added to the .gitignore).
- Keep in mind that we value enhancing business goals with pragmatic and easy-to-maintain code over raw model performance.

### 1 - Exploratory analysis
*We recommend to take 20% of your case-study time on this part*
 - Explain what is the current behaviour of users with the current ranking algorithm.
 - Share what you believe to be the main challenges for this ranking task.
 - Share the business and product insights that you find the most useful to share to non-data colleagues.

### 2 - Create a proof-of-concept ranking model
*We recommend to take 60% of your case-study time on this part*

Create a proof of concept algorithm which :
 - takes as input a request and a list of cars matching the request criteria
 - renders an index to rank this list of cars based on their chances to be booked

You'll need to add to your presentation : 
 - an overview of your model and your approach
 - explain the relevant feature engineering or optimization work you have done
 - describe next steps for further improvements of model performance

### 3 - From POC to production
*We recommend to take 20% of your case-study time on this part*

Describe the next steps needed to bring your POC to a production-ready model and how you will keep it running smoothly.

## Data and context

### How does the search engine works?
 - Users input an address of search and desired dates and time for their trip. 
    - Optionally, users can filter the results on various criteria such as the type of car (city, sedan, commercial vans..), price, options (AC, snow tires..) etc..
 - The search engine renders a list of cars. It follows 2 main steps to do so:
    - Filtering: Generate the list of cars that matches the search request: ie. Cars nearby the address, that are available for the dates of search, and that match the selected filters. This is already done for you and not in the scope of this project.
    - Ranking: Order the list based on a score. Current score is computed with a simple heuristic. This test is focused on this ranking part.

 - Anytime the user changes a parameter, filter or page number, a new request is sent to the search engine and the results refresh.
 - Users can then visit different car listings, select cars and eventually book one of them.

## Available data
*Note 1 : These data are not representative of Getaround's real data*

*Note 2 : More data than needed is given, but is kept if you want to dig on the system's behaviour*

 - **Search Requests**: a search request is a set of parameters and filters values sent to the search engine. These data have been enriched with some user historical data at the time of the request.
 - **Impressions**: list of the 20 first cars rendered by the existing algorithm for each search request, with their relative data (car characteristics, position in the search etc..) and conversion information (visit, selection, booking)

To simplify the scope of this case-study, search requests and impressions are filtered only on the first page that is shown to the user (top 20 cars)

### Search-requests detailed documentation

One row = One request sent to the search engine, with information on search parameters, filters selected and historical user stats.


|field name                     |description                                                                                                                           |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
|SEARCH_REQUEST_ID              |Id of the request sent to the search_engine                                                                                           |
|SEARCH_TIMESTAMP               |Timestamp of the request                                                                                                              |
|SEARCH_START_DATE              |Date of the beginning of the trip                                                                                                     |
|SEARCH_START_TIME              |Time of the beginning of the trip                                                                                                     |
|SEARCH_END_DATE                |Date of the end of the trip                                                                                                           |
|SEARCH_END_TIME                |Time of the end of the trip                                                                                                           |
|SEARCH_DURATION_IN_DAYS        |Duration of the trip in days, as defined to compute the price                                                                         |
|FILTER_SEATS_MIN               |Filter on minimum number of seats in the car                                                                                          |
|FILTER_TRANSMISSION            |Filter on vehicle transmission (ie. automatic or manual transmission)                                                                 |
|FILTER_AGE_MAX                 |Filter on vehicle maximum age                                                                                                         |
|FILTER_CONNECT                 |Filter on connect cars only                                                                                                           |
|FILTER_INSTANT_BOOKABLE        |Filter on instant booking cars only (ie. no need to send a request to the owner before)                                               |
|FILTER_CAR_TYPE_CITY           |Filter on city cars (several car types may be selected at the same time)                                                              |
|FILTER_CAR_TYPE_SEDAN          |Filter on sedan cars (several car types may be selected at the same time)                                                             |
|FILTER_CAR_TYPE_FAMILY         |Filter on family cars (several car types may be selected at the same time)                                                            |
|FILTER_CAR_TYPE_COMMERCIAL_VAN |Filter on commercial vans (several car types may be selected at the same time)                                                        |
|FILTER_PRICE_MAX               |Filter on maximum total price for the trip                                                                                            |
|USER_NB_BOOKINGS               |Historical number of bookings of the user at the time of the search request (NULL when user not logged in)                            |
|USER_AVG_BOOKING_DURATION      |Historical average of trip duration in days of the user at the time of the search request (NULL when user not logged in)              |
|SEARCH_ID                      |Id of the associated search. A search is an abstraction regrouping all search_requests from a unique user for a unique intent to book.|


### Impressions detailed documentation

One row for each car rendered per search request, with car characteristics at the time of the request and car information in the context of the request (distance and trip price).

|field name                     |description                                                                                                                           |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
|SEARCH_REQUEST_ID              |Id of the request sent to the search_engine                                                                                           |                                                                                                 |
|CAR_TYPE                       |Type of car, can be city, family, sedan, commercial van or other.                                                                     |
|CAR_MODEL                      |Car model (ex: Clio, Polo..)                                                                                                          |
|CAR_BRAND                      |Car brand (ex: Renault, Peugeot..)                                                                                                    |
|CAR_VALUATION_TIER             |Tier of the car current valuation, higher = more expensive                                                                            |
|CAR_AGE_TIER                   |Tier of the car age, higher = older                                                                                                   |
|CAR_PRICE_EXTRA_KM             |200km/d are included in the trip price. Any additional kilometer will be paid on top of the trip price at the end of the trip. Price per extra km depends on the car and this information is displayed in car’s listing.|
|CAR_TRANSMISSION               |Transmission of the car, may be automatic or manual                                                                                   |
|CAR_IS_CONNECT                 |Connect cars can be accessed and opened by the driver, through Getaround app, without meeting the owner.                              |
|CAR_INSTANT_BOOKABLE           |Non instant booking cars require the user to send a trip request to the owner, that the owner may or may not accept. Instant bookings cars do not require the user to send a request before booking them.|
|CAR_OWNER_PRR                  |Owner’s positive response rate at the time of the search request. Non instant booking owners receive trip requests that they may or may not accept. Instant bookings do not require the owner to accept the trip and account for accepted requests. NULL for owners with less than 4 trip requests|
|CAR_SEATS_COUNT                |Number of seats in the car                                                                                                            |
|CAR_ENERGY                     |Type of energy / gas used for the car.                                                                                                |
|CAR_DOORS_COUNT                |Number of doors in the car                                                                                                            |
|CAR_DISTANCE_TO_SEARCH_ADDRESS |Distance in kilometers between the search address and the car listing address                                                         |
|CAR_SEARCH_PRICE               |Price of the trip for this car and these search parameters                                                                            |
|CAR_POSITION_IN_SEARCH         |Position of the car in the page with the current ranking with heuristics. First position = 0  - Note that this column is only known after the ranking algorithm|
|VISITED                        |1 = user visited the car listing following this search request - Note that this column is only known a posteriori                     |
|SELECTED                       |1 = user selected the car following this search request - Note that this column is only known a posteriori                            |
|BOOKED                         |1 = user booked the car following this search request - Note that this column is only known a posteriori                              |
