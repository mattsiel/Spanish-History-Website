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
  getFamilys(request, response) {
    pool.query('SELECT * FROM family', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  getFamilyById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM family WHERE family_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  createFamily(request, response) {
    const {
      family_id,
      family_name,
      dynasty_id,
      family_head,
      family_creator_id,
    } = request.body;

    pool.query(
      'INSERT INTO family VALUES ($1, $2, $3, $4)',
      [family_name, dynasty_id, family_head, family_creator_id],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(201).send(`Family added with ID: ${results.insertId}`);
      },
    );
  }

  updateFamily(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
      family_name,
      dynasty_id,
      family_head,
      family_creator_id,
    } = request.body;

    pool.query(
      'UPDATE family SET family_name = $2, dynasty_id = $3, family_head = $4, family_creator_id = $5 WHERE family_id = $1',
      [ family_name,
        dynasty_id,
        family_head,
        family_creator_id],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).send(`Family modified with ID: ${id}`);
      },
    );
  }

  deleteFamily(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('DELETE FROM family WHERE family_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`Family deleted with ID: ${id}`);
    });
  }
}

module.exports = personFunctions;
