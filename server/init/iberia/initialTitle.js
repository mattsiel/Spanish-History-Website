/* eslint-disable linebreak-style */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';

import sequelize from '../../middleware/sequelize.js';
import TitleModel from '../../models/title.model.js';

const Title = TitleModel(sequelize, Sequelize);

import { titleFind } from '../../middleware/findID.js';


const createTitles = async () => {

  // Second Generation Titles
  await Title.bulkCreate([
    {
        title_name: 'Aragon',
        title_rank: 'Crown',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
        title_name: 'Castile',
        title_rank: 'Crown',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
  ])

  // Second Generation Titles
  await Title.bulkCreate([
    {
        title_name: 'Aragon',
        title_rank: 'Kingdom',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
        title_name: 'Castile',
        title_rank: 'Kingdom',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
        title_name: 'Galicia',
        title_rank: 'Kingdom',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
        title_name: 'Majorca',
        title_rank: 'Kingdom',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
        title_name: 'Leon',
        title_rank: 'Kingdom',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
        title_name: 'Navarre',
        title_rank: 'Kingdom',
        title_holders: null,
        title_holder_start: null, 
        title_holder_end: null,
        part_of: null,
        title_info: null,
    },
    {
      title_name: 'Portugal',
      title_rank: 'Kingdom',
      title_holders: null,
      title_holder_start: null, 
      title_holder_end: null,
      part_of: null,
      title_info: null,
    },
    {
      title_name: 'Toledo',
      title_rank: 'Kingdom',
      title_holders: null,
      title_holder_start: null, 
      title_holder_end: null,
      part_of: null,
      title_info: null,
    },
    {
      title_name: 'Valencia',
      title_rank: 'Kingdom',
      title_holders: null,
      title_holder_start: null, 
      title_holder_end: null,
      part_of: null,
      title_info: null,
    },
  ])

  // Third Generation Titles
  await Title.bulkCreate([
  ]);
};

const initTitle = async () => {
  sequelize.sync().then(async () => {
    createTitle();
  });
};

export default initTitle;