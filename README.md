# TrackYourReading--Api

The objective of this project was to create a mobile app, which can track any specific things and presented with a list of things to be measured. This is the Back-End part, where I have created API and endpoints. For the Front_End I have used React, with Rdux for state management.

**The Back End API**

The back-end for this project consists of a REST API that manages the tracking database. This database is integrated by the following 3 tables:

1. **User:** For storing username, and encrypted password and password confirmation.

2. **Book:** For storing the name of the Book, its author, genre, and how many pages. The User will create it.

3. **Tracking:** For storing the date and how many pages have been read by a user, on that particular date.

## `Live Demo:`

[Track-Your-Reading--App](https://trackreading.herokuapp.com/).
 
[Back-End--Api](http://serene-inlet-93388.herokuapp.com/).

## Build-With

- Ruby v- '2.7.1'
- Rails v- '6.0.3.4'
- PostgreSQL
- Bcrypt
- Heroku cli
- VScode

## Getting Started

### Prerequisites

To get this project up and running locally, you must already have ruby and necessary gems installed on your computer

**To get this project set up on your local machine, follow these simple steps:**

1. Open Terminal.
2. Navigate to your desired location to download the contents of this repository.
3. Copy and paste the following code into the Terminal: git clone https://github.com/LamiaSristy/TrackYourReading-Api
4. Run ```cd TrackYourReading-Api```.
5. Run ```bundle install``` to get the necesary gems.
6. Run ```rails db:create``` , to create the database.
7. Run ```rails db:migrate```, it will create the tables.
8. Run ```rails db:seed```, To seed some pre-definrd datas in the database.
9. Run ````rails server```, To fire-up the localhost.
10. Check `http://localhost:3000/` to test it with an API client (like Postman).


## Author Details::

👤 **Lamia Sristy**

- Github: [@LamiaSristy](https://github.com/LamiaSristy)
- Linkedin: [@LamiaSristy](https://www.linkedin.com/in/lamia-hemayet-sristy/)
- E-mail: <a href="mailto:lamiasristy@gmail.com?subject=Hello Lamia!">Email</a>  
- Twitter: [@LamiaSristy](https://twitter.com/lsristy1)


## Show your support

Give ⭐ Star me on GitHub — it helps!

## 📝 License

This project is [MIT](lic.url) licensed.  
