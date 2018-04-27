HW4
Group Memebers: Anand Kothari , Munisha Parikh , Bhavya Parikh

-- Exercise 1
   []
 1 [x:?]
 2 [y:?, x:?]
 3 [y:1, x:?]
 4 [f:{}, y:1, x:?]
11 >>

       [x:2, f:{}, y:1, x:?]
     5 [x:2, f:{}, y:1, x:?]
     7 [x:2, f:{}, y:1, x:?]
     8 >>
           
           [x:1, x:2, f:{}, y:1, x:?]
         5 [x:1, x:2, f:{}, y:1, x:?]
         7 [x:1, x:2, f:{}, y:1, x:?]
         8 >>
              
               [x:0, x:1, x:2, f:{}, y:1, x:?]
             5 [x:0, x:1, x:2, f:{}, y:1, x:?]
             6 [x:0, x:1, x:2, f:{}, y:1, x:?]
             7 [x:0, x:1, x:2, f:{}, y:1, x:?]
             9 [res:1, x:0, x:1, x:2, f:{}, y:1, x:?]
           <<

         8 [x:1, x:2, f:{}, y:2, x:?]
         9 [res:2, x:1, x:2, f:{}, y:2, x:?]
       <<
       
     8 [x:2, f:{}, y:5, x:?]
     9 [res:5, x:2, f:{}, y:5, x:?]
     <<

  10 [f:{}, y:1, x:?]
  11 [f:{}, y:5, x:5]
  12 [y:5, x:5]
  13 []

-- Exercise 2
1 { int x;
2 int y;
3 int z;
4 x := 3;
5 y := 7;
6 { int f(int y) { return x*y };
7 int y;
8 y := 11;
9 { int g(int x) { return f(y) };
10 { int y;
11 y := 13;
12 z := g(2);
13 };
14 };
15 };
16 }

 []
 1 [x:?]
 2 [y:?, x:?]
 3 [z:?, y:?, x:?]
 4 [z:?, y:?, x:3]
 5 [z:?, y:7, x:3]
 6 [f:{}, z:?, y:7, x:3]
 9 >>
     ...

(a) z = 3 * 11 = 33
(b) z = 2 * 13 = 26


-- Exercise 3
[]
 1 [y:?]
 2 [z:?, y:?]
 3 [z:?, y:7]
 4 [f:{}, z:?, y:7]
 9 >>
 ...
--a
y = 54
z = 112

--b
y = -14
z = -28