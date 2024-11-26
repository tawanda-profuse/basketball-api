# Basketball API

Basketball API is an application that simulates player data using different API endpoints.

## Backend

- The application implements a normalized PostgreSQL database to store the data used throughout the application. The API endpoints are implemented using Python and Django models.

- The index.js file located in the `backend/loading_scripts` folder is a process that loads the JSON datasets into the PostgreSQL database. This process can run repeatedly without duplicating or obscuring references in the database.

- The state of the database can be exported using `pg_dump -U database-user-name database > dbexport.pgsql`.

- The skeleton of an API View `PlayerSummary` can be found in `backend/app/views/players.py`. This API to returns a player summary. Some additional modules/libraries are used in order to do this and they are recorded in the `backend/requirements.txt` file. Viewing the **/player-summary-api** endpoint from the frontend allows you to see the output of your API, given the playerID parameter provided in the user input.

## Frontend

- The `player-summary` component, which is viewable at **/player-summary** from the client, makes a call to an API endpoint at `/api/v1/playerSummary/{playerID}` that returns player summary data. One component of the player summary data are the player's shots in each game, note that:

   - The shot's x and y coordinates are provided and are measured in feet
   - The location of each shot is relative to the center of the basket, per [`court_diagram.jpg`](/court_diagram.jpg) in this repository

- Within the `player-summary` component found in `frontend/src/app/player-summary/`, the user interface describes the player summary data returned from the API.

## Application Setup

In order to connect the backend and frontend, the following steps must be followed from top to bottom sequentially to ensure a successful set up of the app. The app is run on an Angular frontend, Django backend, and a PostgreSQL database.

### Setting up the Database

1. Download and install PostgreSQL from https://www.postgresql.org/download/
2. Ensure PostgreSQL is running, and in a terminal run:

```SQL
createuser user_name --createdb;
createdb db_name;
```

3. Connect to the database to grant permissions: `psql db_name`

```SQL
create schema my_schema;
alter user user_name with password 'your_password';
grant all on schema my_schema to user_name;
```

## Backend

### 1. Install pyenv and virtualenv

Read about pyenv [here](https://github.com/pyenv/pyenv) as well as info on how to install it. You may also need to install virtualenv in order to complete step 2.

### 2. Installing Prerequisites
The steps below attempt to install Python version 3.10.1 within your pyenv environment. If you computer is unable to install this particular version, you can feel free to use a version that works for you, but note that you may also be required to update existing parts of the codebase to make it compatible with your installed version.

```
cd root/of/project
pyenv install 3.10.1
pyenv virtualenv 3.10.1 okc
pyenv local okc
eval "$(pyenv init -)" (may or may not be necessary)
pip install -r backend/requirements.txt
```

### 3. Starting the Backend

Start the backend by running the following commands

```
cd /path/to/project/backend
python manage.py runserver
```

The backend should run on http://localhost:8000/.


## Frontend

### 1. Installing Prerequisites
Install Node.js, then run the following commands

```
cd /path/to/project/frontend
# Install Angular-Cli
npm install -g @angular/cli@12.1.0 typescript@4.6.4 --force
# Install dependencies
npm install --force
```

### 2. Starting the Frontend
Start the frontend by running the following commands

```
cd /path/to/project/frontend
npm start
```

The frontend should run on http://localhost:4200/. Visit this address to see the app in your browser. A client has been deployed at this url [https://basketball-api-ui.vercel.app/](https://basketball-api-ui.vercel.app/) and the backend has been deployed at this url [https://basketball-api-ochre.vercel.app/api/v1](https://basketball-api-ochre.vercel.app/api/v1).