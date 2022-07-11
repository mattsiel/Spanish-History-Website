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
  getOccupation(request, response) {
    pool.query('SELECT * FROM occupation', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  getOccupationById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM occupation WHERE family_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  createOccupation(request, response) {
    const {
        occupation_type,
        occupation_start,
        occupation_end,
        person_id 
    } = request.body;

    pool.query(
      'INSERT INTO occupation VALUES ($1, $2, $3, $4)',
      [ occupation_type,
        occupation_start,
        occupation_end,
        person_id ],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(201).send(`Occupation added with ID: ${results.insertId}`);
      },
    );
  }

  updateOccupation(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
        occupation_type,
        occupation_start,
        occupation_end,
        person_id
    } = request.body;

    pool.query(
      'UPDATE occupation SET occupation_type = $2, occupation_start = $3, occupation_start = $4, occupation_end = $5 WHERE occupation_id = $1',
      [ occupation_type,
        occupation_start,
        occupation_end,
        person_id ],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).send(`Occupation modified with ID: ${id}`);
      },
    );
  }

  deleteOccupation(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('DELETE FROM occupation WHERE occupation_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`Occupation deleted with ID: ${id}`);
    });
  }
}

module.exports = personFunctions;
