# Battleship

## Reflections

1. Although iteration 3 did not have an interaction pattern, we already had a thorough understanding of the moving parts, it was just a matter of piecing them together. 
We followed the desired outputs from the game description. 
We did not use TDD in the traditional sense as it was difficult to account for expected input/output from `gets.chomp` and recursive methods. 
However, with each new method we implemented user testing with the game. 
We began with ideal input to get the game to function before moving on to edge cases.

2. If we had more time to work, we would've liked to find a way to test within a runner file and explore edge cases. 
Furthermore, all of iteration 4 looked interesting. 
Especially having a dynamically changing board size and a computer making intelligent guesses.
If we were to do it over again, we would've liked to break down large, complicated methods into smaller helper methods earlier on before they got too large/complicated and too heavily relied on by other functions.
    - On a closing note, in our `board.rb` file on line 35 lives out `valid_placement?` method. 
    It is rather large and complicated. We would have liked to break it up into several smaller helper methods, but ran out of time.
    We considered referencing chat gpt to do it, but we would not have learned anything from this, so we left the method as is as a reference point to improve on.

3. We primarily used 'Driver Navigator' pairing technique so we could both problem solve together and have a foundational understanding of our code. 
We used occasional 'ping ponging' for small refactors. 
Communication through Slack and github comments were very effective.

4. Feedback was mainly in real time. At the start of each work session we would recap and go over our goals for the session. 
Our partner check in was a more detailed exchange. 
Technical feedback was exchanged in the github comments during the pull request process.