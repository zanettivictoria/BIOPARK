const restify = require('restify');
const errs = require('restify-errors');

const server = restify.createServer({
  name: 'myapp',
  version: '1.0.0'
});

var knex = require('knex')({
    client: 'mysql',
    connection: {
      host : '127.0.0.1',
      user : 'root',
      password : 'password',
      database : 'biopark'
    }
  });

server.use(restify.plugins.acceptParser(server.acceptable));
server.use(restify.plugins.queryParser());
server.use(restify.plugins.bodyParser());



server.listen(3000, function () {
  console.log('%s listening at %s', server.name, server.url);
});

server.get('/agendamento/total',  (req, res, next) =>  {
    knex('cadastro').then((dados) => {
        res.send(dados);
    }, next)

  });

server.post('/agendamento', (req, res, next) => {
    knex('cadastro')
        .insert(req.body)
        .then((dados) => {
            res.send(dados);
        }, next)
});

server.get('/agendamento/:id',  (req, res, next) =>  {
    const { id } = req.params;
    knex('cadastro')
        .where('id_age', id)
        .first() //primeiro
        .then((dados) => {
            if(!dados) return res.send(new errs.BadRequestError('nada foi encontrado'))
            
            res.send(dados);
    }, next)

  });

  server.put('/update/agendamento/:id',  (req, res, next) =>  {
    const { id } = req.params;
    knex('cadastro')
        .where('id_age', id)
        .update(req.body) 
        .then((dados) => {
            if(!dados) return res.send(new errs.BadRequestError('nada foi encontrado'))
            
            res.send('Dados atualizados');
    }, next)

  });

  server.put('/delete/agendamento/:id',  (req, res, next) =>  {
    const { id } = req.params;
    knex('cadastro')
        .where('id_age', id)
        .delete() 
        .then((dados) => {
            if(!dados) return res.send(new errs.BadRequestError('nada foi encontrado'))
            
            res.send('Dados excluídos');
    }, next)

  });


  
