import SwiftUI
import SwiftData
struct ColorComponents: Codable {
    let red: Float
    let green: Float
    let blue: Float
    
    var color: Color {
        Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    static func fromColor(_ color:Color) -> ColorComponents{
        let resolved = color.resolve(in: EnvironmentValues())
        return ColorComponents(
            red: resolved.red,
            green: resolved.green,
            blue: resolved.blue
        )
    }
}

@Model
class Predefinition {
    var products: [Product]
    init(products: [Product]){
        self.products = products
    }
}

@Model
class Product {

    var name: String
    var category: String
    var desc: String
    var rating: String
    var image: String
    var image2: String

    var colorComponent: ColorComponents
    var price: Int
    var marca: String
    
    var group: String?
    
    init(name: String, category: String, desc: String, rating: String, image: String, image2: String, color: Color, price: Int, marca: String) {
        self.name = name
        self.category = category
        self.desc = desc
        self.rating = rating
        self.image = image
        self.image2 = image2
        self.colorComponent = ColorComponents.fromColor(color)
        self.price = price
        self.marca = marca
    }
}
@Model
class Cart {
    var products: [Product]
    var total: Int
    var marca: String
    
    init(products: [Product], total: Int = 0, marca: String) {
        self.products = products
        self.total = total
        self.marca = marca
    }
}
var productList = [
    Product(name: "RTX 4090", category: "GPU", desc:
            "- Gráfico: NVIDIA GeForce RTX 4090 \n- Bus Standard: PCI Express 4.0 \n- OpenGL®4.6 \n- Velocidade de Clock: OC mode: 2550 MHz / Default mode: 2520 MHz (Boost Clock) \n- Núcleos CUDA: 16384 \n- Resolução max.: 7680 x 4320 \n- Suporte Máximo de Tela: 4 \n- Suporte a NVlink/ Crossfire: Não \n- PSU Recomendada: 1000W \n- Conectores de Energia: 1 x 16 pinos \n- Slot: 3.5 \n- AURA Sync: ARGB \n- Dimensões: 357,6 x 149,3 x 70,1 mm \nMemória: \n- 24GB GDDR6X \n- Velocidade: 21 Gbps \n- Interface: 384-bit \n\nAs duas ventoinhas laterais giram no sentido anti-horário para minimizar a turbulência e maximizar a dispersão do ar através do dissipador de calor. Todas as três ventoinhas param quando a temperatura da GPU está abaixo de 50 graus Celsius, permitindo que você jogue games menos exigentes ou execute tarefas leves em relativo silêncio. As ventoinhas ligam novamente quando as temperaturas ultrapassam 55C, referenciando uma curva de velocidade que equilibra desempenho e acústica para trabalho ou lazer.", rating: "", image: "4090", image2: "4090 2", color: .blue, price: 4000, marca: "NVIDIA"),
    Product(name: "Ryzen 7 5700X", category: "CPU", desc: "- Arquitetura: Zen 3'\n- Nº de núcleos de CPU: 8 \n- Multithreading (SMT): sim \n- Nº de threads: 16 \n- Clock Max Boost: Até 4.5GHz \n- Soquete da CPU: AM4 \n- Versão do PCI Express: PCIe 4.0 \n- Tipo de memória: DDR4 \n- Canais de memória: 2 \n- Máx. Memória: 128 GB \n\nQuando você tem a arquitetura de processador mais avançada do mundo para jogadores e criadores de conteúdo, as possibilidades são infinitas. Esteja você jogando os jogos mais recentes, projetando o próximo prédio ou processando dados, você precisa de um processador poderoso que possa lidar com tudo - e muito mais. Sem dúvida, os processadores amd ryzen série 5000 definem o padrão para jogadores e artistas.", rating: "Clientes descrevem o processador como potente e com ótimo custo-benefício, ideal para jogos e aplicações complexas, entregando alta performance e muitos FPS. Apesar do ótimo desempenho, alguns clientes relatam que ele esquenta bastante, necessitando de um sistema de resfriamento eficiente cooler ou water cooler. A maioria dos clientes se diz satisfeita com a compra, afirmando que o produto atendeu às expectativas. \n\nDesempenho Potente \nÓtimo Custo-Benefício \nNecessita de bom resfriamento", image: "ryzen", image2: "ryzen 7 3", color: .blue, price: 1200, marca: "AMD"),
    Product(name: "     Kingston SSD", category: "ARM", desc: "- Formato 2.5 \n- Interface SATA Rev. 3.0 (6Gb/s) – compatibilidade com versões anteriores para SATA Rev. 2.0 (3Gb/s) \n- Capacidade: 960GB \n- Expectativa de vida útil 1 milhão de horas MTBF \n- 960GB — até 500MB/s para leitura e 450MB/s para gravação \n- 0,195W inativo / 0,279W média / 0,642W (MAX) leitura / 1,535W (MAX) gravação \n\nBem mais rápido que um HD comum, fazendo seu computador disparar em velocidade, carregando e abrindo arquivos em bem menos tempo.", rating: "Clientes relatam que o SSD Kingston é rápido e eficiente, melhorando significativamente o desempenho de seus computadores e consoles de jogos. Muitos destacam o ótimo custo-benefício e a facilidade de instalação, embora alguns tenham relatado uma pequena diferença na capacidade de armazenamento real em relação ao anunciado. A qualidade do produto é amplamente elogiada, com muitos clientes considerando a Kingston uma marca confiável. Apesar de alguns problemas pontuais na entrega e instalação, a maioria dos clientes recomendaria o produto. \n\nÓtimo custo-benefício \nVelocidade e eficiência \nQualidade Kingston", image: "kingston", image2: "kingston 2", color: .blue, price: 377, marca: "Kingston"),
    Product(name: "    Corsair 550w", category: "PSU", desc: "- Entrada CA: 100V c.a.-240V c.a. \n- Corrente de Entrada: 10A-5A \n- Frequência: 47~63Hz \n- +5V: Carga máx. 20 A | Saída Máx. 120W \n- +3,3V: Carga máx. 24A | Saída Máx. 120W \n- +12V: Carga máx. 44A | Saída Máx. 528W \n- -12V: Carga máx. 0,3A | Saída Máx. 3,6W \n- +5Vsb: Carga máx. 3A | Saída Máx. 15W \n- Potência Total: 550W \n\nAs fontes de alimentação CORSAIR CX têm a certificação 80 PLUS Bronze, fornecendo até 88% de eficiência operacional para garantir menos calor e um menor consumo de energia, ideal para aquele que procuram um melhor desempenho, sobretudo em jogos.", rating: "", image: "corsair", image2: "corsair 3", color: .blue, price: 411, marca: "Corsair"),
    Product(name: "Air Cooler Rise Mode", category: "Cooler", desc: "- Intel: 775/1150/1151/1155/1156/1366 / 1200 / 1700. \n- AMD: AM4/AM2/AM2+/AM3/AM3+/FM1/FM2 / AM5. \n- TDP: 200w. \n- Tamanho do Fan: 120 x 120 x 25 mm x2 \n- Velocidade do Fan: 1500 RPM \n- Cor do Led: ARGB 5v 3p Digital Motherboard \n- Conector: 4pin PWM \n- Tipo de rolamento: Rolamento hidráulico \n- Tensão: 12v \n- Ruído do Fan: 26±3dB(A) \n- Fluxo de ar: 60 CFM ± 10% \n- Heat Pipe: 6 \n- Vida útil do Fan: 80000 Horas \n\nAlto fluxo de ar com um baixo nível de ruido. Ótimo desempenho contando com duplo fans de 120mm para refrigeração do dissipador.", rating: "Os clientes elogiaram o desempenho de resfriamento do cooler, notando uma significativa redução na temperatura do processador. Muitos destacaram o bom custo-benefício e o design visual atrativo, incluindo a iluminação LED. Entretanto, alguns clientes relataram problemas de compatibilidade com determinadas placas-mãe e dificuldades na instalação, principalmente em gabinetes com pouco espaço. \n\nResfriamento eficiente \nÓtimo custo-benefício \nProblemas de compatibilidade", image: "cooler", image2: "cooler 22", color: .blue, price: 140, marca: "Rise Mode"),
    Product(name: "ASRock B450M", category: "PlacaMãe", desc: "- ASRock USB 3.1 Gen2 \n- Porta tipo ASRock USB 3.1 Gen2 (10 Gb / s) \n- Porta ASRock USB 3.1 Gen2 tipo C (10 Gb / s) \n- ASRock Liga Super \n- Dissipador de calor em liga de alumínio XXL \n- Acoplador de potência 60A Premium \n- Nichicon 12K bonés pretos (100% Japão fez capacitores de polímeros condutores de alta qualidade) \n- I / O Armadura \n- Sapphire PCB preto \n- High Density tecido vidro PCB \n- 2 onces de cobre PCB \n- Slot ASRock Aço \n- ASRock Ultra M2 (PCIe Gen3 x4) \n- ASRock pico total de Protecção ( para todas as portas USB, de áudio, LAN) \n- ASRock Live Update e APP Shop \n- AMD StoreMI \n- Soquete AMD AM4  \n- Design Digi Power \n- 6 design de fase de energia \n- TDP: 105W \n- CPUs da série AMD Ryzen (Summit Ridge e Pinnacle Ridge)  \n- 1 x Slot PCI Express 3.0 x16 (modo PCIE2: x16) * \n- 1 x Slot PCI Express 2.0 x16 (PCIE3: modo x4) \n- CPUs AMD Ryzen (Raven Ridge) \n- 1 x Slot PCI Express 3.0 x16 (modo PCIE2: x8) (Se você usar o APU série Athlon 2xxGE, o slot PCIE2 funcionará no modo x4). \n- 1 x slot PCI Express 2.0 x16 (PCIE3: modo x4) \n- CPUs AMD Athlon série \n- 1 x Slot PCI Express 3.0 x16 (modo PCIE2: x4) * \n- 1 x Slot PCI Express 2.0 x16 (PCIE3: modo x4) \n- 1 x Slot PCI Express 2.0 x1 \n- Suporta AMD Quad CrossFireX e CrossFireX \n- Suporta NVMe SSD como discos de inicialização \n\nPlaca-mãe ASRock B450M Steel Legend AMD DDR4 Resistente como aço, verdadeira lenda a Steel Legend representa o estado filosófico da sólida durabilidade e irresistível estética. Construída ao redor das especificações e recursos mais exigentes, a série Steel Legend visa os usuários do dia a dia e entusiastas mainstream!Oferecendo uma forte gama de materiais/componentes para assegurar um desempenho estável e confiável.", rating: "A maioria dos clientes relatou satisfação com a placa-mãe, destacando seu excelente custo-benefício, design bonito e bom desempenho, mesmo após anos de uso. Muitos elogiaram a facilidade de uso da BIOS e a compatibilidade com diversos componentes. Entretanto, alguns clientes relataram problemas com compatibilidade de alguns SSDs NVMe e o software de controle de LEDs, além de alguns casos isolados de placas recebidas com defeito ou problemas de compatibilidade com processadores Ryzen de geração mais recente que exigiram atualização de BIOS. \n\nCusto-benefício excelente \nDesign bonito \nProblemas de compatibilidade", image: "asrock", image2: "asrock 33", color: .blue, price: 760, marca: "ASRock"),
    Product(name: "Kingston Fury Beast", category: "RAM", desc: "- Dissipador de calor de perfil baixo \n- Upgrade de alta performance \n- Intel XMP-ready \n- Pronto para AMD Ryzen \n- Fator de forma: DDR4 \n- Velocidades*: 3200 MHz \n- Latências: CL16 \n- Capacidades: 8GB \n\nA memória Kingston FURY Beast DDR4 proporciona um poderoso aumento de performance para jogos, edição de vídeo e renderização. Ela faz o overclock automático para a especificação de maior performance do módulo que seja suportada pelo sistema* e está pronta para Intel XMP e AMD Ryzen. Com o seu dissipador de calor de perfil baixo, a memória FURY Beast DDR4 permanece fria e pronta para o seu game.", rating: "A maioria dos clientes relatou satisfação com o desempenho e a qualidade da memória RAM Kingston Fury Beast, destacando o bom custo-benefício e a facilidade de instalação e configuração. Muitos clientes mencionaram a melhoria significativa no desempenho do computador após a instalação, especialmente com a ativação do modo dual-channel. Apesar da grande maioria das avaliações positivas, alguns clientes relataram problemas como incompatibilidade de velocidade com algumas placas-mães, necessitando ajuste manual, e alguns casos pontuais de produtos recebidos com defeito. \n\nBom custo-benefício Desempenho excelente \nFácil instalação Qualidade superior \nDual Channel Melhoria no desempenho", image: "fury", image2: "fury 2", color: .blue, price: 150, marca: "Kingston"),
    Product(name: "Rise Mode Wave Black", category: "Gabinete", desc: "- Cor: Preto \n- Dimensões (L x W x H): L 360mm x W 200mm x H 456mm \n- Fans: Suporte para 6 fans (3 fans ARGB inclusos) \n- Baias: 3.5” HDD (x2) | 2.5” SSD (x3) \n- Slots de Expansão: 7 \n- Placa-Mãe: ATX / M-ATX / ITX \n- Frontal I/O: x1 USB 2.0 | x1 USB 3.0 HD Áudio Entrada e Saída \n- Lateral Vidro Temperado Fumê \n\nMergulhe na onda da alta performance com o Gabinete Gamer Rise Mode Wave Black ARGB. Este Mid Tower ATX oferece um design arrojado e funcionalidades para gamers que não abrem mão de estilo e potência.", rating: "", image: "wave black bg", image2: "wave black 2", color: .blue, price: 250, marca: "Rise Mode")
    
    ]

