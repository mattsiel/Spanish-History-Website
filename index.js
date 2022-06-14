const { Pool, Client } = require('pg')
const connectionString = 'postgres://postgres:postgrespw@localhost:49157'
const makeTable = 'CREATE TABLE "public.person" ("name_first" varchar NOT NULL, "name_last" varchar NOT NULL)'

const insertQuery = {
    text: 'INSERT INTO "public.person" VALUES($1, $2)',
    values: ['brianc', 'brian.m.carlson@gmail.com'],
}

const select = 'SELECT * FROM "public.person"';

const pool = new Pool({
  connectionString,
})


pool.query(select, (err, res) => {
    console.log(err, res)
    pool.end()
})
  
