object Ch2Ex{
  // 2.1 Function to obtain the n-th Fibonacci number.
  // Mine
  def fib(n: Int): Int = {
    if (n < 1) -1
    else if (n == 1) 0
    else if (n == 2) 1
    else {
      @annotation.tailrec
      def go(fib_2: Int, fib_1: Int, i:Int): Int = { // fib_k == fib(n-k)
        if (i == 0) fib_1
        else go(fib_1, fib_1 + fib_2, i - 1)
      }
      go(0, 1, n - 2)
    }
  }
  // ChatGPT
  def fibonacci(n: Int): Int = {
    if (n <= 0) {
      throw new IllegalArgumentException("El valor de n debe ser mayor que cero.")
    } else {
      @annotation.tailrec
      def loop(a: Int, b: Int, n: Int): Int = {
        if (n == 0) a
        else loop(b, a + b, n - 1)
      }
      loop(0, 1, n - 1)
    }
  }
  // Aunque el código de CGPT es más conciso, requiere un cómputo más de los necesarios para ubicar el resultado en `a`. Esto es asintóticamente inadecuado, por lo tanto el mío tiene un mejor manejo de casos base.
  

  // 2.2
  def isSorted[A](as: Array[A], ordered: (A,A) => Boolean): Boolean = {
    def go(a: Int, b: Int, as: Array[A]): Boolean = {
      if (b > as.length - 1) true
      else {
        if (ordered(as(a),as(b)) != true) false
        else go(a+1, b+1, as)
      }
    }
    go(0,1, as)
  }

  // 2.3
  def curry[A,B,C](f:(A,B)=>C): A=>(B=>C) = {
    (a:A) => (b:B) => f(a,b)
  } 

  // 2.4
  def uncurry[A,B,C](f: A => B => C): (A,B) => C = {
    (a:A, b:B) => f(a)(b)
  }

  // 2.5
  def compose[A,B,C](f: B => C, g: A => B): A => C = {
    (a:A) => f(g(a))
  }
}
