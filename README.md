# Prisoners Dilemma Smart Contract

Este contrato inteligente implementa el juego del dilema de los prisioneros en la blockchain de Ethereum. El contrato permite a dos jugadores registrarse, tomar decisiones y recibir recompensas basadas en sus decisiones.

## Descripción

El dilema de los prisioneros es un problema fundamental en la teoría de juegos que muestra por qué dos personas podrían no cooperar, incluso si es en su mejor interés hacerlo. En este contrato, los jugadores pueden optar por cooperar o no cooperar. Las recompensas se distribuyen automáticamente según las siguientes reglas:

- **Ambos cooperan**: Ambos jugadores reciben una recompensa moderada.
- **Uno coopera y el otro no coopera**: El jugador que no coopera recibe una recompensa alta y el jugador que coopera recibe una recompensa baja.
- **Ambos no cooperan**: Ambos jugadores reciben una recompensa baja.

## Requisitos Previos

- Node.js
- Truffle
- Ganache (opcional para pruebas locales)
- Metamask (u otro proveedor de Web3)

## Despliegue

Para desplegar el contrato, sigue estos pasos:

1. Clona el repositorio:
    ```bash
    git clone https://github.com/tu-usuario/prisoners-dilemma.git
    cd prisoners-dilemma
    ```

2. Instala las dependencias:
    ```bash
    npm install
    ```

3. Configura la red de Ethereum en `truffle-config.js`.

4. Compila y despliega el contrato:
    ```bash
    truffle compile
    truffle migrate
    ```

## Uso

1. **Registro de Jugadores**: Los jugadores se registran en el contrato enviando la cantidad de depósito especificada.
2. **Toma de Decisiones**: Cada jugador envía su decisión (cooperar o no cooperar) al contrato.
3. **Distribución de Recompensas**: Una vez que ambos jugadores han tomado sus decisiones, el contrato distribuye automáticamente las recompensas basadas en las reglas del dilema de los prisioneros.

## Ejemplo de Interacción

### Registro de Jugadores

Para registrarse, los jugadores deben enviar el depósito al contrato. Supongamos que el contrato requiere un depósito de 1 ether:

```solidity
PrisonersDilemma.deployed().then(function(instance) {
    return instance.makeDecision(true, { from: player1, value: web3.utils.toWei("1", "ether") });
});
```

### Toma de Decisiones

Los jugadores toman sus decisiones (cooperar o no cooperar):

```solidity
PrisonersDilemma.deployed().then(function(instance) {
    return instance.makeDecision(false, { from: player2, value: web3.utils.toWei("1", "ether") });
})
```

### Distribución de Recompensas

Una vez que ambos jugadores han tomado sus decisiones, el contrato distribuye automáticamente las recompensas.
