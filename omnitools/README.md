# OmniTools

Wrapper fuente de Home Assistant para [OmniTools](https://omnitools.app), pensado para ser consumido por el repo padre.

## Base tecnica

- Upstream fijado a `v0.6.0`.
- La referencia canonica del build para repositorios consumidores es `APP_REPO=https://github.com/iib0011/omni-tools.git` y `APP_REF=v0.6.0`.
- El `Dockerfile` es la fuente canonica del build; no se usa `build.yaml`.
- Build desde el repo oficial `https://github.com/iib0011/omni-tools`.
- Serving con `nginx` en el puerto interno `8099`.
- Acceso principal por ingress; el servidor deniega trafico que no venga del proxy de Supervisor (`172.30.32.2`).

## Contrato canónico

- Este directorio `omnitools/` es la superficie estable que puede consumir el repo padre.
- Los archivos canónicos son `config.yaml`, `Dockerfile`, `run.sh`, `nginx.conf` y `patches/omnitools-ingress-v0.6.0.patch`.
- La version de la app, `APP_REPO` y `APP_REF` deben moverse en sincronía con la tag publicada del repo cuando cambie el wrapper.

## Compatibilidad con ingress

El upstream no es compatible con subpath de ingress tal cual porque:

- `index.html` usa assets absolutos como `/favicon.ico`.
- `i18next` carga traducciones desde `/locales/...`.
- `BrowserRouter` no define `basename`.

La build de la app aplica un parche minimo para:

- generar assets relativos con Vite,
- calcular el base path de Home Assistant ingress en runtime,
- usar ese base path en el router y en la carga de traducciones,
- mantener `try_files` para refresh directo de rutas SPA.

## Limitaciones de la v1

- Algunas herramientas del upstream cargan WASM desde CDNs externos en tiempo de ejecucion. Eso no rompe ingress, pero no es una instalacion completamente offline.
- Las funciones de clipboard dependen de permisos del navegador/iframe y pueden variar segun el cliente usado para abrir Home Assistant.
- La app queda endurecida para ingress y no expone puertos por defecto.
