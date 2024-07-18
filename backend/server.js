const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

app.get('/api/activities', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM Activities');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/criteria/:activityId', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM Criteria WHERE activity_id = ?', [req.params.activityId]);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/scores', async (req, res) => {
  const { activityId, scores } = req.body;
  const connection = await pool.getConnection();
  
  try {
    await connection.beginTransaction();
    
    for (const [criterionId, score] of Object.entries(scores)) {
      await connection.query(
        'INSERT INTO Scores (activity_id, house_id, judge_id, criteria_id, score) VALUES (?, ?, ?, ?, ?)',
        [activityId, 1, 1, criterionId, score] // Assuming house_id and judge_id are 1 for simplicity
      );
    }
    
    await connection.commit();
    res.json({ message: 'Scores submitted successfully' });
  } catch (error) {
    await connection.rollback();
    res.status(500).json({ error: error.message });
  } finally {
    connection.release();
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));