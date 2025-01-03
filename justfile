alias b := build
alias d := dev
alias c := check
alias ce := check-eslint
alias cp := check-prettier
alias f := fix
alias fe := fix-eslint
alias fp := fix-prettier
alias wc := watch-check

watchexec_warn := '''
	Install watchexec to automatically run tasks on file change.
	See https://github.com/watchexec/watchexec#install
  '''

watchexec_exists := `command -v watchexec`

# Default recipe
check: check-eslint check-prettier check-astro

check-astro:
  pnpm run check:astro

dev:
  pnpm dev

build: check
  pnpm build

check-eslint:
  pnpm run check:eslint

check-prettier:
  pnpm run check:prettier


fix-eslint:
  pnpm run fix:eslint
fix-prettier:
  pnpm run fix:prettier

fix: fix-eslint fix-prettier

watch-check:
  {{if watchexec_exists != "" { \
     'watchexec -e astro,js,html,css,ts just check' \
    } else { 'echo ' + quote(watchexec_warn) } \
  }}
