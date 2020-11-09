#############
#           #
# nim-study #
#           #
#############

# コメント出力関数
import strutils # joinを使うのに必要
# proc {関数名}({引数名}: {型名}, ...): {戻り値の型} =
proc commentize(comment: string): string =
  # ANSIエスケープシーケンス
  const green = "\e[32m"
  const bgGreen = "\e[42m"
  const reset = "\e[0m"
  const commentHead = [green, "### "].join()
  const commentTail = [" ###", reset].join()
  result = [commentHead, comment, commentTail].join()

# 文字列はダブルクォートで囲む
echo commentize("echo")
echo "Hello world"
echo("Hello world from kakko")

# 改行文字列
echo commentize("CRLF")
echo """Nim is
smart
programming
language.
"""

# 変数宣言: 変数名はキャメルケース推奨
var testVar: string = "test var"
const testConst: string = "test const"
let testLet: string = "test let"
echo testVar, testConst, testLet

# 同種(var, const, let)の変数はまとめて宣言できる
var
  a, b: int  # aとbを同時にint型として宣言、初期値として0が入る
  #c, d = 2, 3 https://gist.github.com/miyakogi/b1df00c8bc99927d9d0d だとできるっぽいことが書いてあるけど、Indentation Errorになる

echo commentize("decleared together")
echo "a: ", a, ", b: ", b
#echo c, d

# テーブル: Pythonで言うところのdict
# https://nim-lang.org/docs/tables.html
import tables

var testTable = {
  "ka": "va",
  "kb": "vb",
  "kc": "vc",
}.toTable

# toTableで生成したテーブルは値渡しになる
var testTable2 = testTable
testTable["ka"] = "va has changed"
echo commentize("Table")
echo "testTable: ",  testTable
echo "testTable2: ", testTable2


# 参照渡しにしたいときはnewTableを使ってTableRefオブジェクトを作る
var testTableRef = {
  "ka": "va",
  "kb": "vb",
  "kc": "vc",
}.newTable
var testTableRef2 = testTableRef
testTableRef["ka"] = "va has changed"
echo commentize("TableRef")
echo "testTableRef: ",  testTableRef
echo "testTableRef2: ", testTableRef2

echo commentize("Table enumeration")
for k,v in testTable:
  echo "k: ", k, " v: ", v

# OrderedTable: 順番が保証される 見てくれが通常のテーブルと変わらなさそうなので割愛

# CountTable: 引数内の要素をカウントしてテーブルにする
let testCountTableStr: string = "Nim is the best programming language."
let testCountTableStrFrequencies = toCountTable(testCountTableStr)
echo commentize("CountTable")
echo testCountTableStrFrequencies

# for i in range(0, 10), 10までいくの地味に注意が必要
echo commentize("for loop: Be careful that 10 is counted.")
for i in 0..10:
  echo i
