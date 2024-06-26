//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by ebonatto-macOS on 08/05/24.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0
    
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    @IBOutlet var botoesRespostas: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configurarQuestao()
    }
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertouResposta = questoes[numeroQuestao].respostaCorreta == sender.tag
        if usuarioAcertouResposta {
            pontuacao += 1
            sender.backgroundColor = UIColor(named: "RespostaCertaColor")
        } else {
            sender.backgroundColor = UIColor(named: "RespostaErradaColor")
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            performSegue(withIdentifier: "telaDesempenhoSegue", sender: nil)
        }
    }
    
    func configurarLayout() {
        
        navigationItem.hidesBackButton = true
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = NSTextAlignment.center
        for botao in botoesRespostas {
            botao.layer.cornerRadius = 12.0
            
        }
    }
    
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(named: "AccentColor")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else {return}
        desempenhoVC.pontuacao = pontuacao
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
