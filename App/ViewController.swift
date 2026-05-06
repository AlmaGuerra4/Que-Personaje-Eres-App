import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var preguntaLabel: UILabel!
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var boton2: UIButton!
    @IBOutlet weak var boton3: UIButton!
    @IBOutlet weak var boton4: UIButton!

    struct Pregunta {
        let texto: String
        let opciones: [String]
        let puntajes: [[String: Int]]
    }

    let preguntas: [Pregunta] = [
        Pregunta(
            texto: "¿Qué cualidad te define más?",
            opciones: ["Inteligencia", "Justicia", "Responsabilidad", "Observación"],
            puntajes: [
                ["Tony Stark": 2],
                ["Batman": 2],
                ["Spider-Man": 2],
                ["Sherlock Holmes": 2]
            ]
        ),
        Pregunta(
            texto: "¿Cómo enfrentas los problemas?",
            opciones: ["Con tecnología", "Con estrategia", "Improvisando", "Analizando"],
            puntajes: [
                ["Tony Stark": 2],
                ["Batman": 2],
                ["Spider-Man": 2],
                ["Sherlock Holmes": 2]
            ]
        ),
        Pregunta(
            texto: "¿Qué te motiva?",
            opciones: ["Innovar", "Proteger", "Ayudar", "Resolver misterios"],
            puntajes: [
                ["Tony Stark": 2],
                ["Batman": 2],
                ["Spider-Man": 2],
                ["Sherlock Holmes": 2]
            ]
        ),
        Pregunta(
            texto: "Elige un entorno",
            opciones: ["Laboratorio", "Ciudad oscura", "Escuela", "Oficina"],
            puntajes: [
                ["Tony Stark": 2],
                ["Batman": 2],
                ["Spider-Man": 2],
                ["Sherlock Holmes": 2]
            ]
        ),
        Pregunta(
            texto: "¿Qué prefieres?",
            opciones: ["Crear", "Vengar", "Salvar", "Investigar"],
            puntajes: [
                ["Tony Stark": 2],
                ["Batman": 2],
                ["Spider-Man": 2],
                ["Sherlock Holmes": 2]
            ]
        )
    ]

    var indicePregunta = 0
    var resultados: [String: Int] = [:]

    let descripciones: [String: String] = [
        "Tony Stark": "Eres un genio innovador, creativo y líder natural. Siempre buscas soluciones tecnológicas.",
        "Batman": "Eres estratégico, disciplinado y luchas por la justicia sin rendirte.",
        "Spider-Man": "Eres responsable, valiente y siempre ayudas a los demás.",
        "Sherlock Holmes": "Eres analítico, observador y destacas resolviendo problemas complejos."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarPregunta()
    }

    func mostrarPregunta() {
        let pregunta = preguntas[indicePregunta]

        preguntaLabel.text = pregunta.texto

        boton1.setTitle(pregunta.opciones[0], for: .normal)
        boton2.setTitle(pregunta.opciones[1], for: .normal)
        boton3.setTitle(pregunta.opciones[2], for: .normal)
        boton4.setTitle(pregunta.opciones[3], for: .normal)
    }

    func procesarRespuesta(opcion: Int) {
        let pregunta = preguntas[indicePregunta]

        let puntajeSeleccionado = pregunta.puntajes[opcion]

        for (personaje, puntos) in puntajeSeleccionado {
            resultados[personaje, default: 0] += puntos
        }

        indicePregunta += 1

        if indicePregunta < preguntas.count {
            mostrarPregunta()
        } else {
            mostrarResultado()
        }
    }

    func mostrarResultado() {
        let personajeFinal = resultados.max { $0.value < $1.value }?.key ?? "Desconocido"
        let descripcion = descripciones[personajeFinal] ?? ""

        preguntaLabel.text = "Eres: \(personajeFinal)\n\n\(descripcion)"

        boton1.isHidden = true
        boton2.isHidden = true
        boton3.isHidden = true
        boton4.isHidden = true
    }

    @IBAction func responder1(_ sender: UIButton) {
        procesarRespuesta(opcion: 0)
    }

    @IBAction func responder2(_ sender: UIButton) {
        procesarRespuesta(opcion: 1)
    }

    @IBAction func responder3(_ sender: UIButton) {
        procesarRespuesta(opcion: 2)
    }

    @IBAction func responder4(_ sender: UIButton) {
        procesarRespuesta(opcion: 3)
    }
}
