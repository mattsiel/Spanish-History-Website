/* eslint-disable linebreak-style */
/* eslint-disable no-unused-vars */
/* eslint-disable camelcase */
/* eslint-disable class-methods-use-this */
/* eslint-disable linebreak-style */
const Person = require('../models/Person.model.js')s;

require('dotenv').config();

const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
});

class DynastyFunctions {
  getDynastys(request, response) {
    pool.query('SELECT * FROM dynasty', (error, results) => {
      if (error) {
        throw response.status(400).send('Could not find dynasties');
      }
      response.status(200).json(results.rows);
    });
  }

  getDynastyById(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('SELECT * FROM dynasty WHERE dynasty_id = $1', [id], (error, results) => {
      if (error) {
        throw response.status(400).send('Could not find dynasties');
      }
      response.status(200).json(results.rows);
    });
  }

  createDynasty(request, response) {
    const {
      dynasty_name,
      dynasty_head,
      dynasty_creator_id,
      dynasty_start,
    } = request.body;

    /*
    Dynasty.create({
      dynasty_name : request.body.dynasty_name,
      dynasty_head : request.body.dynasty_head,
      dynasty_creator_id : request.body.creator_id,
      dynasty_start : request.body.dynasty_start, 
    }).then((note) => {
      res.status(200).json(note);
    });
    */
    if (!/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(request.body)) {
      // throw response.status(401).send('Special characters detected in fields');
    }

    pool.query(
      'INSERT INTO dynasty(dynasty_name, dynasty_head, dynasty_creator_id, dynasty_start) VALUES ($1, $2, $3, $4)',
      [dynasty_name,
        dynasty_head,
        dynasty_creator_id,
        dynasty_start],
      (error, results) => {
        response.status(201).send(`Dynasty added with name: ${request.body.dynasty_name}`);
        if (error) {
          // throw response.status(404).send('Could not find dynasties');
        }
      },
    );
  }

  updateDynasty(request, response) {
    const id = parseInt(request.params.id, 10);
    const {
      dynasty_name,
      dynasty_head,
      dynasty_creator_id,
      dynasty_start,
    } = request.body;

    if (!/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(request.body)) {
      return response.status(401).send('Special characters detected in fields');
    }
    pool.query(
      'UPDATE dynasty SET dynasty_name = $2, dynasty_head = $3, dynasty_creator_id = $4, dynasty_start = $5 WHERE dynasty_id = $1',
      [dynasty_name,
        dynasty_head,
        dynasty_creator_id,
        dynasty_start],
      (error, results) => {
        if (error) {
          throw response.status(404).send('Could not find dynasties');
        }
        response.status(200).send(`Dynasty modified with ID: ${id}`);
      },
    );
  }

  deleteDynasty(request, response) {
    const id = parseInt(request.params.id, 10);

    pool.query('DELETE FROM dynasty WHERE dynasty_id = $1', [id], (error, results) => {
      if (error) {
        throw response.status(400).send('Could not find dynasties');
      }
      response.status(200).send(`Dynasty deleted with ID: ${id}`);
    });
  }
}

module.exports = new DynastyFunctions();
