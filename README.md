# Judging Panel System

This project is a web application for managing and scoring inter-house activities in a school setting.

## Prerequisites

- Node.js (v14 or later)
- MySQL (v8 or later)

## Setup

### Database Setup

1. Install MySQL if you haven't already.
2. Log in to MySQL as root:
   ```
   mysql -u root -p
   ```
3. Create a new database:
   ```sql
   CREATE DATABASE judging_panel_db;
   ```
4. Use the new database:
   ```sql
   USE judging_panel_db;
   ```
5. Run the SQL script in `database/setup.sql` to create tables and insert initial data.

### Backend Setup

1. Navigate to the `backend` directory:
   ```
   cd backend
   ```
2. Install dependencies:
   ```
   npm install
   ```
3. Create a `.env` file in the `backend` directory with the following content:

   ```
   DB_HOST=localhost
   DB_USER=your_mysql_username
   DB_PASS=your_mysql_password
   DB_NAME=judging_panel_db
   JWT_SECRET=your_jwt_secret
   ```

   Replace the placeholders with your actual MySQL credentials and choose a secure JWT secret.

4. Start the backend server:
   ```
   npm start
   ```

### Frontend Setup

1. Navigate to the `frontend` directory:
   ```
   cd frontend
   ```
2. Install dependencies:
   ```
   npm install
   ```
3. Start the frontend development server:
   ```
   npm start
   ```

## Usage

After starting both the backend and frontend servers, open a web browser and navigate to `http://localhost:3000` to use the application.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
