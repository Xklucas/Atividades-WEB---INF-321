# Saudação multilíngue em Phoenix

Nesta atividade da Unidade 4.1 de INF321, usei o projeto gerado pelo
Phoenix como ponto de partida. Implementei a rota `/saudacao/:lang/:name`
para mostrar uma saudação em português ou inglês a partir dos dados da URL.

| Rota | Resultado |
| --- | --- |
| `/saudacao/pt/lucas` | Olá, Lucas! |
| `/saudacao/en/lucas` | Hello, Lucas! |

## Como implementei

No roteador, associei a URL a `HelloController.saudacao/2`. Usei pattern
matching no cabeçalho de cada cláusula para identificar o idioma e extrair
o nome. Capitalizei o nome com `String.capitalize/1` para que `lucas` apareça
como `Lucas`.

Reaproveitei o mesmo template HEEx nos dois idiomas e passei a ele o texto
da saudação e o nome. No CSS, centralizei o cartão e mantive o fundo cinza
e o emoji de aceno do exemplo da aula. Também deixei a página inicial
redirecionar para o exemplo em português e tratei idiomas fora da lista
com uma página que responde com HTTP 404.

## Execução e testes locais

No Windows PowerShell, usei o `mix.bat` na pasta do projeto. A aplicação
usa Elixir 1.17 ou superior com um Erlang/OTP compatível e dispensa banco de
dados.

```powershell
mix.bat deps.get
mix.bat phx.server
```

Conferi as duas saudações em [localhost:4000](http://localhost:4000). Com
`mix.bat test`, os testes também verificam o redirecionamento da página
inicial, um nome com acento e a resposta para um idioma fora da lista.
Em shells que chamam o Mix diretamente, os mesmos comandos usam `mix`.

## Deploy no Render

Preparei o Blueprint em `Phoenix - Saudacao Multilingue/render.yaml` para
criar um Web Service gratuito em Elixir a partir da branch `main`. Defini
`rootDir` com o nome desta pasta para que o Render execute o `build.sh`
aqui e inicie a release gerada. Em produção, o Phoenix lê
`SECRET_KEY_BASE` de uma variável de ambiente do Render. No PowerShell,
o comando para gerar esse valor é `mix.bat phx.gen.secret`.
