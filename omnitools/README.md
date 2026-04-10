# OmniTools

Add-on de Home Assistant que empaqueta [OmniTools](https://omnitools.app) y lo sirve dentro de Home Assistant via ingress.

## Base tecnica

- Upstream fijado a `v0.6.0`.
- Build desde el repo oficial `https://github.com/iib0011/omni-tools`.
- Serving con `nginx` en el puerto interno `8099`.
- Acceso principal por ingress; el servidor deniega trafico que no venga del proxy de Supervisor (`172.30.32.2`).

## Compatibilidad con ingress

El upstream no es compatible con subpath de ingress tal cual porque:

- `index.html` usa assets absolutos como `/favicon.ico`.
- `i18next` carga traducciones desde `/locales/...`.
- `BrowserRouter` no define `basename`.

La build del add-on aplica un parche minimo para:

- generar assets relativos con Vite,
- calcular el base path de Home Assistant ingress en runtime,
- usar ese base path en el router y en la carga de traducciones,
- mantener `try_files` para refresh directo de rutas SPA.

## Limitaciones de la v1

- Algunas herramientas del upstream cargan WASM desde CDNs externos en tiempo de ejecucion. Eso no rompe ingress, pero no es una instalacion completamente offline.
- Las funciones de clipboard dependen de permisos del navegador/iframe y pueden variar segun el cliente usado para abrir Home Assistant.
- El add-on queda endurecido para ingress y no expone puertos por defecto.
