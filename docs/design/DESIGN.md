# Design Doc: Aplicativo Multiplataforma (Flutter)

* **Projeto:** Workspace Hub (Web, Desktop & Mobile)
* **Status:** Em Revisão <!-- Draft | Em Revisão | Aprovado -->
* **Autor:** Fabio Fernandes
* **Data:** 2026-10-18

---

## 1. Contexto e Motivação

Um aplicativo multiplataforma deve ser desenvolvido. A versão Web deve usar o WebAssembly. A versão Desktop deve ser nativa para Linux (AppImage, Snap, Flatpak, deb,rpm), macOS (dmg) e Windows (.exe, .msi). A meta é consolidar toda a experiência em uma única base de código Flutter suportando iOS, Android, macOS, Windows e navegadores modernos.

---

## 2. Objetivos e Não-Objetivos

### Objetivos

* **Base Única:** Compartilhar pelo menos 85% do código entre Web, Mobile (iOS/Android) e Desktop (Linux/Windows/macOS).

* **UX Adaptativa:** Renderizar layouts otimizados para toque (mobile) e mouse/teclado (desktop/web), com suporte a atalhos de teclado e janelas redimensionáveis.
* **Roteamento Web-First:** Suportar deep linking, URLs limpas com parâmetros e botão "Voltar" do navegador funcionando de forma transparente.
* **Modo Offline:** Cache local sincronizável em background.

### Não-Objetivos

* Suporte a navegadores legados (ex: Internet Explorer).

* Funcionalidades exclusivas de hardware periférico (como leitores biométricos seriais externos em Desktop).

---

## 3. Padrão Arquitetural

Adotamos a **Clean Architecture modular** combinada com **Feature-First**:

```text
lib/
├── app/                  # Configurações globais, tema, rotas e DI
├── core/                 # Componentes compartilhados, network client, erros
└── features/
    └── task_management/
        ├── data/         # Models, DTOs, DataSources (local/remoto)
        ├── domain/       # Entities, UseCases, Repositories (contratos)
        └── presentation/ # Bloc/Cubit, Widgets, Screens (adaptativas)
