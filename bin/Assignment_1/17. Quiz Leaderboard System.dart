class Player {
  final int id;
  final String name;
  int score;

  Player({
    required this.id,
    required this.name,
    this.score = 0,
  });
}

class Leaderboard {
  List<Player> _players = [];

  void addPlayer(Player player) {
    _players.add(player);
    _sortLeaderboard();
  }

  void updatePlayerScore(int playerId, int newScore) {
    _players.firstWhere((player) => player.id == playerId).score = newScore;
    _sortLeaderboard();
  }

  List<Player> getTopPlayers(int count) {
    return _players.sublist(0, count);
  }

  void _sortLeaderboard() {
    _players.sort((a, b) => b.score.compareTo(a.score)); // Sort in descending order
  }
}

// Example usage
void main() {
  // Create sample players
  Player player1 = Player(id: 1, name: 'Alice', score: 100);
  Player player2 = Player(id: 2, name: 'Bob', score: 80);
  Player player3 = Player(id: 3, name: 'Charlie', score: 90);

  // Create a Leaderboard instance
  Leaderboard leaderboard = Leaderboard();

  // Add players to the leaderboard
  leaderboard.addPlayer(player1);
  leaderboard.addPlayer(player2);
  leaderboard.addPlayer(player3);

  // Update player score
  leaderboard.updatePlayerScore(2, 95); // Update Bob's score

  // Get and print top 3 players
  List<Player> topPlayers = leaderboard.getTopPlayers(3);
  for (var player in topPlayers) {
    print('${player.name}: ${player.score}');
  }
}