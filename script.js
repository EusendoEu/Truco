const cartas = [
    "A♠",
    "7♥",
    "K♦"
];

const area = document.getElementById("cartas-jogador");
const centro = document.getElementById("centro");

cartas.forEach(carta => {

    const div = document.createElement("div");

    div.className = "carta";

    div.innerText = carta;

    div.onclick = () => {

        centro.innerHTML = `
            <div class="carta">
                ${carta}
            </div>
        `;

        div.remove();

    };

    area.appendChild(div);

});