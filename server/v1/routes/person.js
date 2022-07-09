/* eslint-disable linebreak-style */
/* eslint-disable no-unused-vars */
/* eslint-disable new-cap */
/* eslint-disable camelcase */
/* eslint-disable linebreak-style */
/* eslint-disable class-methods-use-this */
const { send } = require('process');

require('dotenv').config();

const { Pool } = require('pg');

const pool = new Pool({
  user:process.env.PGUSER,
  host:process.env.PGHOST,
  database:process.env.PGDATABASE,
  password:process.env.PGPASSWORD,
  port:4000,
});

class personFunctions {
  getPersons(request, response) {
    pool.query('SELECT * FROM person', (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  getPersonById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM person WHERE person_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }

  createPerson(request, response) {
    const { name_first, gender } = request.body;

    pool.query(
      'INSERT INTO person(name_first, gender) VALUES ($1, $2)',
      [name_first, gender],

      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(201).send(`User added with ID: ${results.insertId}`);
      },
    );
  }

  // updates a person
  updatePerson(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
      name_first, name_by, name_middle, name_maiden, name_last,
      gender, date_birth, date_death,
      place_birth, place_death, cause_death,
      family_id, person_source, dynasty_id,
    } = request.body;

    pool.query(
      'UPDATE person SET name = $1, email = $2 WHERE id = $3',
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

  deletePerson(request, response) {
    const id = parseInt(request.params.id);

    pool.query('DELETE FROM person WHERE person_id = $1', [id], (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`User deleted with ID: ${id}`);
    });
  }
}

module.exports = new personFunctions();
