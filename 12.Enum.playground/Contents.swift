//1. Создать инам с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 
enum ChessFigures {
  enum Color: String {
    case Black = "Black"
    case White = "White"
  }
  
  enum Figure: String {
    case King = "King"
    case Queen = "Queen"
    case Bishop = "Bishop"
    case Knight = "Knight"
    case Pawn = "Pawn"
    case Rook = "Rook"
  }
  
  enum Column: Int {
    case a = 1
    case b = 2
    case c = 3
    case d = 4
    case e = 5
    case f = 6
    case g = 7
    case h = 8
  }
  
  enum Row: Int {
    case _1 = 1, _2, _3, _4, _5, _6, _7, _8
  }
}

typealias ChessFigure = (color: ChessFigures.Color, figure: ChessFigures.Figure, column: ChessFigures.Column, row: ChessFigures.Row)


var arrayOfFigures: [ChessFigure] = []
arrayOfFigures.append((color: .White, figure: .King, column: .e, row: ._1))
arrayOfFigures.append((color: .Black, figure: .King, column: .e, row: ._7))
arrayOfFigures.append((color: .White, figure: .Rook, column: .a, row: ._6))
arrayOfFigures.append((color: .Black, figure: .Knight, column: .a, row: ._1))
arrayOfFigures.append((color: .White, figure: .Queen, column: .d, row: ._4))
arrayOfFigures.append((color: .White, figure: .Pawn, column: .f, row: ._2))
arrayOfFigures.append((color: .Black, figure: .Pawn, column: .g, row: ._3))

//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.


func printFigures(_ arrayOfFigures: [ChessFigure]){
  func printFigure(_ figure: ChessFigure){
    print("Figure: \(figure.color) \(figure.figure), position: \(figure.column)\(figure.row.rawValue)")
  }
  for figure in arrayOfFigures {
    printFigure(figure)
  }
}
printFigures(arrayOfFigures)


//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)


func printBoard(_ arrayOfFigures: [ChessFigure]) {
  
  
  func printSymbol(_ row: Int,_ column: Int,_ arrayOfFigures: [ChessFigure]) -> String {
    let blackChessFigures: [ChessFigures.Figure : String] = [
      ChessFigures.Figure.King : "♔",
      ChessFigures.Figure.Queen : "♕",
      ChessFigures.Figure.Bishop : "♗",
      ChessFigures.Figure.Knight : "♘",
      ChessFigures.Figure.Pawn : "♙"
    ]
    let whiteChessFigures: [ChessFigures.Figure : String] = [
      ChessFigures.Figure.King : "♚",
      ChessFigures.Figure.Queen : "♛",
      ChessFigures.Figure.Rook : "♜",
      ChessFigures.Figure.Bishop : "♝",
      ChessFigures.Figure.Knight : "♞",
      ChessFigures.Figure.Pawn : "♟"
    ]
    var fig : String?
    for figure in arrayOfFigures {
      if figure.column.rawValue == column && figure.row.rawValue == row {
        switch figure.color {
        case .White:
          fig = whiteChessFigures[figure.figure]!
        case .Black:
          fig = blackChessFigures[figure.figure]!
        }
      }
    }
    return fig ?? ((row % 2 == column % 2) ? "⬛️" : "⬜️")
  }
  print("   a b c d e f g h")
  for i in 0..<8 {
    let row = 8 - i
    print(row, separator: "", terminator: " ")
    for column in 1...8{
      print(printSymbol(row, column, arrayOfFigures), separator: "", terminator: "")
    }
    print(" \(row)")
  }
  print("   a b c d e f g h")
}
printBoard(arrayOfFigures)


//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
typealias ChessPosition = (column: ChessFigures.Column, row: ChessFigures.Row)

func move(figure: inout ChessFigures, position: ChessPosition, checkPosition:  (ChessPosition) -> Bool) {
  
}







 
