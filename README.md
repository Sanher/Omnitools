# OmniTools Wrapper Source

Runtime wrapper source para OmniTools consumible por el repo padre de Home Assistant por tag.

Este repo no es el add-on final publicado. Solo contiene los artefactos del wrapper
que el repo padre puede consumir cuando quiera sincronizar una tag estable.

## Qué vive aquí

- `run.sh`: entrypoint de runtime del wrapper
- `nginx.conf`: configuracion nginx usada por el wrapper
- `patches/`: parche local aplicado al upstream para compatibilidad con ingress
- `wrapper-source.yaml`: metadata pequena para que el padre pueda leer `upstream_repo` y `upstream_ref`
- `VERSION`: version visible del wrapper-source consumible por el padre
- `CHANGELOG.md`: historial corto de cambios del wrapper

## Qué no vive aquí

- no `repository.yaml`
- no `build.yaml`
- no metadatos finales publicados del add-on
- no configuracion final de Supervisor para Home Assistant

## Modelo de consumo

El repo padre puede consumir este wrapper-source por tag y sincronizar:

- `version` desde `VERSION`
- `APP_REF` desde `wrapper-source.yaml`

El repo padre sigue siendo el unico repositorio final publicado para Home Assistant.

## Artefactos canónicos del wrapper-source

- `run.sh`
- `nginx.conf`
- `patches/omnitools-ingress-v0.6.0.patch`
- `wrapper-source.yaml`
- `VERSION`

## Regla de coordinacion

- Cada cambio del wrapper-source debe publicarse con una nueva tag semver estable.
- Cambios de wrapper o de upstream como `upstream_ref` deben coordinarse explicitamente en el repo padre.
- El padre no debe deducir automaticamente archivos finales de add-on desde una superficie tipo `omnitools/`.
