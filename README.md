# dotfiles

## v3

Конфиги раскладываются симлинками через [GNU Stow](https://www.gnu.org/software/stow/):
структура репозитория повторяет структуру `$HOME`.

| Путь | Что это |
| --- | --- |
| `.zshrc` | zsh + oh-my-zsh, atuin, fzf |
| `.tmux.conf` | tmux |
| `.config/kitty/` | терминал |
| `.config/scripts/` | `tmux-sessionizer`, `fzf-notes`, `fzf-ssh` |
| `.config/nvim/` | **submodule** → [van9md/kickstart.nvim](https://github.com/van9md/kickstart.nvim) |

## Установка на новой машине

```sh
git clone --recurse-submodules git@github.com:van9md/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

Если склонировал без `--recurse-submodules`, папка `.config/nvim` будет пустой — дотяни:

```sh
git submodule update --init
```

Затем один раз настрой git в этом репозитории (это локальный конфиг, он не версионируется,
поэтому его надо повторять на каждой машине):

```sh
git config push.recurseSubmodules on-demand   # не даст запушить указатель на неотправленный коммит
git config submodule.recurse true             # pull/checkout подтягивают и nvim
git config status.submodulesummary 1          # status показывает, что изменилось внутри nvim
git config diff.submodule log                 # diff показывает коммиты, а не голый SHA
```

## Как коммитить

Обычные конфиги — как всегда:

```sh
git add .zshrc
git commit -m "chore(zsh): add foo alias"
git push
```

**Конфиг nvim — в два захода**, потому что это отдельный репозиторий. Родительский
`dotfiles` хранит не файлы, а указатель на конкретный коммит в форке kickstart, поэтому
одного коммита никогда не достаточно:

```sh
# 1) сам конфиг — внутри submodule
cd ~/.config/nvim
git add -A
git commit -m "feat: add rust lsp"

# 2) сдвинувшийся указатель — в dotfiles
cd ~/dotfiles
git add .config/nvim
git commit -m "chore(nvim): bump submodule"
git push          # с push.recurseSubmodules=on-demand форк запушится автоматически
```

Забыть шаг 2 не страшно — `git status` в `dotfiles` покажет `modified: .config/nvim (new commits)`.
А вот забыть запушить форк было бы больно (на другой машине submodule не развернулся бы) —
именно это и закрывает `push.recurseSubmodules=on-demand`.

### Формат сообщений

[Conventional Commits](https://www.conventionalcommits.org/): `feat:`, `fix:`, `chore:`,
`docs:`, `refactor:`. Скоуп — по имени конфига: `chore(zsh):`, `feat(nvim):`, `fix(tmux):`.

## Обновить kickstart из upstream

```sh
cd ~/.config/nvim
git remote add upstream https://github.com/nvim-lua/kickstart.nvim.git   # один раз
git fetch upstream
git merge upstream/master
cd ~/dotfiles && git add .config/nvim && git commit -m "chore(nvim): merge upstream kickstart"
```

## Старый конфиг nvim

До перехода на kickstart был свой конфиг на lazy.nvim (`lua/config/*`). Он остался в истории:

```sh
git show 90ca255:.config/nvim/init.lua
git checkout 90ca255 -- .config/nvim        # если понадобится целиком
```
