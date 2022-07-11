const express = require('express');

const router = express.Router();

const personRouteV2 = require('./person');
const familyRouteV2 = require('./family');


router.get('/person', personRouteV2.getPersons);
router.get('/person/:id', personRouteV2.getPersonById);
router.post('/person', personRouteV2.createPerson);
router.put('/person/:id', personRouteV2.updatePerson);
router.delete('/person/:id', personRouteV2.deletePerson);
router.get('/family', familyRouteV2.getFamilys);
router.get('/family/:id', familyRouteV2.getFamilyById);
router.post('/family', familyRouteV2.createFamily);
router.put('/family/:id', familyRouteV2.updateFamily);
router.delete('/family/:id', familyRouteV2.deleteFamily);

module.exports = router;