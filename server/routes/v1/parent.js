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
  getParents(request, response) {
    pool.query('SELECT * FROM parent', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  getParentById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM parent WHERE parent_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  createParent(request, response) {
    const {
        person_id,
        parent_person_id,
        parent_type
    } = request.body;

    pool.query(
      'INSERT INTO parent VALUES ($1, $2, $3, $4)',
      [ person_id,
        parent_person_id,
        parent_type],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(201).send(`Parent added with ID: ${results.insertId}`);
      },
    );
  }

  updateParent(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
        person_id,
        parent_person_id,
        parent_type
    } = request.body;

    pool.query(
      'UPDATE parent SET person_id = $2, parent_person_id = $3, parent_type = $4, WHERE parent_id = $1',
      [ person_id,
        parent_person_id,
        parent_type],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).send(`Parent modified with ID: ${id}`);
      },
    );
  }

  deleteParent(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('DELETE FROM parent WHERE parent_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`Parent deleted with ID: ${id}`);
    });
  }
}

module.exports = personFunctions;
