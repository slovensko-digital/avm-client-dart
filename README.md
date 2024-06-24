# Autogram Sign

REST API klient v jazyku Dart pre `Autogram v mobile server`. Poskytuje [`IAutogramService`](lib/src/iautogram_service.dart) podľa [AVM server API](https://generator3.swagger.io/index.html?url=https://autogram.slovensko.digital/openapi.yaml)

Ide o súčasť riešenia [Autogram v mobile](https://sluzby.slovensko.digital/autogram-v-mobile/), ktoré vytvorili freevision s.r.o., Služby Slovensko.Digital s.r.o. a dobrovoľníkmi pod EUPL-1.2 licenciou. Prevádzkovateľom je Služby Slovensko.Digital s.r.o.. Prípadné issues riešime v [GitHub projekte](https://github.com/orgs/slovensko-digital/projects/5) alebo rovno v tomto repozitári.
Projekt sa skladá z viacerých častí:
- **Server**
  - [AVM server](https://github.com/slovensko-digital/avm-server) - Ruby on Rails API server poskytujúci funkcionalitu zdieľania a podpisovania dokumentov.
  - [AVM service](https://github.com/slovensko-digital/avm-service) - Java microservice využívajúci Digital Signature Service knižnicu pre elektronické podpisovanie a generovanie vizualizácie dokumentov.
- **Mobilná aplikácia**
  - [AVM app Flutter](https://github.com/slovensko-digital/avm-app-flutter) - Flutter aplikácia pre iOS a Android.
  - 👉 [AVM client Dart](https://github.com/slovensko-digital/avm-client-dart) - Dart API klient pre komunikáciu s AVM serverom.
  - [eID mSDK Flutter](https://github.com/slovensko-digital/eidmsdk-flutter) - Flutter wrapper "štátneho" [eID mSDK](https://github.com/eIDmSDK) pre komunikáciu s občianskym preukazom.
- [**Autogram extension**](https://github.com/slovensko-digital/autogram-extension) - Rozšírenie do prehliadača, ktoré umožňuje podpisovanie priamo na štátnych portáloch.


## Ako si to rozbehnúť

Repozitár sa volá `avm-client-dart`, ale knižnica sa potom zvykne používať `autogram_sign`, takže odporúčame si repozitár naklonovať práve do adresára `autogram_sign`.

Vygenerovanie kódu:

```shell
fvm dart run build_runner build --delete-conflicting-outputs
```

Testy:

```shell
fvm dart run test
```
