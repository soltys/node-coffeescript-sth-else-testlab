util = require('util')
coffee = "coffee"
coffeeFlags = "-bpc"
cCoffee = (input,output) ->
    return util.format("%s %s %s > %s", coffee ,coffeeFlags , input, output );

reqCoffee = (name)->
    return name + '.coffee.js';

rule '.coffee.js', '.coffee', async:true , ->
    cmd = cCoffee this.source, this.name
    jake.exec cmd, ->
        complete();    

task 'js', [ reqCoffee 'public/js/clientapp' ]

task 'app' ,[ reqCoffee 'app']

task 'routes', [ 
    reqCoffee 'routes/index'
    reqCoffee 'routes/users'
]    

task 'default',['app','routes','js']

