# language: pt

Funcionalidade: API de Bancos disponíveis com indicação de estado de atuação e taxa de juros.

Cenario: Autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requisição GET com a url {{dev}}/auth
Entao devo obter um retorno com o token válido

------------

Cenario: Pesquisa por todos os bancos disponíveis utilizando autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requisição GET com a url {{dev}}/bank
Entao devo obter um retorno com <id>, <banco>, <estadoAtuacao> e <juros>

Exemplo:
| id | banco                   | estadoAtuacao | juros |
| 1  | Banco do Brasil         | SC            | 11,25 |
| 2  | Caixa Econômica Federal | SP            | 10,75 |
| 3  | Banco Santander         | PR            | 13,00 |
| 4  | Banco Itaú              | SC            | 12,50 |
| 5  | Banco Mercantil         | SC            | 11,50 |
| 6  | Banco Safra             | SP            | 12,50 |
| 7  | Banco Bradesco          | SC            | 12,50 |
| 8  | Banco Inter             | SP            | 12,50 |
| 9  | Banco Nubank            | SC            | 10,75 |
| 10 | Banco Original          | SP            | 12,50 |

--------

Cenario: Pesquisa por todos os bancos disponíveis utilizando autenticação inválida
Dado que acessei meu endpoint
Quando realizo uma requisição GET com a url {{dev}}/bank
Entao não devo obter nenhum retorno com <id>, <banco>, <estadoAtuacao> e <juros>

--------

Cenario: Pesquisa por estado de atuação - autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requisição GET com a url {{dev}}/bank/estadoAtuacao/<estadoAtuacao>
Entao devo obter um retorno com todos os bancos que tiverem estadoAtuacao == <estadoAtuacao>

Exemplo:
| id | banco                   | estadoAtuacao | juros |
| 1  | Banco do Brasil         | SC            | 11,25 |
| 4  | Banco Itaú              | SC            | 12,50 |
| 5  | Banco Mercantil         | SC            | 11,50 |
| 7  | Banco Bradesco          | SC            | 12,50 |
| 9  | Banco Nubank            | SC            | 10,75 |
| 2  | Caixa Econômica Federal | SP            | 10,75 |
| 6  | Banco Safra             | SP            | 12,50 |
| 8  | Banco Inter             | SP            | 12,50 |
| 10 | Banco Original          | SP            | 12,50 |
| 3  | Banco Santander         | PR            | 13,00 |

--------

Cenario: Pesquisa por estado de atuação - autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requisição GET com a url {{dev}}/bank/estadoAtuacao/<estadoAtuacao>
Entao não devo obter nehum retorno com todos os bancos que tiverem estadoAtuacao == <estadoAtuacao>

--------

Cenario: Alteração de banco existente - autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requição PUT com a url {{dev}}/bank/id/<id>
Entao devo obter um retorno com o ite possuindo ID: <id> alterado conforme scrit json, seguido de uma mmensagem de sucesso <mensagem>

Script Json (exemplo):
{
"id": 1,
"banco": "Banco do Brasil",
"estadoAtuacao": "SP",
"juros": "15,00%"
}

Exemplo:
| id | mensagem                         |
| 1  | "Registro alterado com sucesso!" |

-------

Cenario: Alteração de banco existente - autenticação inválida
Dado que acessei meu endpoint
Quando realizo uma requição PUT com a url {{dev}}/bank/id/<id>
Entao não devo obter nenhum retorno com o ite possuindo ID: <id> alterado conforme scrit json, seguido de uma mmensagem de sucesso <mensagem>

--------

Cenario: Adição de novo banco - autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requição POST com a url {{dev}}/bank
Entao devo obter um retorno com o item adicionado conforme scrit json, seguido de uma mensagem de sucesso <mensagem>

Script Json (exemplo):
{
"banco": "Banco do Teste",
"estadoAtuacao": "SC",
"juros": "10,00%"
}

Exemplo:
| id | mensagem                        |
| 1  | "Banco adicionado com sucesso!" |

--------

Cenario: Adição de novo banco - autenticação inválida
Dado que acessei meu endpoint
Quando realizo uma requição POST com a url {{dev}}/bank
Entao não devo obter nenhum retorno com o item adicionado conforme scrit json, seguido de uma mensagem de sucesso <mensagem>

--------

Cenario: Exlcusão de banco existente - autenticação válida
Dado que acessei meu endpoint
Quando realizo uma requição DELETE com a url {{dev}}/bank
Entao devo obter um retorno com todos os bancos, menos o exluído, seguido por mensagem <mensagem>

Script Json (exemplo):
{
"banco": "Banco do Teste",
"estadoAtuacao": "SC",
"juros": "10,00%"
}

Exemplo:
| id  | mensagem                     |
| 660 | "Banco exluído com sucesso!" |

--------

Cenario: Exlcusão de banco existente - autenticação inválida
Dado que acessei meu endpoint
Quando realizo uma requição DELETE com a url {{dev}}/bank
Entao não devo obter nenhum retorno com todos os bancos, menos o exluído, seguido por mensagem <mensagem>
