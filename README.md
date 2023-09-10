# Movieplex Website Installation Guide

This guide will help you set up and run the Movieplex website on your local development environment. Please follow these steps carefully.

## Prerequisites

- **Operating System**: A 64-bit Windows operating system is ideal for running this database management system. It may also work on MacOS or Linux, but it's not guaranteed to be an exact match.

- **Software**: You will need WampServer (64-bit) and phpMyAdmin to host and manage the application's database.

## Installation Steps

1. **Download the Project Files**:
   - Clone or download the Movieplex project files from the repository.

2. **Move Files to WampServer Directory**:
   - Locate the `www` folder in your WampServer installation directory. By default, it's in the `wamp64` folder located in the `C` drive.
   - Place all the Movieplex project files into the `www` folder.

3. **Start WampServer**:
   - Launch WampServer from your Start menu.
   - Make sure all the WampServer services are running. You should see a green WampServer icon in your system tray.

4. **Import the Database**:
   - Access phpMyAdmin by opening your web browser and navigating to `http://localhost/phpmyadmin`.
   - Log in if required.
   - Create a new database named `movie`.
   - Import the provided SQL file into the `movie` database. This file contains the necessary data for the website.

5. **Configure `config.php`**:
   - Open the `config.php` file located in the project directory.
   - Ensure that the configuration settings for the database connection match your host, username, and password.

6. **Access the Website**:
   - Open your web browser and enter `http://localhost/movieplex` in the address bar.
   - If the database connection was successful, you should see the Movieplex homepage.
   - Explore the website to view movie information, theater details, and ticket availability, all of which are sourced from the movie database.

Congratulations! You have successfully installed and set up the Movieplex website on your local environment.
