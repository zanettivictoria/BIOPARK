# BIOPARK

## INSTALAÇÃO PARA USAR O PROJETO

### Commands

`npm install` -- instala todos os pacotes necessários para rodar a aplicação.

### Alterações: 

No arquivo  *#\node_modules\knex\lib\dialects\mysql\schema\columncompiler.js*

Alterar a linha 7 para:
`const commentEscapeRegex = /(?:<(tag)>)((?:.(?!<\/\1>))+.)(?:<\/\1>)/g // /(?<!\\)'/g;`

No payload de configuração do banco, coloque seu usuário e senha.