class Player {
  int id;
  String name;
  int score;

  Player(this.id, this.name, this.score);
}

class Leaderboard {
  List<Player> players = [];

  void addPlayer(Player player) {
    players.add(player);
  }

  void updatePlayerScore(int id, int newScore) {
    Player player = players.firstWhere((player) => player.id == id, orElse: () => throw Exception('Player not found'));
    player.score = newScore;
  }

  void displayTopPlayers(int topN) {
    players.sort((a, b) => b.score.compareTo(a.score));
    for (int i = 0; i < topN && i < players.length; i++) {
      print('ID: ${players[i].id}, Name: ${players[i].name}, Score: ${players[i].score}');
    }
  }
}

void main() {
  try {
    Leaderboard leaderboard = Leaderboard();

    Player player1 = Player(1, 'Apurbo', 95);
    Player player2 = Player(2, 'Adiba', 85);
    Player player3 = Player(3, 'Rohit', 90);
    Player player4 = Player(4, 'Manilk', 80);

    leaderboard.addPlayer(player1);
    leaderboard.addPlayer(player2);
    leaderboard.addPlayer(player3);
    leaderboard.addPlayer(player4);

    leaderboard.updatePlayerScore(2, 92);

    print('Top 3 Players:');
    leaderboard.displayTopPlayers(3);
  } catch (e) {
    print('Error: $e');
  }
}
