# Testes Automatizados com Robot Framework e Browser Library

Este projeto contém testes automatizados utilizando o [Robot Framework](https://robotframework.org/)
com a [Browser Library](https://github.com/MarketSquare/robotframework-browser), com foco em automações de 
interface gráfica com páginas web como **Google** e componentes da **JQuery UI**.

## 📦 Estrutura do Projeto

.
├── google_resource.robot
├── google_teste.robot
├── JQueryUI_resouce.robot
└── JQueryUI_teste.robot


- `*_resource.robot`: Contém as keywords customizadas e configurações reutilizáveis.
- `*_teste.robot`: Contém os casos de teste propriamente ditos.

## 🚀 Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [Browser Library](https://github.com/MarketSquare/robotframework-browser)
- Python 3.7+
- Node.js (necessário para a Browser Library)
- VS Code ou qualquer editor de texto compatível

## 🧪 Casos de Teste Implementados

### Google
- Acessar o Google
- Realizar uma busca por termo específico
- Verificar se o resultado contém o termo buscado

### JQuery UI
- Acessar página de demonstração do JQuery UI
- Interagir com componentes como sliders, drag and drop e outros widgets
- Verificar comportamento esperado após interações

## 🔧 Pré-requisitos

Certifique-se de ter instalado:

- Python 3.7 ou superior
- Node.js
- Robot Framework e Browser Library:

📄 Licença
Este projeto é de livre uso para fins educacionais e profissionais.








