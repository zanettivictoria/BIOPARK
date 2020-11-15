# BIOPARK

## REQUISITOS DO PROJETO

`node -v 8.8.1` - Site para Download: https://nodejs.org/en/blog/release/v8.8.1/

`npm -v 5.4.2` -  https://www.npmjs.com/package/npm/v/5.4.2       

`mySQL workbench`- https://www.mysql.com/products/workbench/


## INSTALAÇÃO PARA USAR O PROJETO

### Commands

`npm install` -- instala todos os pacotes necessários para rodar a aplicação.

`nodemoon index.js` -- Comando para executar o código.

### Alterações necessárias para instalação e teste: 

**No arquivo:**  *#\node_modules\knex\lib\dialects\mysql\schema\columncompiler.js*

Alterar a linha 7 para:

`const commentEscapeRegex = /(?:<(tag)>)((?:.(?!<\/\1>))+.)(?:<\/\1>)/g // /(?<!\\)'/g;`


**ATENÇÃO:** No payload de configuração do banco, coloque seu **usuário** e **senha** do banco. A partir da linha 9 do arquivo principal `index.js`, aonde tem:
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

----
### Criação do banco de dados

Basta rodar no MySQL o script .sql que possui o nome "CreateDB.sql" que está no diretório principal do projeto.


----

## EXECUÇÃO DA API

Para executar o código é necessário que você já tenha feito todas as alterações citadas acima (não esqueça da mudança no arquivo *columncompiler.js*) e que você execute no terminal da sua IDE ou no prompt de comando (dentro do diretório que possui o arquivo *index.js*) o comando **`nodemoon index.js`**.


----
## DESCRIÇÃO E TESTE


### Endpoints, parametros e exemplo de payload

| Método | Descrição                                             | Endpoint                  | 
|--------|-------------------------------------------------------|---------------------------|
| **GET**    | Visualizar todos os agendamentos cadastrados no banco | /agendamentos             |         
| **GET**    | Visualizar todos os agendamentos cadastrados no banco | /visualizar/agendamento   |         
| **GET**    | Visualizar um agendamento específico                  | /agendamento/id           |         
| **POST**   | Criar um novo agendamento                             | /criar/agendamento        |         
| **PUT**    | Atualizar um agendamento existente                    | /atualizar/agendamento/id |         
| **DELETE** | Deletar um agendamento                                | /deletar/agendamento/id   |         


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

**Exemplo de payload para PUT (Atualizar agendamento)**
~~~json
  {
    "ComunicationType": "whatsapp",
    "Contact": "48977777777",
    "MessageToSend": "Aqui é a da BIOPARK você passou para a proxima etapa!"
}
~~~
Apenas um exemplo, é necessário enviar apenas o campo que se deseja atualizar.

Para deletar, basta passar o ID do agendamento a ser deletado, assim como para atualizar basta passar o id do cadastro a ser atualizado e o conter no body os dados que se deseja atualizar.

  ### Variáveis do banco de dados:

  * **NameToSend** - Destinatário;
  * **ComunicationType** - Tipo de comunicação (whastapp, email...);
  * **Contact** - Contato da pessoa (número de telefone, email);
  * **DateToSend** - Data para envio;
  * **MessageSentStatus** - Status de envio (false = não foi enviada / true = foi enviada);
  * **MessageToSend** - Mensagem a ser enviada.


