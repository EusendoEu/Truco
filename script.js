const cartasJogador = [
    "A♠",
    "K♦",
    "7♥"
];

const areaJogador = document.getElementById("cartas-jogador");
const centro = document.getElementById("centro");

cartasJogador.forEach(carta => {

    const div = document.createElement("div");

    div.className = "carta";

    div.innerText = carta;

    div.onclick = () => {

        centro.innerHTML = `
            <h2>Carta Jogada</h2>
            <div class="carta">${carta}</div>
        `;

        div.remove();
    };

    areaJogador.appendChild(div);

});