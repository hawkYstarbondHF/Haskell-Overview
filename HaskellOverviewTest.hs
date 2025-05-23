import System.Exit (exitFailure)
import Test.HUnit
import Control.Exception
import System.IO.Unsafe
import System.IO.Silently
import System.Directory
import HaskellOverview hiding (main)

testExercise1 = TestCase (assertEqual "exercise1" "The sum is: 62790\n" (fst (unsafePerformIO (capture exercise1))))

testLimitedSum1 = TestCase (assertEqual "limitedSum 200 1287" 62790 (limitedSum 200 1287))
testLimitedSum2 = TestCase (assertEqual "limitedSum 15 78" 260 (limitedSum 15 78))
testLimitedSum3 = TestCase (assertEqual "limitedSum 331 1503" 82485 (limitedSum 331 1503))
testLimitedSum4 = TestCase (assertEqual "limitedSum 13 0" 0 (limitedSum 13 0))
testLimitedSum5 = TestCase (assertEqual "limitedSum 13 12" 0 (limitedSum 12 0))
testLimitedSum6 = TestCase (assertEqual "limitedSum 13 13" 13 (limitedSum 13 13))

testExercise2 = TestCase (assertEqual "exercise2" "HB\nHB\na1\na1\na1\n1a\n" (fst (unsafePerformIO (capture exercise2))))

string1 = "x x x x x x x x x x x x x x x x x x x x x x x x s x s sdasf dsfsdf sdf sdf sdfewfasf fsakkkasdfkwa o93 2"
string2 = "sad"
string3 = "\taddasdad \n\n we" 
string4 = "\n \t\n\n\n\t\tx x x x x x x x x x x x x x x x x x x x x x x x s x s sdasf dsfsdf sdf sdf sdfewfasf fsakkkasdfkwa o93 2"

showEscape "" = ""
showEscape ('\n':xs) = "\\n" ++ showEscape xs
showEscape ('\t':xs) = "\\t" ++ showEscape xs
showEscape (x:xs) = x:showEscape xs

testFirstLongerShorter1 = TestCase (assertEqual ("firstLongerShorter \""++showEscape string1++"\" \""++showEscape string2++"\"") "xs" (firstLongerShorter string1 string2))
testFirstLongerShorter2 = TestCase (assertEqual ("firstLongerShorter \""++showEscape string3++"\" \""++showEscape string4++"\"") "\n\t" (firstLongerShorter string3 string4))

errorFromFirstLongerShorter msg x1 x2 = catch (evaluate (firstLongerShorter x1 x2) >> return False) handler
  where
    handler (ErrorCall e) = return (e == msg)

testFirstLongerShorterError1 = TestCase (do
  result <- errorFromFirstLongerShorter "Two non-empty Strings needed" "" "Test"
  assertBool "Expected specific error for empty first string" result)

testFirstLongerShorterError2 = TestCase (do
  result <- errorFromFirstLongerShorter "Two non-empty Strings needed" "Test" ""
  assertBool "Expected specific error for empty second string" result)

testExercise3 = TestCase (assertEqual "exercise3" "1, 2, 3, 4, 6, 7, 8, 9, 10, 5\n" (fst (unsafePerformIO (capture exercise3))))

testMoveToEnd1 = TestCase (assertEqual "map (moveToEnd [1,2,3,4,5,6,7,8,9,10]) [0 .. 9]" [[2,3,4,5,6,7,8,9,10,1],[1,3,4,5,6,7,8,9,10,2],[1,2,4,5,6,7,8,9,10,3],[1,2,3,5,6,7,8,9,10,4],[1,2,3,4,6,7,8,9,10,5],[1,2,3,4,5,7,8,9,10,6],[1,2,3,4,5,6,8,9,10,7],[1,2,3,4,5,6,7,9,10,8],[1,2,3,4,5,6,7,8,10,9],[1,2,3,4,5,6,7,8,9,10]] (map (moveToEnd [1,2,3,4,5,6,7,8,9,10]) [0 .. 9]))
testMoveToEnd2 = TestCase (assertEqual "map (moveToEnd [10000,-243,32,367845]) [0 .. 3]" [[-243,32,367845,10000],[10000,32,367845,-243],[10000,-243,367845,32],[10000,-243,32,367845]] (map (moveToEnd [10000,-243,32,367845]) [0 .. 3]))
testMoveToEnd3 = TestCase (assertEqual "map (moveToEnd [1,2,3,1,2,3,4,4,3,2]) [0 .. 8]" [[2,3,1,2,3,4,4,3,2,1],[1,3,1,2,3,4,4,3,2,2],[1,2,1,2,3,4,4,3,2,3],[1,2,3,2,3,4,4,3,2,1],[1,2,3,1,3,4,4,3,2,2],[1,2,3,1,2,4,4,3,2,3],[1,2,3,1,2,3,4,3,2,4],[1,2,3,1,2,3,4,3,2,4],[1,2,3,1,2,3,4,4,2,3]] (map (moveToEnd [1,2,3,1,2,3,4,4,3,2]) [0 .. 8]))

testExercise4 = TestCase (assertEqual "exercise4" "9\n9\n28\n28\n406\n406\n" (fst (unsafePerformIO (capture exercise4))))

testRecursiveSeq = TestCase (assertEqual "map recursiveSeq ([0 .. 10]++[20,30,40])" [1,2,3,4,6,9,13,19,28,41,60,2745,125491,5736961] (map recursiveSeq ([0 .. 10]++[20,30,40])))
testDynamicSeq = TestCase (assertEqual "map dynamicSeq [0 .. 99]" [1,2,3,4,6,9,13,19,28,41,60,88,129,189,277,406,595,872,1278,1873,2745,4023,5896,8641,12664,18560,27201,39865,58425,85626,125491,183916,269542,395033,578949,848491,1243524,1822473,2670964,3914488,5736961,8407925,12322413,18059374,26467299,38789712,56849086,83316385,122106097,178955183,262271568,384377665,563332848,825604416,1209982081,1773314929,2598919345,3808901426,5582216355,8181135700,11990037126,17572253481,25753389181,37743426307,55315679788,81069068969,118812495276,174128175064,255197244033,374009739309,548137914373,803335158406,1177344897715,1725482812088,2528817970494,3706162868209,5431645680297,7960463650791,11666626519000,17098272199297,25058735850088,36725362369088,53823634568385,78882370418473,115607732787561,169431367355946,248313737774419,363921470561980,533352837917926,781666575692345,1145588046254325,1678940884172251,2460607459864596,3606195506118921,5285136390291172,7745743850155768,11351939356274689,16637075746565861,24382819596721629,35734758952996318] (map dynamicSeq [0 .. 99]))

errorFromSeq msg f n = unsafePerformIO (catch (print (f n) >> pure False) handler)
      where
        handler (ErrorCall e) = return (e == msg)

testRecursiveSeqError1 = TestCase (assertBool "no error or wrong error message from recursiveSeq (-30)" (errorFromSeq "Negative input" recursiveSeq (-30)))
testRecursiveSeqError2 = TestCase (assertBool "no error or wrong error message from recursiveSeq (-5)" (errorFromSeq "Negative input" recursiveSeq (-5)))
testRecursiveSeqError3 = TestCase (assertBool "no error or wrong error message from recursiveSeq (-1)" (errorFromSeq "Negative input" recursiveSeq (-1)))

testDynamicSeqError1 = TestCase (assertBool "no error or wrong error message from dynamicSeq (-30)" (errorFromSeq "Negative input" dynamicSeq (-30)))
testDynamicSeqError2 = TestCase (assertBool "no error or wrong error message from dynamicSeq (-5)" (errorFromSeq "Negative input" dynamicSeq (-5)))
testDynamicSeqError3 = TestCase (assertBool "no error or wrong error message from dynamicSeq (-1)" (errorFromSeq "Negative input" dynamicSeq (-1)))

testExercise5 = TestCase (assertEqual "exercise5" "Maximum value: 201\nAverage value: 8.688524590163935\n" (fst (unsafePerformIO (capture exercise5))))

swapFileForExercise5 = do
    renameFile "numbers.txt" "numbers.cpy"
    finally
        (writeFile "numbers.txt" "-34\n-12312\n-200\n-3\n-145\n-57\n-9494\n-90909\n"
         >> exercise5)
        (removeFile "numbers.txt"
         >> renameFile "numbers.cpy" "numbers.txt")

testExercise5DifferentFile = TestCase (assertEqual "exercise5 with different file" "Maximum value: -3\nAverage value: -14144.25\n" (fst (unsafePerformIO (capture swapFileForExercise5))))

removeFileForExercise5 = do
    renameFile "numbers.txt" "numbers.cpy"
    finally exercise5
            (renameFile "numbers.cpy" "numbers.txt")

testExercise5NoFile = TestCase (assertEqual "exercise5 with no file" "The file \"numbers.txt\" does not exist. Exiting.\n" (fst (unsafePerformIO (capture removeFileForExercise5))))

testExercise6 = TestCase (assertEqual "exercise6" "Employee 1 earns $330.00 for 40 hours of work.\nEmployee 1 earns $214.50 for 26 hours of work.\nEmployee 2 earns $604.00 for 40 hours of work.\n" (fst (unsafePerformIO (capture exercise6))))

tests = TestList [TestLabel "testExercise1" testExercise1,
                  TestLabel "testLimitedSum1" testLimitedSum1,
                  TestLabel "testLimitedSum2" testLimitedSum2,
                  TestLabel "testLimitedSum3" testLimitedSum3,
                  TestLabel "testLimitedSum4" testLimitedSum4,
                  TestLabel "testLimitedSum5" testLimitedSum5,
                  TestLabel "testLimitedSum6" testLimitedSum6,
                  TestLabel "testExercise2" testExercise2,
                  TestLabel "testFirstLongerShorter1" testFirstLongerShorter1,
                  TestLabel "testFirstLongerShorter2" testFirstLongerShorter2,
                  TestLabel "testFirstLongerShorterError1" testFirstLongerShorterError1,
                  TestLabel "testFirstLongerShorterError2" testFirstLongerShorterError2,
                  TestLabel "testExercise3" testExercise3,
                  TestLabel "testMoveToEnd1" testMoveToEnd1,
                  TestLabel "testMoveToEnd2" testMoveToEnd2,
                  TestLabel "testMoveToEnd3" testMoveToEnd3,
                  TestLabel "testExercise4" testExercise4,
                  TestLabel "testRecursiveSeq" testRecursiveSeq,
                  TestLabel "testDynamicSeq" testDynamicSeq,
                  TestLabel "testRecursiveSeqError1" testRecursiveSeqError1,
                  TestLabel "testRecursiveSeqError2" testRecursiveSeqError2,
                  TestLabel "testRecursiveSeqError3" testRecursiveSeqError3,
                  TestLabel "testDynamicSeqError1" testDynamicSeqError1,
                  TestLabel "testDynamicSeqError2" testDynamicSeqError2,
                  TestLabel "testDynamicSeqError3" testDynamicSeqError3,
                  TestLabel "testExercise5" testExercise5,
                  TestLabel "testExercise5DifferentFile" testExercise5DifferentFile,
                  TestLabel "testExercise5NoFile" testExercise5NoFile,
                  TestLabel "testExercise6" testExercise6]

main :: IO ()
main = do
  counts <- runTestTT tests
  if errors counts == 0 && failures counts == 0
    then return ()
    else exitFailure