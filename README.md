# Book Appointment to try car (back end)

## The table of contents

- About
- Live-demo
- Application pictures
- Features
- How to use the application
- Getting started (Development)
- Launch the application
- Test the application
- Author
- Show your support
- Acknowledgments
- Issues
- 📝 License

## About

In this application, I make a website to book appointments to try cars. The user can choose from a list of cars and fix a date and a city where to  try the car. If the user has the admin privelege he can also create, edit, and delete a car. The user logs in and signs up to the application using Jjson Web Token.

To build this application we used:


- Ruby on Rails;
- Active Storage;
- Cloudinary
- Postgresql database;
- Json Web Token (jwt);
- (bcrypt) to crypt password;
- Rspec to test the project;
- Linters ( Rubocop )

## Live-Demo
[the link for the API](https://youcef-cars-book-appointment.herokuapp.com)
[The live demo link of front end](https://youcef-react-book-appointment-car.netlify.app/)

## Features

- Log in, log out and sign up
- Show the list of cars;
- Show the list of the appointments of the user;
- Create a new car;
- Edit an existing car;
- Delete an existing car.

## How to use the application

In this Application, on the home page, the user gets the informations about the COVID-19 statistics (cases, deaths, and recoveries). The user can use the filter form to change the results to be shown. If the user wants to get more details about a specific country, he can click on the name of that country in order to access a page of details. There he finds the information about the country:
- the capital of the country;
- the population in the country;
- the number of confirmed cases;
- the number of deaths due to COVID-19;
- the number of recoveries from COVID-19;
- the increase in the number of cases in the last 30 days;
- the increase in the number of deaths in the last 30 days.

## Getting started (Development)

To get a local copy of the repository please run the following commands on your terminal:

```
$ git clone git@github.com:ABDELLANI-Youcef/rails_cars_books_appointment.git
$ cd rails_cars_books_appointment
$ git checkout development
$ git branch feature-branch
$ git checkout feature-branch

```

## Launch the application

After making the local copy of the repository:
- get inside the repository folder;
- setup the gems of the project: in the terminal run: ```bundle install```
- enter the command: ```rails server``` to start the server in localhost.
- then you get the application in the localhost in your web browser.

## Test the application

After making the local copy of the repository:
- get inside the repository folder;
- setup the dependencies of the project: in the terminal run: ```bundle install```
- enter the command: ```bundle exec rspec``` to test the application.
- then you get the application tested.

In this application I test the components using the snapshots and I test the logical functions using jest.

## Author

**Youcef Abdellani**

- Github: [@ABDELLANI-Youcef](https://github.com/ABDELLANI-Youcef)
- LinkedIn:[LinkedIn](linkedin.com/in/youcef-abdellani)
- Twitter:[@YoucefAbdellani](https://twitter.com/YoucefAbdellani)

## 🤝 Contributing

Contributions, issues ,and feature requests are welcome!

## Show your support

Give an ⭐️ if you like this project!

## Acknowledgments

- Hat tip to [stackoverflow](https://stackoverflow.com) community.
- Hat tip to [Microverse](https://www.microverse.org/) TSE for Code Review
- Hat tip to [Murat Korkmaz](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)
- Hat tip to [Heroku](https://www.heroku.com/)
- Hat tip to anyone whose code was used

## Issues
If you would like to report an issue [the link](https://github.com/ABDELLANI-Youcef/rails_cars_books_appointment/issues)

## 📝 License

All source code is available jointly under the MIT License.
See [MIT licence](./LICENSE.md) for details.