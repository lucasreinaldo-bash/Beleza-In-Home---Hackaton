# Beleza In Home

Aplicativo em desenvolvimento para servir como um marketplace mobile, onde empresas poderão se cadastrar para comercializar seus produtos e serviços com clientes locais.

- O projeto não está pronto , mas possui implementações validando e funcionando dos seguintes recursos:
  
  -Geolocalização do usuário recuperada ( mas não é feito o tratamento, nem a inteligência para listar apenas as empresas locais, para fins de monstração utilizei um Carroussel e fiz de algumas loja). Está configurada a API de utilização obtida no Google Cloud Platform
  
  - Google Firebase ( O login é feito através do Firebase Auth, já validado e funcionando . Foi retirado de funcionamento o  formulário de registro do usuário, mas para fins de teste pode usar no e-mail vostorebr@gmail.com e na senha 221295). A longo prazo, cogitamos a possiblidade de migrarmos para um servidor dedicado . O Firebase contém excelentes recursos, mas a nível de Startup sua solução pode encarecer o produto. Todas as interações da loja , a nivel de exemplo, são feitas através da recuperação de informações do Firestore. A atualização ocorre em tempo real devido ao uso de um FutureBuilder . É capaz de alterar o preço do produto mesmo que ele ja tenha sido colocado no carrinho, devido lógica empregada.
  
 - O formulário preenchido pela empresa após a interação com o Button "Quero Vender", também está sendo enviado para o Firebase . Além disso, na opção de compra existe um campo para preenchimento de Cupom de Desconto
  
  
  
  
  
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

