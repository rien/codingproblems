module Days.Day1Spec (spec) where

import Test.Hspec
import Test.QuickCheck

import Days.Day1

spec :: Spec
spec = do
    describe "solveFirstCaptcha" $ do
        it "1122" $ do
            solveFirstCaptcha "1122" `shouldBe` 3

        it "1111" $ do
            solveFirstCaptcha "1111" `shouldBe` 4

        it "1234" $ do
            solveFirstCaptcha "1234" `shouldBe` 0

        it "91212129" $ do
            solveFirstCaptcha "91212129" `shouldBe` 9

    describe "solveSecondCaptcha" $ do
        it "1212" $ do
            solveSecondCaptcha "1212" `shouldBe` 6

        it "1221" $ do
            solveSecondCaptcha "1221" `shouldBe` 0

        it "123425" $ do
            solveSecondCaptcha "123425" `shouldBe` 4

        it "123123" $ do
            solveSecondCaptcha "123123" `shouldBe` 12

        it "12131415" $ do
            solveSecondCaptcha "12131415" `shouldBe` 4

