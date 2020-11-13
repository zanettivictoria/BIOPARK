# BIOPARK

## INSTALAÇÃO PARA USAR O PROJETO

### Commands

`npm install` -- instala todos os pacotes necessários para rodar a aplicação.

### Alterações: 

No arquivo  *#\node_modules\knex\lib\dialects\mysql\schema\columncompiler.js*

Alterar a linha 7 para:

`const commentEscapeRegex = /(?:<(tag)>)((?:.(?!<\/\1>))+.)(?:<\/\1>)/g // /(?<!\\)'/g;`


### Criação do banco de dados

Basta rodar o script .sql que possui o nome "CreateDB.sql" no MySQL.

**ATENÇÃO:** No payload de configuração do banco, coloque seu usuário e senha. Aonde tem:
~~~javascript
var knex = require('knex')({
    client: 'mysql',
    connection: {
      host : '127.0.0.1',
      user : 'root',
      password : 'password',
      database : 'biopark'
    }
  });
  ~~~

  ### Variáveis do banco de dados:

  **NameToSend** - Destinatário;

  **ComunicationType** - Tipo de comunicação (whastapp, email...);

  **Contact** - Contato da pessoa (número de telefone, email);

  **DateToSend** - Data para envio;

  **MessageSentStatus** - Status de envio (false = não foi enviada / true = foi enviada);

  **MessageToSend** - Mensagem a ser enviada.


  ### Endpoints, parametros e exemplo de payload


| metodo | descrição                                             | endpoint                  | 
|--------|-------------------------------------------------------|---------------------------|
| GET    | Visualizar todos os agendamentos cadastrados no banco | /agendamentos             |         
| GET    | Visualizar todos os agendamentos cadastrados no banco | /visualizar/agendamento   |         
| GET    | Visualizar um agendamento específico                  | /agendamento/id           |         
| POST   | Criar um novo agendamento                             | /criar/agendamento        |         
| PUT    | Atualizar um agendamento existente                    | /atualizar/agendamento/id |         
| DELETE | Deletar um agendamento                                | /deletar/agendamento/id   |         


**Payload para POST:**
~~~json
  {
    "NameToSend": "Wagner",
    "ComunicationType": "email",
    "Contact": "wagner.email@myEmail.com",
    "DateToSend": "2020-12-31",
    "MessageSentStatus": 0,
    "MessageToSend": "Aqui é a da BIOPARK temos um agendamento!"
}
~~~

**Payload para PUT (Atualizar agendamento)**
~~~json
  {
    "ComunicationType": "whatsapp",
    "Contact": "48977777777",
    "MessageToSend": "Aqui é a da BIOPARK você passou para a proxima etapa!"
}
~~~