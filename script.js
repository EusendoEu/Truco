const cartas = [
    "A♠",
    "K♦",
    "7♥"
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

        div.style.opacity = "0.3";

    };

    area.appendChild(div);

});

document
.getElementById("btn-truco")
.onclick = () => {

    alert("TRUUUUCOOOO!");
};