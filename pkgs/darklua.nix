{
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "darklua";
  version = "0.17.3-dirty";

  src = fetchFromGitHub {
    owner = "seaofvoices";
    repo = "darklua";
    rev = "7050f5c8281f202275b0a919ecbaa3c5e5f1a7d1";
    hash = "sha256-xwsrmJdaMfGdx30akSnaPJN4mQL6nklZIwr8reoLNRQ=";
  };

  cargoHash = "sha256-kFMMiKLpfvJCKdJXilmYz0i2xJ7iYdUu5yWhCk3tBis=";

  # error: linker `aarch64-linux-gnu-gcc` not found
  postPatch = ''
    rm .cargo/config.toml
  '';

  meta = {
    mainProgram = "darklua";
  };
}
