# OmniTools

Repositorio hijo fuente para el wrapper de Home Assistant de OmniTools.

Este repo no pretende ser el repositorio final de apps de Home Assistant. El repositorio final y publicable es el repo padre; este repo expone una superficie estable para que el padre pueda sincronizar la app `omnitools` por tag sin reglas especiales.

## Contrato estable

- La carpeta canónica consumible por el repo padre es `omnitools/`.
- La versión de la app debe seguir semver estable y alinearse con la tag del repo, por ejemplo `0.6.0` con `v0.6.0`.
- La referencia al upstream se expone con `APP_REPO` y `APP_REF`.
- El `Dockerfile` es la fuente canónica del build, alineado con la política de Home Assistant `2026.04`.
- Cada cambio en los artefactos canónicos debe ir acompañado de una nueva tag estable.

## Artefactos canónicos

- `omnitools/config.yaml`
- `omnitools/Dockerfile`
- `omnitools/run.sh`
- `omnitools/nginx.conf`
- `omnitools/patches/omnitools-ingress-v0.6.0.patch`

## Objetivo

- Mantener el runtime y el parche de ingress en un repo hijo estable.
- Permitir que el repo padre copie o sincronice `omnitools/` por tag sin depender de detalles internos del repo.
