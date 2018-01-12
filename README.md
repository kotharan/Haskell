# Haskell

Things to learn from file Doctest.hs 
- Creating funtion to add
- Check condition
- Multiple funtions
- Math Calculation
-  Working with pair
- Working with lists
<br>
<h2>Need help Running Haskell Code??</h2>

- <a href="https://www.haskell.org/platform/">Haskell Platform </a>– The easiest way to start using Haskell. I will assume you have this installed.

- <a href="https://hackage.haskell.org/">Hackage</a> – The central package archive for the Haskell community. There are lots of useful libraries here. You can install them using the cabal tool, which comes with the Haskell Platform. First, run the following command to download the list of packages on Hackage.
<pre>
  <i style="font-family:Lucida Console,Courier,monospace">cabal update
  
Then you can install new packages by running the following command.
  cabal install [package-name]</i>
</pre>
- <a href="https://www.fpcomplete.com/user/simonmichael/how-to-cabal-install">How to cabal install</a> – A longer tutorial about installing packages from Hackage, in case you run into problems.

- <a href="https://hackage.haskell.org/package/doctest">Doctest</a> – A useful tool for running examples in comments as unit tests. We’ll use this in some Homework assignments. You can install doctest using cabal install doctest, as described above.

You will probably also need to add the installation directory to your $PATH. Here are my best guesses as to where that will be:

Linux: ~/.cabal/bin <br>
Mac: ~/Library/Haskell/bin <br>
Windows: C:\Program Files\Haskell\bin
