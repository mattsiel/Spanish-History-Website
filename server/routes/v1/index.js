const express = require('express');

const router = express.Router();

const personRouteV1 = require('./person');
const familyRouteV1 = require('./family');


router.get('/person', personRouteV1.getPersons);
router.get('/person/:id', personRouteV1.getPersonById);
router.post('/person', personRouteV1.createPerson);
router.put('/person/:id', personRouteV1.updatePerson);
router.delete('/person/:id', personRouteV1.deletePerson);
router.get('/family', familyRouteV1.getFamilys);
router.get('/family/:id', familyRouteV1.getFamilyById);
router.post('/family', familyRouteV1.createFamily);
router.put('/family/:id', familyRouteV1.updateFamily);
router.delete('/family/:id', familyRouteV1.deleteFamily);

module.exports = router;
