/* Entrega 3 - interatividade do catálogo (sem back-end). */

const moeda = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });
const porId = (id) => document.getElementById(id);

/* ---------- Mensagem de confirmação ---------- */
const alerta = porId('alerta');
let temporizadorAlerta;

function mostrarMensagem(texto) {
    porId('texto-alerta').textContent = texto;
    alerta.classList.remove('oculto');
    clearTimeout(temporizadorAlerta);
    temporizadorAlerta = setTimeout(fecharMensagem, 3500);
}

function fecharMensagem() {
    alerta.classList.add('oculto');
}

porId('fechar-alerta').addEventListener('click', fecharMensagem);

/* ---------- Carrinho ---------- */
const CHAVE_CARRINHO = 'catalogo-carrinho';
const modal = porId('modal-carrinho');
const botaoAbrir = porId('abrir-carrinho');

function carregarCarrinho() {
    try {
        const salvo = JSON.parse(localStorage.getItem(CHAVE_CARRINHO));
        if (!Array.isArray(salvo)) return [];
        return salvo.filter((item) => item && typeof item.nome === 'string'
            && typeof item.imagem === 'string' && Number.isFinite(item.preco)
            && Number.isInteger(item.qtd) && item.qtd > 0);
    } catch (erro) {
        return [];
    }
}

function salvarCarrinho() {
    try {
        localStorage.setItem(CHAVE_CARRINHO, JSON.stringify(carrinho));
    } catch (erro) {
        /* sem armazenamento disponível: o carrinho vale só até recarregar a página */
    }
}

let carrinho = carregarCarrinho();

function precoParaNumero(texto) {
    return parseFloat(texto.replace(/[^\d,]/g, '').replace(',', '.'));
}

function criar(tag, classe, texto) {
    const elemento = document.createElement(tag);
    if (classe) elemento.className = classe;
    if (texto !== undefined) elemento.textContent = texto;
    return elemento;
}

function adicionarAoCarrinho(produto) {
    const existente = carrinho.find((item) => item.nome === produto.nome);
    if (existente) {
        existente.qtd += 1;
    } else {
        carrinho.push({ ...produto, qtd: 1 });
    }
    atualizarCarrinho();
}

function alterarQuantidade(indice, variacao) {
    carrinho[indice].qtd += variacao;
    if (carrinho[indice].qtd <= 0) carrinho.splice(indice, 1);
    atualizarCarrinho();
}

function criarItem(item, indice) {
    const linha = criar('li', 'item-carrinho');

    const imagem = criar('img');
    imagem.src = item.imagem;
    imagem.alt = item.alt || item.nome;

    const info = criar('div', 'info-item');
    info.append(criar('strong', '', item.nome), criar('span', '', moeda.format(item.preco * item.qtd)));

    const controle = criar('div', 'controle-quantidade');
    const menos = criar('button', 'botao-secundario', '−');
    menos.type = 'button';
    menos.setAttribute('aria-label', 'Diminuir quantidade de ' + item.nome);
    menos.addEventListener('click', () => alterarQuantidade(indice, -1));
    const mais = criar('button', 'botao-secundario', '+');
    mais.type = 'button';
    mais.setAttribute('aria-label', 'Aumentar quantidade de ' + item.nome);
    mais.addEventListener('click', () => alterarQuantidade(indice, 1));
    controle.append(menos, criar('span', 'quantidade', String(item.qtd)), mais);

    const remover = criar('button', 'botao-remover', 'Remover');
    remover.type = 'button';
    remover.setAttribute('aria-label', 'Remover ' + item.nome + ' do carrinho');
    remover.addEventListener('click', () => {
        carrinho.splice(indice, 1);
        atualizarCarrinho();
    });

    linha.append(imagem, info, controle, remover);
    return linha;
}

function atualizarCarrinho() {
    salvarCarrinho();

    const lista = porId('lista-carrinho');
    lista.replaceChildren(...carrinho.map(criarItem));

    const vazio = carrinho.length === 0;
    porId('carrinho-vazio').classList.toggle('oculto', !vazio);
    porId('rodape-carrinho').classList.toggle('oculto', vazio);

    const total = carrinho.reduce((soma, item) => soma + item.preco * item.qtd, 0);
    const quantidade = carrinho.reduce((soma, item) => soma + item.qtd, 0);
    porId('total-carrinho').textContent = moeda.format(total);
    porId('contador-carrinho').textContent = quantidade;
}

/* Abre ou fecha o modal alternando classes com classList.toggle. */
function alternarCarrinho(abrir) {
    modal.classList.toggle('aberto', abrir);
    document.body.classList.toggle('sem-rolagem', abrir);
    if (abrir) {
        porId('fechar-carrinho').focus();
    } else {
        botaoAbrir.focus();
    }
}

botaoAbrir.addEventListener('click', () => alternarCarrinho(true));
porId('fechar-carrinho').addEventListener('click', () => alternarCarrinho(false));
modal.addEventListener('click', (evento) => {
    if (evento.target === modal) alternarCarrinho(false);
});
document.addEventListener('keydown', (evento) => {
    if (evento.key === 'Escape' && modal.classList.contains('aberto')) alternarCarrinho(false);
});

porId('limpar-carrinho').addEventListener('click', () => {
    carrinho = [];
    atualizarCarrinho();
});

porId('finalizar-compra').addEventListener('click', () => {
    carrinho = [];
    atualizarCarrinho();
    alternarCarrinho(false);
    mostrarMensagem('Compra finalizada! (simulação, sem back-end)');
});

/* ---------- Botão "Comprar" ---------- */
const cards = document.querySelectorAll('.card-produto');

cards.forEach((card) => {
    const botao = card.querySelector('.botao-comprar');
    let temporizador;

    botao.addEventListener('click', () => {
        const foto = card.querySelector('img');
        adicionarAoCarrinho({
            nome: card.querySelector('h3').textContent.trim(),
            preco: precoParaNumero(card.querySelector('.preco').textContent),
            imagem: foto.getAttribute('src'),
            alt: foto.alt
        });
        mostrarMensagem('Produto adicionado ao carrinho!');

        botao.classList.add('adicionado');
        botao.textContent = 'Adicionado ✓';
        clearTimeout(temporizador);
        temporizador = setTimeout(() => {
            botao.classList.remove('adicionado');
            botao.textContent = 'Comprar';
        }, 1500);
    });
});

/* ---------- Busca e filtro ---------- */
const campoBusca = porId('busca-produto');

function normalizar(texto) {
    return texto.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().trim();
}

function filtrarProdutos() {
    const termo = normalizar(campoBusca.value);
    let visiveis = 0;

    cards.forEach((card) => {
        const conteudo = card.querySelector('h3').textContent + ' ' + card.querySelector('.conteudo-card p').textContent;
        if (normalizar(conteudo).includes(termo)) {
            card.classList.remove('oculto');
            visiveis += 1;
        } else {
            card.classList.add('oculto');
        }
    });

    porId('sem-resultados').classList.toggle('oculto', visiveis > 0);
}

porId('form-busca').addEventListener('submit', (evento) => {
    evento.preventDefault();
    filtrarProdutos();
});

/* Apagar o texto da busca volta a mostrar todos os produtos. */
campoBusca.addEventListener('input', () => {
    if (campoBusca.value === '') filtrarProdutos();
});

/* ---------- Validação do formulário de contato ---------- */
const formContato = porId('form-contato');
const OBRIGATORIO = 'Este campo é obrigatório.';

const camposContato = [
    { input: porId('contato-nome'), erro: porId('erro-nome'), validar: (valor) => (valor ? '' : OBRIGATORIO) },
    {
        input: porId('contato-email'),
        erro: porId('erro-email'),
        validar: (valor) => {
            if (!valor) return OBRIGATORIO;
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(valor) ? '' : 'Digite um e-mail válido, como nome@exemplo.com.';
        }
    },
    { input: porId('contato-mensagem'), erro: porId('erro-mensagem'), validar: (valor) => (valor ? '' : OBRIGATORIO) }
];

function validarCampo(campo) {
    const mensagem = campo.validar(campo.input.value.trim());
    campo.erro.textContent = mensagem;
    if (mensagem) {
        campo.erro.classList.remove('oculto');
        campo.input.classList.add('invalido');
    } else {
        campo.erro.classList.add('oculto');
        campo.input.classList.remove('invalido');
    }
    campo.input.setAttribute('aria-invalid', String(Boolean(mensagem)));
    return !mensagem;
}

formContato.addEventListener('submit', (evento) => {
    evento.preventDefault();

    const resultados = camposContato.map(validarCampo);
    if (resultados.includes(false)) {
        camposContato[resultados.indexOf(false)].input.focus();
        return;
    }

    mostrarMensagem('Mensagem enviada com sucesso!');
    formContato.reset();
});

/* Depois de um erro, o campo é revalidado enquanto a pessoa digita. */
camposContato.forEach((campo) => {
    campo.input.addEventListener('input', () => {
        if (campo.input.classList.contains('invalido')) validarCampo(campo);
    });
});

atualizarCarrinho();
