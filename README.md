# Gamification Challenge

## What is this?

This project was done to complete [Dito](http://dito.com.br/)'s challenge to Full-Stack Developer job.

### Challenge Description

Users have scores that are sent daily to be processed in the [Dito](http://dito.com.br/)'s system. All user scores are sent to the system via ``.csv`` files and each file has a lot of lines with user scores.

This challenge is to develop a web application using [Rails](https://rubyonrails.org/). The application must have a **score processing service** and a page to list all scores stored in the database.

The **score processing service** must **watch a directory** and process new scores every time a new ``.csv`` file arrives in this directory. Each user score must be persisted in a database and a user cannot have more than 3126 points.

The ``.csv`` file must have lines with the following structure:
``2018-05-14; Karla; 123;500;``. They are respectively: **date**, **username**, **uid** and **points** table columns.

<p align="center">
  <img src="https://raw.github.com/marcosvbras/gamification-challenge/master/githubimgs/challenge.gif" alt="Custom image"/>
</p>

## Environment

### Application

The web application was written with **Ruby 2.5.1** and **Rails 5.2.0**. It is recommended to install these exactly versions for a correct running.

### Database

The database used was **MySQL 5.7.22**.

### Ruby dependencies

All dependencies are in ``Gemfile``, but I need to highlight a special Gem called [Filewatcher](https://github.com/thomasfl/filewatcher). It was totally necessary to make it all work.

## :running: How to run

1.  Set your MySQL's **user** and **password** in ``config/database.yml`` file.
2.  On project root directory, run ``rake db:create``, ``rake db:migrate`` and ``rake db:seed`` to create the database and populate it.
3.  On project root directory, run ``bundle install`` to install all ruby dependencies.
4. Open the MySQL command line and set the following settings:
```bash
mysql> set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
mysql> set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
```
5.  On project root directory, run ``rails server`` to start Puma server and that's it!

## How it works

You must visit ``localhost:3000/scores`` to see the ranking page. It groups all scores by user and it is ordered to show who are the Big Players of the system.
<p align="center">
  <img src="https://raw.github.com/marcosvbras/gamification-challenge/master/githubimgs/index.png" alt="Custom image"/>
</p>

To see some magic here, everything you need to do is put some file from ``example_files/`` directory inside ``csv/`` or create your own ``.csv`` file with the same structure of them. The system will know that there is a new score file and will process all new data. After that, you can reload the page and see new scores.

<p align="center">
  <img src="https://raw.github.com/marcosvbras/gamification-challenge/master/githubimgs/index2.png" alt="Custom image"/>
</p>

If you click on some "Ver Mais" link, you will see all scores from a specific user.

<p align="center">
  <img src="https://raw.github.com/marcosvbras/gamification-challenge/master/githubimgs/index3.png" alt="Custom image"/>
</p>

If you want to add other directories to be watched, you can just update the ``config.csv_directories`` variable in ``config/environments.development.rb``:

```ruby
# Directories to be watched for Filewatcher
config.csv_directories = ['csv/*.csv', '/home/marcosvbras/test/*.csv']
```

Now, the ``/home/marcosvbras/test/*.csv`` directory is also being watched, and you can put some ``.csv`` files to be processed.

## Final Considerations

This challenge was **LEGEN**...

<p align="center">
  <img src="https://raw.github.com/marcosvbras/gamification-challenge/master/githubimgs/wfi.gif" alt="Custom image"/>
</p>

...**DARY**!

It's awesome to build things with Rails, everything is so intuitive and simple. With only few minutes you can have something running and the framework gives a lot of tips for you. The difficulty here was not being able to stop looking for ways to improve a small project like that and to create the best ``README.md`` of the Dito's recruitment process.
