# dotfiles

## v3

Раскладывается симлинками через [GNU Stow](https://www.gnu.org/software/stow/),
структура репозитория повторяет `$HOME`.

| Путь | Что это |
| --- | --- |
| `.zshrc` | zsh без фреймворка, atuin, плагины из `~/.zsh/plugins` |
| `.tmux.conf` | tmux |
| `.config/kitty/` | терминал |
| `.config/scripts/` | `tmux-sessionizer`, `fzf-notes`, `fzf-ssh` |
| `.config/nvim/` | **submodule** → [van9md/kickstart.nvim](https://github.com/van9md/kickstart.nvim) |

## Установка на новой машине

Зависимости:

```sh
sudo dnf install -y zsh tmux kitty stow git neovim fzf ripgrep bat eza wl-clipboard

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

Конфиги:

```sh
git clone --recurse-submodules git@github.com:van9md/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

Дальше `C-a I` в tmux, чтобы tpm подтянул плагины.

Если склонировал без `--recurse-submodules`, `.config/nvim` будет пустой — `git submodule update --init`.

Настройки git для этого репозитория (не версионируются, поэтому на каждой машине заново):

```sh
git config push.recurseSubmodules on-demand
git config submodule.recurse true
git config status.submodulesummary 1
git config diff.submodule log
```

## Как коммитить

Обычные конфиги — как всегда. Конфиг nvim — в два захода, это отдельный репозиторий,
и `dotfiles` хранит только указатель на его коммит:

```sh
cd ~/.config/nvim
git add -A && git commit -m "feat: add rust lsp"

cd ~/dotfiles
git add .config/nvim && git commit -m "chore(nvim): bump submodule"
git push
```

`push.recurseSubmodules=on-demand` заодно отправит и форк — без этого на другой машине
submodule не развернулся бы.
