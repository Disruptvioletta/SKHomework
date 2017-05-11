//Шахматная доска (Легкий уровень)
//
//1. Создайте тип шахматная доска.
//
//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
//
//3. Если юзер ошибся координатами - выдавайте нил

struct ChessBoard {
  private let startX = 1
  private let endX = 8
  private let startY = 1
  private let endY = 8
  private let intSymb = [1: "a", 2: "b", 3: "c", 4: "d", 5: "e", 6: "f", 7: "g", 8: "h"]
  private let symbInt = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]
  
  subscript (symb: String, num: Int) -> String? {
    if (symbInt[symb] != nil) && (num >= startY && num <= endY) {
      return ((num % 2 == symbInt[symb]! % 2) ? "⬛️ - Black" : "⬜️ - White")
    } else {
      return nil
    }
  }
}
let chessBoard = ChessBoard()
print(chessBoard["a", 1] ?? "Wrong parameters")
print(chessBoard["g", 8] ?? "Wrong parameters")
print(chessBoard["c", 5] ?? "Wrong parameters")
print(chessBoard["aq", 1] ?? "Wrong parameters")
print(chessBoard["b", 0] ?? "Wrong parameters")
