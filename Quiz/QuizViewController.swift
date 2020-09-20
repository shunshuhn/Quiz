//
//  QuizViewController.swift
//  Quiz
//
//  Created by 伊藤　陽香 on 2020/09/20.
//  Copyright © 2020 伊藤　陽香. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数を数えるための変数
    var correctAnswer: Int = 0
    
    //クイズを表示するテキストビュー
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //quizArrayに問題文、選択肢、答えの番号が入った配列を追加
        quizArray.append(["622年、ムハンマドがクライシュ族から迫害を受け、本拠地をメッカからメディナへ移したことをなんという？","シャーリア","ヒジュラ","ウマル",2])
        quizArray.append(["唐の時代の玄宗の政治は、律令制度の元で、民政安定策などが行われ、「開元の治」と称えられました。これは、誰の政治をお手本にしていると言われているでしょうか？","太宗","則天武后","武帝",1])
        quizArray.append(["392年にキリスト教を国教としたローマ帝国の皇帝は誰？","コンスタンティウス","ディオクレティアヌス","テオドシウス",3])
        quizArray.append(["ルネサンスの三大発明の一つである、活版印刷術を発明したのは？","ラファエロ","マキャベリ","ヨハネスグーテンベルク",3])
        quizArray.append(["「鉄血政治で知られるビスマルクが、1887年に結んだ、ロシアとの秘密軍事条約は何？」","ベルリン条約","再保障条約","アミアンの和約",2])
        quizArray.append(["第二次世界対戦中に刊行された小説、「異邦人」を記したのは誰？","カミュ","トルストイ","ドストエフスキー",1])
        
        //問題文をシャッフル
        quizArray.shuffle()
        
        choiceQuiz()
        
        
    }
    
    
    func choiceQuiz() {
        
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
        
        
        
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
        
    }
    
    //セグエを準備する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
        
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        //引数のsender.tagに格納されているTagの値を使って処理を区別する
        
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            
            correctAnswer = correctAnswer + 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        }else{
            choiceQuiz()
        }
        
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
