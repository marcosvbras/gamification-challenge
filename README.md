# Dito Gamification

## What is this?

This project was done to complete [Dito](http://dito.com.br/)'s challenge to Full-stack job.

### Challenge Description

Users have scores that are sent daily to be processed in the [Dito](http://dito.com.br/)'s system. All user scores are sent to the system via ``.csv`` files and each file has a lot of lines with user scores.

This challenge is to develop a web application using [Rails](https://rubyonrails.org/). The application must have a **score processing service** and a page to list all score stored in the database.

The **score processing service** must observe a directory and process new scores every time a new ``.csv`` file arrives. Each user score must be persisted in a database and a user cannot have more than 3126 points.

The ``.csv`` must have lines with the following structure:
``2018-05-14; Karla; 123;500;``
... and are, respectively: **score date**, **user name**, **user ID** and **score**.

<p align="center">
  <img src="https://raw.github.com/marcosvbras/gamification-challenge/master/githubimgs/challenge.gif" alt="Custom image"/>
</p>

## Environment

### Application

The web application was written with **Ruby 2.5.1** and **Rails 5.2.0**. It is recommended to install these exactly versions for a correct running.

### Database

The database used was **MySQL 5.7.22**.

<!-- * Configuration

* Database creation

* Database initialization

* How to run the test suite -->
