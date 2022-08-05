import swaggerJsDoc from 'swagger-jsdoc';

// Endpoints are grouped by tags in Swagger Docs
const tags = [
  {
    name: 'Person',
    description: 'View, Create, Edit, Delete people',
  },
  {
    name: 'Family',
    description: 'View, Create, Edit, Delete people',
  },
  {
    name: 'Dynasty',
    description: 'View, Create, Edit, Delete people',
  },
  {
    name: 'Relationship',
    description: 'View, Create, Edit, Delete people',
  },
  {
    name: 'Parent',
    description: 'View, Create, Edit, Delete people',
  },
  {
    name: 'Occupation',
    description: 'View, create, edit, and delete communities.',
  },
  {
    name: 'Property',
    description: 'Join, leave, view members of communities.',
  },
  {
    name: 'Ownership',
    description: 'View, set, and unset post flags.',
  },
];

const swaggerOptions = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'IBE Swagger Documentation',
      version: process.env.API_VERSION || 'undefined',
      description: `### API Documentation
      \n\n**This API uses JWT tokens for authentication. Steps to auth:**
      \n\n- **Log in**, copy the access token from the response. Click on one of the **lock icons** to the right of some endpoints. Paste the token into the field and click **'Authorize'**. 
      \n\n- Now you will have limited access, as the token will expire. When token expires requests will return a **403: Invalid Token** response. 
      \n\n- When this happens, use the **/token** endpoint. Copy the access token in the response. Paste it into the field in the lock icon and click **'Authorize'**.`,
    },
    tags,
  },
  apis: [
    './*.yaml',
    './**/*.yaml',
  ],
};

const specs = swaggerJsDoc(swaggerOptions);

/*
const uiOptions = {
  customSiteTitle: "IBE Swagger Documentation",
};
*/

export default specs;
