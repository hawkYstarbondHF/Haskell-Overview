{-|
Module      : HaskellOverview
Description : Overview of Haskell language features
Author      : Jacob Schrum, Last modified 6/11/2023
Author      : <YOUR NAME>, Last modified <DATE>

Assignment that provides an overview of basic features
of the Haskell programming language.                     

This code can be run as a script using the following console command:
runghc HaskellOverview.hs

I recommend using VSCode or GitHub codespaces to work on this code, but you should make
sure that it behaves as expected when executed as described above. You may also 
want to interact with the ghci interpreter while developing your code.         

Details on installing Haskell and running unit tests are in the README.

You are expected to complete all exercises according
to the specifications. Do not change the names or type
signatures for any existing functions. You may add new functions, and
will specifically be required to for some exercises.            
If you add a function, you MUST also add a correct type signature.
Even though Haskell will automatically infer the type signatures,
and your code may run fine without them, I require you to provide them.
Absolutely all functions in this file must have complete
comments. For lengthy function descriptions, use block comments
like this one above the function. When commenting a function
body, keep in mind that -- | precedes a comment about the following line
and -- ^ follows a comment on the same or preceding line.

Some function stubs currently return a dummy result to allow
execution, but you will need to replace these with
proper return values. Whenever console output is required,
all formatting must match the specification exactly, including whitespace.
-}
module HaskellOverview where

import Text.Printf (printf) -- ^ Print with format codes
import System.IO            -- ^ For file IO
import Control.Exception    -- ^ For handling exceptions
import System.Directory     -- ^ Has the doesFileExist function

{-|
  Launches code for all exercises. Do not change.
  Is called when executed as a script.
-}
main :: IO ()
main = do       -- ^ "do" enters a state-ful computation that allows you to list certain commands
        printDivider 1
        exercise1
        printDivider 2
        exercise2
        printDivider 3
        exercise3
        printDivider 4
        exercise4
        printDivider 5
        exercise5
        printDivider 6
        exercise6

{-|
 Prints a dividing line between each exercise.
 exercise-number = Problem number printed in output
 returns empty IO Monad
-}
printDivider :: Int -> IO ()
printDivider exerciseNumber = do
        -- | printf is similar to Java's System.out.printf
        printf "--Exercise %d----------------------------------\n" exerciseNumber

----------------------------------------------------------------

{-|
  Exercise 1: Iterative Recursion
  7 points functionality, 4 points documentation
 
  Loops are not possible in Haskell. Haskell is a "pure" functional language,
  and all repetition is accomplished via recursion.
 
  Define the function limitedSum s e, which computes the sum of all 
  numbers between s and e inclusive that are divisible by 13. Call this
  function from the exercise1 function so that it computes the sum of
  all numbers between 200 and 1287 inclusive that are divisible by 13. 
  Afterward, take the result of that function call and print it to the
  console inside the exercise1 function. The format of your printed output 
  should be a single line with a carriage return, and look like the following:
  
  The sum is: XXX
 
  where XXX is the resulting sum.
  
  returns empty IO Monad
-}
exercise1 :: IO ()    -- ^ Note that exercise1 is an "impure" Monadic IO function.
exercise1 = return () -- ^ TODO: Should replace this with a "do" block that gets the result and prints it.

{-|
  This function must recursively compute the sum of items divisible
  by 13 between s and e inclusive, as described in the comment above.

  TODO: parameters and return value
-}
limitedSum :: Integer -> Integer -> Integer
limitedSum s e = -1 -- ^ TODO: Change this dummy value to the correct implementation.

----------------------------------------------------------------

{-|
  Exercise 2: Strings
  7 points functionality, 7 points documentation
 
  Define a function called "firstLongerShorter" that takes
  two String parameters that each have at least one
  character. Generate an error using the "error" function if 
  this precondition is not satisfied. The specific string for
  the error message should be: 
  "Two non-empty Strings needed"
  
  Otherwise, your function should return a String 
  consisting of exactly two characters: The first 
  character of the longer String, followed by the 
  first character of the shorter String. If both 
  Strings have equal length, then the first
  character of the first String parameter should come
  first in the result.

  Note that the type String is just an alias for a
  list of Char, as in [Char].
 
  After defining your function, uncomment the test calls
  below which call your function. Note that your function
  must work for any valid input, not just for these
  examples.
  
  returns empty IO Monad
-}
exercise2 :: IO ()
exercise2 = do
    {-|
      TODO: Uncomment the commented lines below to test your completed function.
            Turn in your code with these lines uncommented.
    -}
    --putStrLn (firstLongerShorter "Hello" "Bye")    -- ^ putStrLn prints a string to the console with a carriage return
    --putStrLn (firstLongerShorter "Bye" "Hello")
    --putStrLn (firstLongerShorter "1" "abc")
    --putStrLn (firstLongerShorter "abc" "1")
    --putStrLn (firstLongerShorter "abc" "123")
    --putStrLn (firstLongerShorter "123" "abc") 
    return () -- ^ This return would normally not be necessary, but since the putStrLn commands are commented out, it is needed.

{-|
  TODO: Fill this comment out properly, and provide the type signature for this function
-}   
firstLongerShorter _ _ = "Define the type signature and body for this function in accordance with the comments above"

----------------------------------------------------------------

{-|
  Exercise 3: Lists
  8 points functionality, 7 points documentation
  
  Define a function called "moveToEnd" that takes a list
  and an index within that list. Return a new list that has
  the same items in the same order, except that the item at 
  the designated index is now at the end of the list, and 
  items that previously came after it now appear one position
  to the left.
  
  Test your method by completing the code below. This code should
  call moveToEnd with a list containing 1, 2, ..., 10 in order, 
  and an index of 4. Afterward, print the contents of the returned
  list to the console on a single line with a carriage return at the 
  end, and a comma and space between each entry. The result should 
  look like the following (must match whitespace!):
  
  1, 2, 3, 4, 6, 7, 8, 9, 10, 5
 
  returns empty IO Monad
-}
exercise3 :: IO ()
exercise3 = return () -- ^ TODO: Should replace this with a "do" block that gets the result and prints it.

{-|
  TODO: Fill this comment out properly, and provide the type signature and body for this function
-}   
moveToEnd _ _ = []

----------------------------------------------------------------

{-|
  Exercise 4: More Recursion
  10 points functionality, 7 points documentation
 
  Define a sequence in the following way. The first three
  numbers are 1, 2, and 3. Every subsequent number is the sum of
  the previous number, and the number two entries before that
  one. So, the first few numbers in the sequence are:
  F(0) = 1
  F(1) = 2
  F(2) = 3
  F(3) = 1+3 = 4
  F(4) = 2+4 = 6
 
  This sequence is similar to, but different from the Fibonacci
  sequence. You will write two methods defining this sequence.
  One uses inefficient recursion, the other uses dynamic programming.
  The dynamic programming solution will still have to be recursive,
  but will track a sufficient number of previous values in the
  sequence as parameters, so that it can execute in O(n) time.

  The function stubs for each approach are provided below. Once they
  are complete, you can uncomment the code in this function to test
  them. Note that these functions should generate an error
  for inappropriate negative inputs, and the error String should be: 
  "Negative input"
 
  returns empty IO Monad
-}
exercise4 :: IO ()
exercise4 = do
    {-|
      TODO: Uncomment the commented lines below to test your completed functions.
            Turn in your code with these lines uncommented.
    -}
    --printf "%d\n" (recursiveSeq 5)
    --printf "%d\n" (dynamicSeq 5)
    --printf "%d\n" (recursiveSeq 8)
    --printf "%d\n" (dynamicSeq 8)
    --printf "%d\n" (recursiveSeq 15)
    --printf "%d\n" (dynamicSeq 15)
    return () -- ^ This return would normally not be necessary, but since the printf commands are commented out, it is needed.

{-|	
  Recursively compute the sequence described in the comment for
  exercise 4.
  n = Position in the sequence
  return n-th value in the sequence
-}
recursiveSeq :: Integer -> Integer
recursiveSeq n = 0 -- ^ TODO: Change this

{-|	
  Compute the sequence described in the comment for
  exercise 4 using dynamic programming. To properly
  track the parameters storing earlier values in the
  sequence, you will need to make a helper function.
  n = Position in the sequence
  return n-th value in the sequence
-}
dynamicSeq :: Integer -> Integer
dynamicSeq n = 0 -- ^ TODO: Change this

----------------------------------------------------------------

{-|	
  Exercise 5: File I/O
  10 points functionality, 8 points documentation
 
  This method should read from the file "numbers.txt" which
  contains only integers, exactly one per line. The function should
  compute and print the maximum and average of the numbers in the file.
  The maximum should be formatted as an int, but the average should be
  a floating point average. You may find the fromInteger function 
  useful for this calculation, due to Haskell's strict type system. 
  The output will consist of exactly two lines, each followed by a 
  carriage return. Here is an example:
 
  Maximum value: XXX
  Average value: XXX
 
  where the XXX portions will be replaced with actual values calculated
  from the file. Note that you code must work for arbitrary input files,
  not just the provided example. However, you can assume the file is
  named "numbers.txt". If a file with this name does not exist, then
  do not crash. Instead, print the error message below followed by a carriage return:
  
  The file "numbers.txt" does not exist. Exiting.
  
  Feel free to look around the Internet for help (documenting sources
  of aid like usual), but at the very least you will need to use some
  functions from System.IO, which is imported at the top of this file.
 
  returns empty IO Monad
-}
exercise5 :: IO ()
exercise5 = return () -- ^ TODO: Change this and write according to specification above

----------------------------------------------------------------

{-|	
  Exercise 6: New data types
  8 points functionality, 7 points documentation
 
  Use data to define a type called "Employee" with two fields:
  - The amount that an employee is paid per hour as a Double. This should be
    named "rate" which will define a function from an Employee to a Double.
  - The number of worked hours that the employee has not been paid for yet as an Int.
    This should be named "hours" which will define a function from an Employee to an Int.
  The data type will also need some kind of arbitrary constructor named whatever you want.
  Uncomment the line below and complete your definition here:
-}
-- | TODO: Provide the right-hand side of the data definition below and uncomment
--data Employee = 

{-|	
  Also, define the functions below that create/use/access/modify your data type. Note that you
  will have to define your Employee data type before uncommenting the type signatures.
-}


{-|	
  The function "newEmployee" creates a new Employee with 0 hours worked,
  but has a Double parameter defining the hourly pay.
  TODO: parameters and return value
-}
--newEmployee :: Double -> Employee
-- ^ TODO: Provide definition and uncomment

{-|	
  A function called "work" with Int and Employee parameters that
  returns an Employee that is the same, but whose number of worked but 
  unpaid hours has increased by the Int amount.
  TODO: parameters and return value
-}
--work :: Int -> Employee -> Employee
-- ^ TODO: Provide definition and uncomment

{-|	
  A function "pay" that takes an Employee and returns a 2-tuple containing
  both the Employee with the number of worked hours reset to 0, and
  a Double that is the amount the Employee should be paid (multiply the rate by the hours)
  TODO: parameters and return value
-}
--pay :: Employee -> (Employee,Double)
-- ^ TODO: Provide definition and uncomment

{-|
  This is a useful helper function you might need. It can convert Ints or
  Integers to Doubles.

  in = some Int or Integer value
  returns corresponding Double value
-}
convert :: Integral a => a -> Double
convert = fromInteger . toInteger

{-|
  This function tests your data type and the functions above. Uncomment the lines
  below to test your implementation.

  returns empty IO Monad
-}
exercise6 :: IO ()
exercise6 = do
    {-|
      TODO: Uncomment the commented lines below to test your completed data type.
            Turn in your code with these lines uncommented.
    -}
    --let e1 = newEmployee 8.25   -- ^ a new Employee
        -- | each call returns a resulting Employee that is a parameter to the next call
        --e1Work = work 8 $ work 8 $ work 8 $ work 8 $ work 8 e1 -- ^ $ avoids need for right-nesting a bunch of parentheses
        --hours1 = hours e1Work
        --(e2,paycheck1) = pay e1Work
    -- | The %.2f format code corresponds to a floating point number with two values after the decimal.
    --printf "Employee 1 earns $%.2f for %d hours of work.\n" paycheck1 hours1

    --let e2Work = work 8 $ work 8 $ work 10 e2
        --hours2 = hours e2Work
        --(_,paycheck2) = pay e2Work  -- ^ We don't care about the Employee since it is not used after this point

    --printf "Employee 1 earns $%.2f for %d hours of work.\n" paycheck2 hours2

    --let e3 = newEmployee 15.10
        --e3Work = work 6 $ work 6 $ work 10 $ work 10 $ work 8 e3
        --hours3 = hours e3Work
        --(_,paycheck3) = pay e3Work  -- ^ We don't care about the Employee since it is not used after this point

    --printf "Employee 2 earns $%.2f for %d hours of work.\n" paycheck3 hours3
    return () -- ^ This return would normally not be necessary, but since the previous commands are commented out, it is needed.
