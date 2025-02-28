import SwiftUI
import SwiftData
import Foundation

struct Settings: View {
    @Environment(\.modelContext) var modelContext
    @Query var predefinitions: [Predefinition]
    
    var body: some View {
        NavigationView {
            
            List {
                NavigationLink {
                    HStack {
                        Image("dava")
                            .resizable()
                            .cornerRadius(.infinity)
                            .frame(width:125,height:125)
                            .clipped()
                            .position(x:75,y:100)
                        
                        Spacer()
                        
                        Text("Elimar González\n @davajonas")
                            .bold()
                            .position(x:30,y:100)
                        
                        Divider()
                        
                        
                    }
                    
                    ScrollView {
                        VStack (alignment: .leading){
                            
                            Divider()
                            Text("Fan número um de Resident Evil. Adoro fingir que me especializei em jogos que nunca joguei enquanto alimento o meu próprio ego e choro com piadinhas. \n\nMinhas redes sociais (siga-me apenas se for um pupilo meu):")
                                .multilineTextAlignment(.center)

                            HStack {
                                
                            }
                            .frame(height:5)
                            
                        }
                        
                        Link("Youtube \n", destination: URL(string: "https://youtube.com/@davajonas?si=SQ1ykttumSpxIDBZ")!)
                            .bold()
                        
                        Link("Instagram \n", destination: URL(string: "https://www.instagram.com/odavyjones/?hl=pt-br")!)
                            .bold()
                        
                        Link("X \n", destination: URL(string: "https://x.com/davyjonesrj")!)
                            .bold()
                        Divider()
                    
                        NavigationView {
                            List {
                                NavigationLink {
                                    List {
                                        ForEach(Array(predefinitions.enumerated()), id: \.offset) { index, predefinition in
                                            Text("Predefinição \(index+1)")
                                            ForEach(predefinition.products, id: \.self) { product in
                                                CartProductCard(product: product, deletável: false)
                                            }
                                        }
                                        .onDelete { indices in
                                            for indice in indices {
                                              modelContext.delete(predefinitions[indice])
                                                
                                            }
                                        }
                                    }.listStyle(.plain)
                                    
                                    } label: {
                                        Text("Predefinições")
                                    }
                                    NavigationLink {
                                        Text("BRKSedu\nPhoenix\nCross\nPatriota")
                                            .position(x:50,y:70)
                                    } label: {
                                        Text("Seguindo")
                                    }
                                    NavigationLink {
                                        Text("BRKSedu\nPhoenix\nCross\nPatriota")
                                            .position(x:50,y:70)
                                    } label: {
                                        Text("Seguidores")
                                    }
                            }
                        }
                            
                    }
                    .padding(10)
                    .position(x:217,y:350)
                    .frame(height: 600)
                        
                    
                    } label: {
                        Text("Conta")
                        Image(systemName: "person.fill")
                    }
                    
                    NavigationLink {
                        Text("Política de Privacidade")
                            .bold()
                            .font(.system(size:25))
                        
                        ScrollView {
                            VStack (alignment: .leading){
                                
                                Text("**Política de Privacidade da Beeware** \n**Última Atualização: 26/02/2025** \n\nA Beeware valoriza sua privacidade e está comprometida em proteger seus dados pessoais. Esta Política de Privacidade explica como coletamos, usamos, armazenamos e protegemos suas informações ao utilizar nossos serviços e plataformas. \n\n**1. Informações Coletadas** \nAo utilizar nossos serviços, podemos coletar diferentes tipos de informações, incluindo: \n- **Dados pessoais**: Nome, e-mail, telefone, endereço e outras informações que você nos fornece voluntariamente. \n- **Dados de navegação**: Endereço IP, tipo de dispositivo, navegador, páginas acessadas e tempo de permanência. \n- **Cookies e tecnologias similares**: Utilizamos cookies para melhorar sua experiência e analisar o uso de nossa plataforma. \n\n**2. Uso das Informações** \nUtilizamos as informações coletadas para: \n- Fornecer, operar e melhorar nossos serviços. \n- Personalizar sua experiência e oferecer suporte ao cliente. \n- Enviar comunicações sobre nossos produtos, serviços e atualizações. \n- Garantir a segurança e prevenir fraudes. \n- Cumprir obrigações legais e regulatórias. \n\n**3. Compartilhamento de Dados** \n\nA Beeware não vende ou compartilha seus dados pessoais com terceiros, exceto: \n- Quando necessário para fornecer nossos serviços (ex.: provedores de hospedagem, pagamento e suporte técnico). \n- Para cumprir exigências legais ou regulatórias. \n- Com seu consentimento explícito. \n\n**4. Armazenamento e Segurança** \n\nAdotamos medidas técnicas e organizacionais para proteger seus dados contra acessos não autorizados, perda ou alteração. Seus dados serão armazenados pelo tempo necessário para cumprir os propósitos mencionados nesta política, a menos que seja exigido de outra forma por lei. \n\n**5. Seus Direitos** \n\nVocê tem direitos sobre seus dados pessoais, incluindo: \n- Acessar, corrigir ou excluir suas informações. \n- Solicitar a portabilidade dos dados. \n- Restringir ou se opor ao processamento de suas informações. \n- Revogar seu consentimento quando aplicável. \n\nPara exercer seus direitos, entre em contato pelo e-mail: **[email@beeware.com]**.  \n\n**6. Alterações nesta Política** \n\nPodemos atualizar esta Política de Privacidade periodicamente. Notificaremos você sobre mudanças significativas por meio de nossos canais oficiais. Recomendamos que revise esta política regularmente. \n\n**7. Contato** \n\nSe tiver qualquer dúvida sobre esta Política de Privacidade, entre em contato conosco: \nBeeware Tecnologia Ltda. \nEndereço: [Endereço Completo] \nE-mail: [email@beeware.com] \nTelefone: [Número de Telefone] \n\n**Beeware - Tecnologia para um futuro seguro.**")
                                
                                HStack {
                                    
                                }
                                .frame(height:200)
                                
                            }
                        }
                        .padding(10)
                        .position(x:215,y:375)
                        .frame(height: 600)
                    } label: {
                        Text("Política de privacidade")
                        Image(systemName: "lock.fill")
                    }
                    
                    NavigationLink {
                        Text("Sobre nós - Beeware")
                            .bold()
                            .font(.system(size:25))
                        
                        ScrollView {
                            VStack (alignment: .leading){
                                
                                Text("Beeware – Tecnologia Descomplicada para Todos \n\nA Beeware é uma empresa de tecnologia focada em tornar o mundo dos computadores acessível para todos, independentemente do nível de conhecimento. Nossa missão é informar e educar pessoas leigas sobre hardware, ajudando a entender os componentes, suas funções e como escolher as melhores peças para cada necessidade. \n\nCom análises detalhadas, comparações de preços e recomendações confiáveis, indicamos os melhores produtos e lojas para garantir que nossos clientes façam compras inteligentes e bem informadas. Seja para montar um PC do zero, atualizar um sistema antigo ou simplesmente entender mais sobre tecnologia, a Beeware está aqui para guiar você de forma clara, objetiva e sem complicações.")
                                
                                HStack {
                                    
                                }
                                .frame(height:200)
                                
                            }
                        }
                        .padding(10)
                        .position(x:215,y:375)
                        .frame(height: 600)
                    } label: {
                        Text("Sobre nós")
                        Image(systemName: "building.2.crop.circle.fill")
                    }
                    
                    NavigationLink {
                        Text("Contribua com o nosso projeto")
                            .bold()
                            .font(.system(size:25))
                        
                        ScrollView {
                            VStack (alignment: .leading){
                                
                                Text("Acesse o QRCode abaixo para doação: ")
                                
                                HStack {
                                    
                                }
                                .frame(height:200)
                                
                                Image("qr.png")
                                    .resizable()
                                    .frame(width:300,height:300)
                                    .padding(.vertical,-130)
                            }
                        }
                        .padding(10)
                        .position(x:215,y:375)
                        .frame(height: 600)
                    } label: {
                        Text("Contribua")
                        Image(systemName: "briefcase.circle.fill")
                    }
                }
                .navigationTitle("Configurações")
                
                
            }
        }
    }

    
struct Settings_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
    
    

