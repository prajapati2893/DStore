//custom logic for the service can be written here
const cds = require('@sap/cds')
module.exports = function(){
  this.on (`resetRating`, `Books`,async(req) =>{
    let id = req.params[0].ID
    await UPDATE `msg_dstore_books_Books` .set `rating = 0` .where `ID=${id}`
    console.log(`Reset rating for book id : ${id}`);
  })

  this.before(`CREATE`,`Books`,req=>{
    if(!req.data.description){
      req.data.description = "This is a default description"
    }
  })
}