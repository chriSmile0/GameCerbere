import QtQuick 2.10

Item{
    property string login: "login"
    property string color: "#000000"
    property string difficulty: "0"
    property string rage: "0"
    property string vitesse: "0"
    property string posCerbere: "0"
    property string pont: "1"
    property variant players: []

    signal _loginChanged()
    signal _colorChanged()
    signal _difficultyChanged()
    signal _rageChanged()
    signal _vitesseChanged()
    signal _playersChanged(variant players)
    signal _positionChanged(string newPosition, string color)

    function changeLogin(newlogin) {
        login = newlogin
        _loginChanged()
    }

    function changeColor(newcolor) {
        color = newcolor
        _colorChanged()
    }

    function changeDifficulty(newDifficulty) {
        difficulty = newDifficulty
        _difficultyChanged()
    }

    function changeRage(newRage) {
        rage = newRage
        _rageChanged()
    }

    function changeVitesse(newVitesse) {
        vitesse = newVitesse
        _vitesseChanged()
    }

    function changePosCerbere(newPosCerbere) {
        posCerbere = newPosCerbere
        _positionChanged(posCerbere, "Black")
    }

    function changePlayers(newPlayers) {
        players = newPlayers
        _playersChanged(players)
    }

    function changePosition(color, newPosition) {
        for (var i = 0; i < players.length; i++) {
            if (players[i].colour == color) {
                players[i].position == newPosition
                _positionChanged(newPosition, players[i].colour)
            }
        }
    }

    function initGame(newPlayers, newDifficulty) {
        changePlayers(newPlayers)
        changeDifficulty(newDifficulty)
        changeRage(8 - newPlayers.length)
        changeVitesse(3 + newDifficulty)
        changePosCerbere("0")
    }
    
    Component.onCompleted: {
        _loginChanged.connect(parent.board.playerInfo.updateLogin)
        _colorChanged.connect(parent.board.playerInfo.updateColor)
        _playersChanged.connect(parent.board.boardId.pionesId.unhideNonPlayerPieces)
        _playersChanged.connect(parent.board.infoJoueurId.updatePlayerInfo)
        _positionChanged.connect(parent.board.boardId.receiveCounter)
    }
}