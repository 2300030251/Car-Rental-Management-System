# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Babel](https://babeljs.io/) (or [oxc](https://oxc.rs) when used in [rolldown-vite](https://vite.dev/guide/rolldown)) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## React Compiler

The React Compiler is not enabled on this template because of its impact on dev & build performances. To add it, see [this documentation](https://react.dev/learn/react-compiler/installation).

## Expanding the ESLint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.

## Docker deployment

This project now includes a Docker multi-stage build and a docker-compose configuration for single-command deployment of the built frontend served by nginx.

Files added:
- `Dockerfile` - multi-stage build (Node build -> nginx serve)
- `nginx.conf` - nginx configuration with SPA fallback
- `.dockerignore` - reduce build context
- `docker-compose.yml` - single-command deployment (maps host 8080 -> container 80)

Quick start (Windows PowerShell):

```powershell
# build and start in detached mode
docker-compose up -d --build

# view logs
docker-compose logs -f

# stop and remove
docker-compose down
```

The frontend will be available at http://localhost:8080

Committing and pushing these changes to GitHub:

```powershell
git add Dockerfile nginx.conf .dockerignore docker-compose.yml README.md
git commit -m "chore: add docker-compose deployment for frontend"
git push origin main
```

After pushing, copy the GitHub repository URL and submit it to the provided form.
