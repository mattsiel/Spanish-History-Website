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
  getOwnerships(request, response) {
    pool.query('SELECT * FROM ownership', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  getOwnershipById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM ownership WHERE ownership_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  createOwnership(request, response) {
    const {
        property_id,
        person_id,
        ownership_start,
        ownership_end,
        ownership_source
    } = request.body;

    pool.query(
      'INSERT INTO ownership VALUES ($1, $2, $3, $4, $5)',
      [ property_id,
        person_id,
        ownership_start,
        ownership_end,
        ownership_source],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(201).send(`Ownership added with ID: ${results.insertId}`);
      },
    );
  }

  updateOwnership(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
        property_id,
        person_id,
        ownership_start,
        ownership_end,
        ownership_source
    } = request.body;

    pool.query(
      'UPDATE ownership SET property_id = $2, person_id = $3, ownership_start = $4, ownership_end = $5 ownership_source = $6 WHERE ownership_id = $1',
      [ property_id,
        person_id,
        ownership_start,
        ownership_end,
        ownership_source],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).send(`Ownership modified with ID: ${id}`);
      },
    );
  }

  deleteOwnership(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('DELETE FROM ownership WHERE ownership_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`Ownership deleted with ID: ${id}`);
    });
  }
}

module.exports = personFunctions;
