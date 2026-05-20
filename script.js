const cartas = [
    "A♠",
    "K♦",
    "7♥"
];

const area = document.getElementById("cartas-jogador");

const centro = document.getElementById("centro");

cartas.forEach(carta=>{

    const div = document.createElement("div");

    div.className = "carta";

    div.innerHTML = carta;

    div.setAttribute("data-small", carta);

    div.onclick = ()=>{

        centro.innerHTML = "";

        const cartaJogada = document.createElement("div");

        cartaJogada.className = "carta";

        cartaJogada.innerHTML = carta;

        cartaJogada.setAttribute("data-small", carta);

        centro.appendChild(cartaJogada);

        div.style.opacity = ".25";

        div.style.transform = "scale(.9)";
    };

    area.appendChild(div);

});

document
.getElementById("btn-truco")
.onclick = ()=>{

    const btn =
    document.getElementById("btn-truco");

    btn.innerHTML = "TRUUUUCOOOO!";

    btn.style.transform =
    "translateX(-50%) scale(1.15)";

    setTimeout(()=>{

        btn.innerHTML = "TRUCO!";

        btn.style.transform =
        "translateX(-50%) scale(1)";

    },1000);

};