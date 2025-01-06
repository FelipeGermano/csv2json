# CSV/JSON Converter

Este é um projeto simples desenvolvido com Dart e Flutter para converter arquivos entre os formatos CSV e JSON, além de permitir a manipulação de arquivos locais. O aplicativo fornece uma interface gráfica amigável para essas operações.

## Funcionalidades

- **Conversão CSV para JSON**
  - Cole ou insira o conteúdo CSV em uma caixa de texto e converta-o para JSON.
  - Mensagem de aviso exibida se o CSV estiver vazio ou inválido.

- **Conversão JSON para CSV**
  - Cole ou insira o conteúdo JSON em uma caixa de texto e converta-o para CSV.
  - Mensagem de aviso exibida se o JSON estiver vazio ou inválido.

- **Manipulação de arquivos locais**
  - Abra arquivos CSV e JSON diretamente do sistema de arquivos.
  - Salve os arquivos CSV e JSON no sistema de arquivos.
  - Mensagens de aviso exibidas para erros de leitura/escrita ou se os arquivos não forem encontrados.

- **Limpeza de campos**
  - Limpe o conteúdo das caixas de texto para começar do zero.

## Pré-requisitos

- Flutter SDK instalado.
- Ambiente configurado para desenvolvimento Flutter (Android Studio, Visual Studio Code ou outro editor).

## Como executar

1. Clone este repositório ou copie os arquivos do projeto para seu sistema local.
2. Abra o terminal e navegue até o diretório do projeto.
3. Execute o comando abaixo para instalar as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o aplicativo com o comando:
   ```bash
   flutter run
   ```

## Estrutura do projeto

- **`main.dart`**: Arquivo principal que contém toda a lógica do aplicativo.
- **UI**: Interface gráfica simples para entrada e saída de dados.

## Uso

1. **Conversão de CSV para JSON**:
   - Cole ou insira o conteúdo CSV na caixa de texto superior.
   - Clique no botão "Convert to JSON" para gerar o JSON equivalente.

2. **Conversão de JSON para CSV**:
   - Cole ou insira o conteúdo JSON na caixa de texto inferior.
   - Clique no botão "Convert to CSV" para gerar o CSV equivalente.

3. **Manipulação de arquivos**:
   - Insira o caminho do arquivo CSV/JSON na caixa de texto correspondente.
   - Use os botões "Open CSV/JSON" ou "Save CSV/JSON" para abrir ou salvar arquivos.

4. **Limpeza de campos**:
   - Clique no botão "Clear" para limpar as caixas de texto.

## Mensagens de erro

- "CSV field is empty!": O campo CSV está vazio.
- "Invalid CSV format!": O conteúdo CSV é inválido.
- "JSON field is empty!": O campo JSON está vazio.
- "Invalid JSON format!": O conteúdo JSON é inválido.
- "CSV/JSON file not found!": O arquivo especificado não foi encontrado.
- "Error reading/writing file!": Erro ao ler ou salvar o arquivo.

Se você tiver dúvidas ou sugestões, sinta-se à vontade para contribuir ou relatar problemas. 😊

