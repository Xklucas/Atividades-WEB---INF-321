# Atividade 3 - Catálogo interativo

Aluno: **Lucas Carvalho de Góes**  
Matrícula: **93740**

Esta entrega amplia a página de produtos da Atividade 2 com interações em JavaScript. Não há back-end: carrinho, compra e envio de mensagem são simulações executadas no navegador.

## Funcionalidades implementadas

- **Carrinho:** o botão **Comprar** adiciona o produto, atualiza o contador e mostra uma mensagem de confirmação.
- **Modal do carrinho:** apresenta itens, quantidades, total, remoção, limpeza e finalização simulada da compra. O carrinho é mantido no `localStorage` do navegador.
- **Busca e filtragem:** o botão **Buscar** filtra os produtos por nome ou descrição, sem diferenciar maiúsculas, minúsculas ou acentos.
- **Formulário de contato:** valida Nome, E-mail e Mensagem antes do envio simulado.
- **Interação visual:** utiliza `classList.add()`, `classList.remove()` e `classList.toggle()` para alterar a interface.

## Estrutura do projeto

- `index.html`: catálogo, busca, formulários, alerta e modal do carrinho.
- `style.css`: estilos da base, responsividade e estados visuais da interatividade.
- `script.js`: lógica do carrinho, compra, busca e validação do contato.
- `produto-cadastrado.html`: confirmação local do cadastro de produto já existente na base.
- `imagens/`: imagens dos produtos exibidos nos cards.

## Como executar

Abra `index.html` em um navegador moderno. Nenhuma instalação ou servidor é necessário.
