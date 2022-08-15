/* eslint-disable linebreak-style */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';

import sequelize from '../../middleware/sequelize.js';
import PersonModel from '../../models/person.model.js';

const Person = PersonModel(sequelize, Sequelize);

import { dynastyFind , familyFind } from '../../middleware/findID.js';


const createPerson = async () => {

  // First Generation Houses 
  await Person.bulkCreate([
    {
        name_first : req.body.name_first,
        name_by : req.body.name_by,
        name_middle : req.body.name_middle,
        name_maiden : req.body.name_maiden,
        name_last : req.body.name_last,
        gender : req.body.gender,
        date_birth : req.body.date_birth,
        date_death : req.body.date_death,
        place_birth : req.body.place_birth,
        place_death : req.body.place_death,
        cause_death : req.body.cause_death,
        family_id : req.body.family_id,
        person_source : req.body.person_source, 
        dynasty_id : req.body.dynasty_id,
    },
    {
      person_name : 'Ivrea',
      dynasty_id : await dynastyFind('Anscarid'),
      person_head : null,
      person_creator_id : null,
      person_start : '0878-01-01',
      cadet_of : null,
    },
  ])

  // Second Generation Houses
  await Person.bulkCreate([
    {
      person_name : 'Cerdanya',
      dynasty_id : await dynastyFind('Bellonid'),
      person_head : null,
      person_creator_id : null,
      person_start : '0878-01-01',
      cadet_of : await personFind('Barcelona'),
    },
    {
      person_name : 'Urgell',
      dynasty_id : await dynastyFind('Bellonid'),
      person_head : null,
      person_creator_id : null,
      person_start : '0974-01-01',
      cadet_of : await personFind('Barcelona'),
    },
  ])

  // Third Generation Houses
  await Person.bulkCreate([
    {
      person_name : 'Forcalquier',
      dynasty_id : await dynastyFind('Bellonid'),
      person_head : null,
      person_creator_id : null,
      person_start : '1094-01-01',
      cadet_of : await personFind('Urgell'),
    },
  ]);
};

const initPerson = async () => {
  sequelize.sync().then(async () => {
    createPerson();
  });
};

export default initPerson;
