config = require __dirname+'/config.private.js'
express = require 'express'
rest = require 'restler'
router = express.Router()

console.log config

#/* GET home page. */
router.get '/', (req, res) ->
    res.render 'index',  title: 'Soltys app' 

router.get '/api/foo', (req,res)->
    rest.get("https://todoist.com/API/login?email=#{config.email}&password=#{config.pass}")
    .on('complete', (data)->
        res.send(data)
        )

module.exports = router
