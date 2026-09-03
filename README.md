# Gabriel AI DevKit

Uma biblioteca portátil de Agent Skills para Claude Code e Codex, voltada a
raciocínio, backend, Python, Vue, UI/UX, QA, AppSec e experiências gamificadas.

O repositório contém 32 skills independentes. Cada uma possui um `SKILL.md`
compatível com o padrão aberto Agent Skills. O conteúdo foi escrito para este
DevKit; os arquivos não são cópias dos projetos que inspiraram o catálogo.

## Instalação rápida no Windows

Abra o PowerShell dentro da pasta do repositório:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\install.ps1
```

Por padrão, o instalador cria junctions para a mesma fonte:

- Codex: `%USERPROFILE%\.agents\skills`
- Claude Code: `%USERPROFILE%\.claude\skills`

Nada existente é removido ou sobrescrito. Em caso de conflito, a skill é
ignorada e o instalador mostra o caminho conflitante.

Para instalar somente em um agente:

```powershell
.\scripts\install.ps1 -Target codex
.\scripts\install.ps1 -Target claude
```

Para copiar os arquivos em vez de criar junctions:

```powershell
.\scripts\install.ps1 -Mode copy
```

Para instalar também as instruções globais, apenas se os arquivos ainda não
existirem:

```powershell
.\scripts\install.ps1 -InstallGlobalInstructions
```

## Linux e macOS

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

Opções:

```bash
./scripts/install.sh --target codex
./scripts/install.sh --target claude
./scripts/install.sh --mode copy
./scripts/install.sh --global-instructions
```

Para testes ou uma home personalizada, ambos os instaladores aceitam
`-UserRoot <caminho>` no PowerShell ou `--user-root <caminho>` no shell.

## Atualização em outro computador

Use este repositório como fonte central. Depois de publicar em um Git remoto:

```powershell
git pull --ff-only
.\scripts\install.ps1
```

Junctions e symlinks refletem as atualizações imediatamente. No modo `copy`,
rode novamente o instalador com `-RefreshCopies` ou `--refresh-copies`.

## Publicar como repositório privado

O pacote entregue já pode ser versionado. Se ele não contiver metadados Git após
ser extraído, inicialize-o e publique com GitHub CLI:

```powershell
git init -b main
git add .
git commit -m "feat: create Gabriel AI DevKit"
gh repo create gabriel-ai-devkit --private --source . --remote origin --push
```

Confira sua identidade com `git config user.name` e `git config user.email`
antes do primeiro commit. O DevKit não inventa esses dados por você.

## Uso

No Codex, use `/skills` ou mencione uma skill com `$nome-da-skill`. No Claude
Code, use `/skills` ou `/nome-da-skill`. A descrição de cada skill permite que
os agentes também a selecionem automaticamente quando a tarefa combina.

Skills não são memória permanente. O agente recebe inicialmente o nome e a
descrição e carrega o corpo completo quando necessário. Regras que precisam
valer em toda sessão pertencem aos arquivos de `config/`.

## Catálogo

| Área | Skills |
| --- | --- |
| Reasoning | `brainstorming`, `systematic-debugging`, `writing-plans`, `property-based-testing` |
| Backend / Logic | `audit-context-building`, `modern-python`, `sharp-edges`, `postgres-best-practices` |
| Vue | `vue`, `vue-data`, `vue-forms`, `vue-performance`, `vue-a11y`, `vue-clean-components` |
| Design | `frontend-design`, `frontend-app-builder`, `product-design`, `audit`, `design-qa` |
| QA | `webapp-testing`, `frontend-testing-debugging`, `playwright` |
| Security | `security-guidance`, `claude-security`, `codex-security`, `static-analysis`, `differential-review`, `variant-analysis`, `supply-chain-risk-auditor` |
| Game / Experience | `game-ui-frontend`, `game-playtest`, `product-gamification` |

## Skills adaptadoras

`claude-security`, `codex-security` e `security-guidance` não redistribuem
plugins oficiais. Elas definem um workflow portátil e orientam o agente a usar
a integração nativa correspondente quando estiver instalada. Sem integração,
executam uma revisão local dentro das ferramentas disponíveis.

Plugins do Codex não estão disponíveis atualmente na extensão de IDE. As
skills locais deste repositório continuam disponíveis nela.

## Segurança

- Leia qualquer `SKILL.md` antes de instalar alterações de terceiros.
- O instalador não executa scripts contidos nas skills.
- Nenhuma skill autoriza testes contra sistemas sem permissão.
- Operações destrutivas, produção e correções automáticas exigem confirmação.
- Scans automatizados apoiam uma revisão; não provam ausência de falhas.

## Validação

```powershell
python .\scripts\validate_skills.py
```

ou:

```bash
python3 scripts/validate_skills.py
```

O workflow incluído executa a mesma validação a cada push e pull request.

## Estrutura

```text
gabriel-ai-devkit/
├── config/              instruções globais opcionais
├── docs/                arquitetura, compatibilidade e manutenção
├── scripts/             instalação e validação
└── skills/              biblioteca compartilhada
```

## Licença

MIT. Consulte também [docs/upstream-and-attribution.md](docs/upstream-and-attribution.md).
