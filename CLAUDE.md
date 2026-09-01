# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`autogram_sign` — a Dart (pure Dart, non-Flutter) REST API client package for the
[AVM server](https://github.com/slovensko-digital/avm-server) ("Autogram v mobile"), consumed by the
[avm-app-flutter](https://github.com/slovensko-digital/avm-app-flutter) app. The repo directory is
`avm-client-dart` but the package is `autogram_sign`; cloning into a directory named `autogram_sign`
avoids confusion in path dependencies.

Public API surface is `lib/autogram_sign.dart` — anything not exported there is internal.

## Commands

The SDK is pinned via FVM (`.fvmrc` → Flutter 3.19.6 / Dart 3.3.4). Prefix with `fvm` locally;
CI (`.github/workflows/ci.yml`) uses plain `dart` with `setup-dart` SDK 3.3.4.

```shell
fvm dart pub get

# Regenerate the REST client from the OpenAPI schema (see "Code generation")
fvm dart run build_runner build --delete-conflicting-outputs

# Same checks as CI
fvm dart analyze --fatal-infos
fvm dart test

# Single test file / single test by name
fvm dart test test/unwap_test.dart
fvm dart test -n 'unwrap returns value for 200 status code'

# Drive the whole signing flow against the live server (see "End-to-end example")
fvm dart run bin/example.dart
```

## Code generation

`lib/generated/` is **generated but committed**. Never hand-edit it; change the schema and regenerate.

1. Refresh the schema: `curl -o lib/swagger/autogram.yaml https://autogram.slovensko.digital/openapi.yaml`
2. **Run `fvm dart run build_runner clean` first.** `build_runner` does not track
   `lib/swagger/*.yaml` as a build input, so after a schema refresh a plain `build` reports
   `Succeeded ... with 0 outputs (0 actions)` and regenerates nothing — which reads exactly like
   "the schema didn't change". Always `clean` before regenerating a refreshed schema.
3. Regenerate (command above). `build.yaml` points `swagger_dart_code_generator` at
   `lib/swagger/` → `lib/generated/`, producing the Chopper service `Autogram`, JSON models, and enums.
4. `analysis_options.yaml` excludes `lib/generated/*.dart` from analysis, so generation churn there
   won't fail `dart analyze`.

A schema update can silently change model nullability and break `AutogramService`'s return types
(see CHANGELOG 0.4.3–0.4.5) — after regenerating, run analyze + tests and bump
`pubspec.yaml` `version` plus a `CHANGELOG.md` entry. The unit tests cover only `unwrap` and
`keys`, so `bin/example.dart` is the only thing that exercises the real wire format — run it too.

## Architecture

Three layers, each with a distinct responsibility:

- **`lib/generated/autogram.swagger.dart`** — raw generated Chopper client (`Autogram`). Methods are
  named after the HTTP route (`documentsGuidDatatosignPost`) and return `Response<T>`.
- **`lib/src/iautogram_service.dart`** — `IAutogramService`, the hand-written domain-language
  interface (`setDataToSign`, `signDocument`, …). This is the contract callers depend on and mock;
  each method's dartdoc links the corresponding swagger operation.
- **`lib/src/autogram_service.dart`** — `AutogramService`, the only implementation. Each method is a
  thin adapter: call the generated method, `.then(unwrap)`, and project to the domain type. Default
  base URL is `https://autogram.slovensko.digital/api/v1`; the local server is
  `http://localhost:3000/api/v1`.

Cross-cutting pieces:

- **`unwrap` (`lib/src/response_functions.dart`)** is the single error boundary. It returns
  `response.body` on success, otherwise throws `ServiceException`, parsing the error body as JSON
  (`code`/`message`/`details`) and falling back to the `<title>` of an HTML error page, then to
  `HTTP <status> error`. All error-shape handling belongs here, not in `AutogramService`.
- **`AutogramAuthenticator` (`lib/src/autogram_authenticator.dart`)** is a Chopper
  `HeadersInterceptor` that sets `Accept: application/json` and `X-Encryption-Key`. It overrides
  `intercept` rather than passing a static header map because the encryption key is supplied as a
  `String Function()` and must be re-evaluated per request.
- **`lib/src/keys.dart`** — `generateEncryptionKey()` (base64 of 32 secure random bytes, the value
  behind `X-Encryption-Key`) and `generateAsymmetricKeyPair()` (EC), plus PEM-encoding extensions on
  `PublicKey`/`PrivateKey`, via `basic_utils`/`pointycastle`.

`dart:io` is used (`Platform.operatingSystem` in `registerDevice`), so this package is not
web-compatible.

## End-to-end example

`bin/example.dart` walks the full signing flow — `createDocument` → `getDocumentParameters` →
`getDocumentVisualization` → `setDataToSign` → local signing → `signDocument` →
`getDocumentValidation` → `deleteDocument` — printing each step. It is a manual tool, not a test:
CI never runs it, and it talks to the **production** server hardcoded in `_baseUrl` (edit that
constant for localhost), creating a real document each run.

Things to know before changing it:

- **`setDataToSign` is mandatory before `signDocument`.** `SignRequestBody.dataToSignStructure`
  must be the exact `DataToSignStructure` the server returned, so the server can verify that what
  was signed is what it handed out.
- **The signer is a hardcoded self-signed `CN=John Doe` RSA-2048 key + certificate**, checked in
  deliberately. `X-Encryption-Key` still comes from `generateEncryptionKey()` per run.
- **A non-`TOTAL_PASSED` validation in step 7 is the expected result**, not a regression — a
  self-signed certificate has no trust anchor, so the server reports `INDETERMINATE` /
  qualification `NA`.
- **Step 8 cleans up after itself.** `DELETE /documents/{guid}` returned HTTP 500 for every
  document until it was fixed server-side; as of 2026-09-01 it answers 204 and the run leaves
  nothing behind. A cleanup failure is reported to stderr without failing the run.

## Adding a new API call

Add the method to `IAutogramService` with a dartdoc link to the swagger operation, implement it in
`AutogramService` as a `.then(unwrap)` adapter over the generated method, then bump the version and
add a `CHANGELOG.md` entry.
