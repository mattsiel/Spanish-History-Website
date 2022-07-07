/* eslint-disable linebreak-style */
/* eslint-disable no-unused-vars */
/* eslint-disable camelcase */
/* eslint-disable class-methods-use-this */
/* eslint-disable linebreak-style */
require('dotenv').config();

const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
});

class personFunctions {
  getFamily(request, response) {
    pool.query('SELECT * FROM public.person', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  getFamilyById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  createUser(request, response) {
    const {
      name_first, name_by, name_middle, name_maiden, name_last,
      gender, date_birth, date_death,
      place_birth, place_death, cause_death,
      family_id, person_source, dynasty_id,
    } = request.body;

    pool.query(
      'INSERT INTO users VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12 ,$13, $14)',
      [name_first, name_by, name_middle, name_maiden, name_last,
        gender, date_birth, date_death,
        place_birth, place_death, cause_death,
        family_id, person_source, dynasty_id],

      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(201).send(`User added with ID: ${results.insertId}`);
      },
    );
  }

  updateUser(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
      name_first, name_by, name_middle, name_maiden, name_last,
      gender, date_birth, date_death,
      place_birth, place_death, cause_death,
      family_id, person_source, dynasty_id,
    } = request.body;

    pool.query(
      'UPDATE users SET name = $1, email = $2 WHERE id = $3',
      [name_first, name_by, name_middle, name_maiden, name_last,
        gender, date_birth, date_death,
        place_birth, place_death, cause_death,
        family_id, person_source, dynasty_id],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).send(`User modified with ID: ${id}`);
      },
    );
  }

  deleteUser(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`User deleted with ID: ${id}`);
    });
  }
}

module.exports = personFunctions;
