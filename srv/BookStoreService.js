//custom logic for the service can be written here
const cds = require('@sap/cds')
module.exports = function(){
  this.on (`resetRating`, `Books`,(req) =>{
    let id = req.params[0].ID
    console.log(id);
  })
}