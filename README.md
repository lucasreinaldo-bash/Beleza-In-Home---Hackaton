# Beleza In Home

Aplicativo em desenvolvimento para servir como um marketplace mobile, onde empresas poderão se cadastrar para comercializar seus produtos e serviços com clientes locais.

- O projeto está em andamento e já conta com um protótipo funcional que possui implementações validando e funcionando dos seguintes recursos:
  
  -Geolocalização do usuário recuperada ( mas não é feito o tratamento, nem a inteligência para listar apenas as empresas locais, para fins de monstração utilizei um Carroussel e fiz de algumas loja). Está configurada a API de utilização obtida no Google Cloud Platform
  
  - Google Firebase ( O login é feito através do Firebase Auth, já validado e funcionando . Foi retirado de funcionamento o  formulário de registro do usuário, mas para fins de teste pode usar no e-mail vostorebr@gmail.com e na senha 221295). A longo prazo, cogitamos a possiblidade de migrarmos para um servidor dedicado . O Firebase contém excelentes recursos, mas a nível de Startup sua solução pode encarecer o produto. Todas as interações da loja , a nivel de exemplo, são feitas através da recuperação de informações do Firestore. A atualização ocorre em tempo real devido ao uso de um FutureBuilder . É capaz de alterar o preço do produto mesmo que ele ja tenha sido colocado no carrinho, devido lógica empregada.
  
 - O formulário preenchido pela empresa após a interação com o Button "Quero Vender", também está sendo enviado para o Firebase . Além disso, na opção de compra existe um campo para preenchimento de Cupom de Desconto. Esse cupom é recuperado desse documento do Firestore:
  
<img src="https://uploaddeimagens.com.br/images/002/599/636/full/1.png?1587277266" width="900" height="350"/>


Utilizamos o Diagrama de Casos de Uso abaixo . Ele contem muitas intenções das quais não foram implementadas devido a correria do Hackaton aliada a necessidade da equipe de desenvolvimento se atentar a outros fatores tambem( monetizacao, parte juridica e etc). Acreditamos que podemos concluir o desenvolvimento e coloca-lo em fase beta no período de 30 dias.

O Desenvolvimento foi com a framework Flutter, utilizando a linguagem Java. Optamos por ela em acreditar no seu potêncial de entrega, além grande aumento da produtividade. Produtividade essa proporcionada ao entregar duas saidas do produto: Android e iOS. 

obs: A versão iOS provavalmente não funcionará porquê a configuração do Firebase só foi feita na versão Android.
obs2: Dependendo do dispositivo, poderá apresentar mal exibição do layout . Não fizemos seções de testes envolvendo outros dispositivos.( Build realizada no Samsung Galaxy J5).

Gravei um video utilizando o aplicativo e comentando suas funcionalidades: https://drive.google.com/file/d/1nM5uqSMHzG3jJW1mmoUZ3LR02wqq9DRb/view?usp=sharing

<img src="https://uploaddeimagens.com.br/images/002/599/648/full/UseCase_Diagram0.png?1587279151" width="900" height="600"/>

  
  
  
  
  
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<img src="https://uploaddeimagens.com.br/images/002/599/618/full/mockup2.png?1587275855" width="400" height="700"/>



<img src="https://uploaddeimagens.com.br/images/002/599/620/full/Mockup1.png?1587276018" width="400" height="700"/>

