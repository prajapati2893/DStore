//custom logic for the service can be written here
const cds = require('@sap/cds')
module.exports = function (){
  this.after ('READ',`Movies`, (res, req)=>{
        console.log(req.req.url)
  })
}