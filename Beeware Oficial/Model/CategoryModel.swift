import SwiftUI
        
        struct CategoryModel: Identifiable, Hashable {
            var id: UUID = .init()
            var title: String
            var desc: String
        }
    
        var categoryList: [CategoryModel] = [
            CategoryModel(title:"Todos",desc: ""),
            CategoryModel(title:"CPU",desc: "O processador é responsável pelo processamento de dados e execução de instruções na máquina. Características incluem número de núcleos, onde são dividas suas threads (tarefas/processos), frequência (GHz) e cache."),
            CategoryModel(title:"GPU", desc:"A placa de vídeo processa gráficos e imagens essenciais para jogos, edição e renderização. Pode ser integrada (compartilhada com a CPU) ou dedicada (mais potente)."),
            CategoryModel(title:"RAM", desc:" A memória RAM armazena dados temporários para acesso rápido pelo processador. Mede-se em GB e sua velocidade influencia o desempenho geral do sistema."),
            CategoryModel(title:"Gabinete", desc: "O gabinete é uma estrutura que abriga e protege os componentes do PC. Pode variar em tamanho (ATX, Micro-ATX, Mini-ITX) e oferece suporte para ventilação e organização dos cabos."),
            CategoryModel(title:"Cooler", desc:"O cooler faz o papel fundamental da refrigeração dos componentes, dissipando o calor gerado. Pode ser a ar (ventoinhas e dissipadores) ou líquida (water cooler), essencial para manter temperaturas seguras."),
            CategoryModel(title:"PSU", desc:"A fonte é o que dá vida ao PC, convertendo energia da tomada para os componentes. Características importantes incluem potência (W), eficiência (80 Plus) e conexões disponíveis."),
            CategoryModel(title:"PlacaMãe", desc:"A placa-mãe é o circuito principal que conecta e gerencia todos os componentes. Possui soquete para processador, slots de RAM, conexões para armazenamento e portas de expansão (PCIe, USB, etc.)."),
            CategoryModel(title:"ARM", desc:" O armazenamento guarda os dados do sistema operacional. HDDs oferecem maior capacidade por menor custo, enquanto SSDs são mais rápidos e eficientes.")
        ]

enum FilterCategory: String, CaseIterable{
    case Todos, CPU, GPU, RAM, ARM, Gabinete, Cooler, PSU, PlacaMãe
    
    func getImage() -> String? {
        return nil
    }
    
    func getOptions() -> [Product] {
        switch self {
        case .Todos:
            return productList
        case .CPU:
            return productList.filter { product in
                product.category == "CPU"
            }
        case .GPU:
            return productList.filter { product in
                product.category == "GPU"
            }
        case .ARM:
            return productList.filter { product in
                product.category == "ARM"
            }
        case .PSU:
            return productList.filter { product in
                product.category == "PSU"
            }
        case .RAM:
            return productList.filter { product in
                product.category == "RAM"
            }
        case .Gabinete:
            return productList.filter { product in
                product.category == "Gabinete"
            }
        case .Cooler:
            return productList.filter { product in
                product.category == "Cooler"
            }
        case .PlacaMãe:
            return productList.filter { product in
                product.category == "PlacaMãe"
            }
        }
    }
        
}

